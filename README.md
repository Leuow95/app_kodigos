# Passos para Executar a Aplicação Flutter (Versão 3.29.0)

## 1. Requisitos
Antes de executar a aplicação, certifique-se de que possui os seguintes requisitos instalados:

- [Flutter 3.29.0](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (instalado com o Flutter)
- Android Studio ou VS Code (com extensão Flutter e Dart)
- Emulador Android ou dispositivo físico configurado

## 2. Configuração do Ambiente

1. Verifique a instalação do Flutter:
   ```sh
   flutter --version
   ```
   O retorno deve exibir **Flutter 3.29.0**.

2. Confirme se todas as dependências estão configuradas corretamente:
   ```sh
   flutter doctor
   ```
   Se houver problemas, siga as recomendações do `flutter doctor` para resolvê-los.

## 3. Clonando o Repositório
Se ainda não clonou o repositório do seu projeto, faça isso com:
```sh
git clone https://github.com/Leuow95/app_kodigos.git
```

## 4. Instalando Dependências
Execute o seguinte comando na raiz do projeto:
```sh
flutter pub get
```
Isso baixará todas as dependências listadas no `pubspec.yaml`.

## 5. Configuração de Ambiente (Se Necessário)
Caso utilize arquivos de ambiente, como `.env`, configure-os conforme a documentação do projeto.

## 6. Executando a Aplicação

### Em um Emulador ou Dispositivo Físico
1. Conecte um dispositivo ou inicie um emulador:
   ```sh
   flutter devices
   ```
   Escolha o dispositivo desejado.

2. Execute a aplicação:
   ```sh
   flutter run
   ```

### Em um Navegador (Flutter Web)
Se o projeto suportar Flutter Web:
```sh
flutter run -d chrome
```

### Em um Servidor de Desenvolvimento
Se precisar iniciar um servidor local:
```sh
flutter serve
```

## 7. Compilando para Produção

### Android (APK/Bundle)
Para gerar um APK:
```sh
flutter build apk
```
Para gerar um AAB (usado na Play Store):
```sh
flutter build appbundle
```

### iOS
Certifique-se de ter um Mac com Xcode instalado:
```sh
flutter build ios
```

### Web
Para compilar a aplicação web:
```sh
flutter build web
```
Os arquivos serão gerados na pasta `build/web`.


---

Seguindo esses passos, você conseguira executar e testar sua aplicação Flutter na versão 3.29.0 com sucesso.