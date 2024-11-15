import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutables.
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkModeProvider = StateProvider((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

// StateNotifierProvider<Null, Object?> me permite mantener un estado un poco
// más complejo, ese estado es administrado por el ThemeNotifier (1er valor).
// El estado interno de ThemeNotifier es una instancia de AppTheme (2do valor)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o Notifier - Es la clase que va a controlar el estado de AppTheme()
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  // El llamado a 'super' es necesario para establecer el estado inicial del StateNotifier,
  // creando una instancia de AppTheme con sus valores por defecto.
  ThemeNotifier() : super(AppTheme());

  // Dentro del StateNotifier voy a tener acceso a la propiedad llamada 'state',
  // que es de tipo AppTheme.
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
