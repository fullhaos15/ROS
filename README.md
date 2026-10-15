# FitLife — фитнес-приложение на Flutter

Учебный проект по курсу «Pro Flutter уроки на русском».

## Запуск в VS Code
1. Установите Flutter SDK и расширения VS Code: **Flutter** и **Dart**.
2. Создайте каркас проекта (в пустой папке): `flutter create fitlife`
3. Замените в созданном проекте `pubspec.yaml` и папку `lib/` файлами из этого архива.
4. `flutter pub get`
5. Запустите: F5 в VS Code (выберите устройство/эмулятор) или `flutter run`.

## Темы курса → где в проекте
| Урок | Файл |
|---|---|
| Структура приложения | lib/main.dart |
| Stateless виджеты | widgets/workout_card.dart, main.dart |
| Stateful виджеты | main_shell.dart, timer_screen.dart, profile_screen.dart |
| Container + BoxDecoration | почти везде (карточки, баннеры) |
| Column / Row | home_screen.dart, workout_detail_screen.dart |
| ListView | home_screen.dart, workouts_screen.dart |
| GridView | home_screen.dart (категории) |
| PageView | home_screen.dart (баннеры) |
| Stack / Positioned / IndexedStack / AnimatedContainer | workout_detail_screen.dart, main_shell.dart, profile_screen.dart |
| Шрифты (google_fonts) | theme.dart |
| Своя тема (ThemeData) | theme.dart |
| Navigator push/pop/pushNamed, arguments, onGenerateRoute | main.dart, workout_card.dart, workout_detail_screen.dart |
| Desktop / Web (бонус) | `flutter run -d windows` / `-d chrome` |

## Идеи для развития
- Картинки (Image.asset) и SVG через flutter_svg
- Сохранение прогресса (shared_preferences)
- Графики недели, календарь тренировок
