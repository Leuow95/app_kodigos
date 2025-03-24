import 'dart:convert';
import 'dart:io';

import 'package:app_kodigos/src/order/entities/order_request_dto.dart';
import 'package:app_kodigos/src/order/presenter/cubit/order_cubit.dart';
import 'package:app_kodigos/src/order/presenter/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final checklistController = TextEditingController();
  XFile? _image;

  final List<String> _services = [
    'Limpeza de hardware',
    'Verificação de software',
    'Atualizações de sistema',
    'Verificação de vírus',
    'Backup de dados',
  ];
  final List<bool> _selectedServices = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderCreated) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Ordem criada com sucesso!')));
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Nova Ordem')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Descrição'),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        for (int i = 0; i < _services.length; i++)
                          CheckboxListTile(
                            title: Text(_services[i]),
                            value: _selectedServices[i],
                            onChanged: (value) {
                              setState(() {
                                _selectedServices[i] = value ?? false;
                              });
                            },
                          ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Selecionar Foto'),
                  ),
                  if (_image != null) Image.file(File(_image!.path)),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Criar Ordem'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<String> _imageToBase64() async {
    if (_image == null) return '';
    final bytes = await _image!.readAsBytes();
    return base64Encode(bytes);
  }

  void _submitForm() async {
    final photoData = await _imageToBase64();
    final order = OrderRequestDto(
      description: descriptionController.text,
      checklist: checklistController.text.split(','),
      photoData: photoData,
    );

    context.read<OrderCubit>().createOrder(order);
  }
}
