# Clean Architecture em Flutter
---

## 🔑 Conceitos principais da Clean Architecture em Flutter
- **Separação de responsabilidades**: cada camada tem um papel claro.
- **Independência de frameworks**: o núcleo da aplicação não depende diretamente do Flutter.
- **Testabilidade**: lógica de negócio isolada facilita testes unitários.
- **Escalabilidade**: projetos grandes permanecem organizados.

---

## 📐 Estrutura típica de camadas

| Camada | Função | Exemplos em Flutter |
|--------|--------|----------------------|
| **Domínio** | Regras de negócio, entidades e casos de uso | Classes `UseCase`, modelos de entidade |
| **Dados** | Implementação de repositórios, acesso a APIs e banco | `RepositoryImpl`, chamadas HTTP, SQLite |
| **Apresentação** | Interface com usuário, gerenciamento de estado | `Bloc`, `Provider`, `Riverpod`, `UI Widgets` |

---

## 🚀 Passos para aplicar no Flutter
1. **Criar entidades no domínio**  
   - Ex.: `User`, `Product`, `Order`.
2. **Definir casos de uso (UseCases)**  
   - Ex.: `GetUserProfile`, `CreateOrder`.
3. **Implementar repositórios na camada de dados**  
   - Interfaces no domínio, implementações concretas no módulo de dados.
4. **Gerenciar estado na apresentação**  
   - Usar **BLoC**, **Provider** ou **Riverpod** para conectar casos de uso à UI.
5. **Organizar pastas**  
   ```
   lib/
     domain/
       entities/
       usecases/
       repositories/
     data/
       models/
       repositories/
       datasources/
     presentation/
       blocs/
       pages/
       widgets/
   ```

---

## ⚖️ Comparação de padrões de gerenciamento de estado

| Padrão | Vantagens | Desvantagens |
|--------|-----------|--------------|
| **BLoC** | Estrutura clara, separa eventos e estados, ideal para apps complexos | Verboso, curva de aprendizado maior |
| **Provider** | Simples, integrado ao Flutter, bom para projetos menores | Pode ficar confuso em apps grandes |
| **Riverpod** | Mais moderno, seguro em tempo de compilação, flexível | Comunidade menor que Provider/BLoC |

---

## 📌 Boas práticas
- **Nomear pastas e arquivos de forma clara** (ex.: `user_repository.dart`).
- **Evitar dependências diretas entre camadas** (usar interfaces).
- **Escrever testes unitários para casos de uso e repositórios**.
- **Manter a UI “burra”**: lógica deve estar em blocos ou providers, não nos widgets.

---
## 📚 Recursos adicionais
- [Clean Architecture por Robert C. Martin](https://www.amazon.com.br/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164)
- [Flutter Clean Architecture Package](https://pub.dev/packages/flutter_clean_architecture) 