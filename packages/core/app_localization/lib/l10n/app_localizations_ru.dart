// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get app_title => 'Игра в шпиона';

  @override
  String get game_theme => 'Тема игры';

  @override
  String get home_screen_title => 'Игра в шпиона';

  @override
  String get players => 'Игроки';

  @override
  String get spies => 'Шпионы';

  @override
  String get game_time => 'Время игры';

  @override
  String get minutes_short => 'мин';

  @override
  String get game_theme_label => 'Тема игры';

  @override
  String get start_game => 'Начать игру';

  @override
  String get settings => 'Настройки';

  @override
  String get error_fetching_word => 'Ошибка получения слова: ';

  @override
  String get default_theme => 'Общественные места';

  @override
  String get roles_screen_title => 'Роли';

  @override
  String get tap_to_see_role => 'Нажмите, чтобы увидеть свою роль';

  @override
  String get you_are_spy => 'Вы шпион';

  @override
  String get you_are_citizen => 'Вы мирный житель';

  @override
  String get theme => 'Тема';

  @override
  String get word => 'Слово';

  @override
  String get try_to_blend_in => 'Постарайтесь не выделяться!';
}
