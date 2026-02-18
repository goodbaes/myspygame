# Contributing to Spy Game

Thank you for your interest in contributing! This project maintains high engineering standards to ensure it remains a "Lead Engineer" level showcase.

## 📜 Coding Standards

- **Static Analysis**: All code must pass `flutter analyze` with no warnings. Our `analysis_options.yaml` uses a strict set of rules.
- **Formatting**: Always run `dart format .` before committing.
- **Testing**: Every new feature or fix must be accompanied by appropriate unit or widget tests.

## 🛠 Development Workflow

1. **Setup**: Run `make get` to fetch dependencies for all modules.
2. **Implementation**: Build your feature in a dedicated package under `packages/features/`.
3. **Verification**:
   - Run `make test` to ensure no regressions.
   - Run `make analyze` to check against lint rules.
4. **Pull Request**: Ensure your PR includes a clear description of changes and links to any relevant documentation.

## 🧪 Testing Strategy

Implementation should follow the "Testing Pyramid":

- **Unit Tests**: For domain logic and state management.
- **Widget Tests**: For UI components and user interactions.
- **Golden Tests**: (Coming soon) For visual regression tracking.

## 📝 Commit Messages

We follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):

- `feat:` for new features.
- `fix:` for bug fixes.
- `docs:` for documentation updates.
- `refactor:` for code changes that neither fix a bug nor add a feature.
