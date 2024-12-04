# Repositório de Servidores com Horse Framework

Este repositório contém exemplos de implementação de servidores criados com a linguagem **Delphi** e o framework **Horse**, demonstrando diferentes abordagens para criação de APIs:

- **Console:** Servidores executados via terminal.
- **Services:** Servidores configurados para rodar como serviços do Windows.
- **VCL:** Servidores integrados a aplicações com interface gráfica.

## Estrutura do Repositório

```
├── win-console
│   ├── api
│   │   ├── provider
│   │   ├── controllers
│   │   └── routers
│   ├── exe
│   │   ├── database
│   │   │   ├── database.s3db
│   │   ├── win_console.exe
├── win-service
│   ├── api
│   │   ├── provider
│   │   ├── controllers
│   │   └── routers
│   ├── form-service
│   ├── exe
│   │   ├── database
│   │   │   ├── database.s3db
│   │   ├── win-service.exe
├── win-vcl
|   ├── main.dpr
│   ├── api
│   │   ├── provider
│   │   ├── controllers
│   │   └── routers
│   ├── forms
│   ├── imagens
│   ├── exe
│   │   ├── database
│   │   │   ├── database.s3db
│   │   ├── win-vcl.exe

```

### Descrição dos Diretórios
- **`win-console`:** Contém a implementação de um servidor no formato console.
- **`win-service`:** Contém a implementação de um servidor configurado como serviço do Windows.
- **`win-vcl`:** Contém a implementação de um servidor em uma aplicação VCL.

---

## Requisitos

1. **Delphi:** IDE com suporte para o framework Horse.
2. **Framework Horse:** Instalado em sua IDE.
3. **FastMM4:** Para gerenciamento de memória eficiente (opcional, mas recomendado).
4. **Windows:** Para execução dos exemplos de serviço e VCL.

---

## Contribuição

Contribuições são bem-vindas! Para contribuir:
1. Crie um fork deste repositório.
2. Faça suas modificações.
3. Envie um pull request explicando suas alterações.



