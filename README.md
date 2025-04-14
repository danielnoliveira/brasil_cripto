# BrasilCripto

Este é um projeto Flutter desenvolvido como parte de um teste técnico. O aplicativo utiliza variáveis de ambiente, que devem ser configuradas antes da execução.

## 📦 Requisitos

- **Flutter**: 3.27.0

## ⚙️ Configuração do ambiente

Antes de executar o projeto, é necessário criar um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```env
COINGECKO_API_KEY=_coingecko_api_key_
COINGECKO_API_URL=https://api.coingecko.com/api/v3/
```

E também executar o comando:
```
flutter pub run build_runner build --delete-conflicting-outputs
```
antes de executar a aplicaçao