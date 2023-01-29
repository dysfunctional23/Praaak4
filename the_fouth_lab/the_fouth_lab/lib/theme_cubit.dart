import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> changeTheme(bool isDark) async {
    if (isDark == false) {
      emit(ThemeError());
    } else {
      emit(ThemeLoaded());
    }
  }
}
