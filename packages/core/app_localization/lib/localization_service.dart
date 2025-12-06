import 'l10n/app_localizations.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();
  factory LocalizationService() => _instance;
  LocalizationService._internal();

  late AppLocalizations _l10n;
  bool _isInitialized = false;

  // 💡 Метод init теперь не проверяет, инициализировался ли он
  // и просто обновляет внутреннюю ссылку на новый объект.
  void update(AppLocalizations l10n) {
    _l10n = l10n;
    _isInitialized = true;
    // Если вам нужно оповещать BLoC'и/сервисы о смене языка,
    // здесь можно добавить broadcast/stream.
  }

  AppLocalizations get l10n {
    if (!_isInitialized) {
      throw StateError("LocalizationService не инициализирован.");
    }
    return _l10n;
  }
}

AppLocalizations get l10n {
  return LocalizationService().l10n;
}
