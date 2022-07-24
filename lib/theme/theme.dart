import 'package:flutter/material.dart';

part 'constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.amber,
      appBarTheme: const AppBarTheme(centerTitle: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPrimary: Colors.black87,
          primary: Colors.amber,
          minimumSize: const Size(Dimens.buttonHeight, Dimens.buttonHeight),
          shadowColor: Colors.transparent,
          animationDuration: Durations.buttonTap,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Dimens.radiusXXS)),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.black12,
        suffixIconColor: Colors.black12,
        constraints: const BoxConstraints(
          minHeight: Dimens.textFieldHeight,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorMaxLines: 2,
        filled: true,
        isDense: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber[700]!,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
