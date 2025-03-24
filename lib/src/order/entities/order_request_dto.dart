class OrderRequestDto {
  final String description;
  final List<String> checklist;
  final String? photoData;

  OrderRequestDto({
    required this.description,
    required this.checklist,
    this.photoData,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'checklist': checklist,
      'photoData': photoData,
    };
  }
}
