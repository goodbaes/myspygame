import 'l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

/// A [BuildContext] extension that provides convenient access to localizations.
///
/// Usage: `context.l10n.some_key`
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
