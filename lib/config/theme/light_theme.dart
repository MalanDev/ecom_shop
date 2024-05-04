import 'package:flutter/material.dart';

import '../color_manager.dart';
import '../font_manager.dart';
import '../styles_manager.dart';
import '../values_manager.dart';

class LightTheme {
  ThemeData get theme => ThemeData(
      useMaterial3: false,
      //main colors of the app
      primaryColor: AppColorManager.primary,
      primaryColorLight: AppColorManager.primary.withOpacity(0.7),
      primaryColorDark: AppColorManager.primary,
      disabledColor: AppColorManager.grey,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColorManager.grey),
      splashColor: AppColorManager.primary.withOpacity(0.7),
      scaffoldBackgroundColor: AppColorManager.white,

      // card view theme
      cardTheme: CardTheme(
        color: AppColorManager.white,
        shadowColor: AppColorManager.grey,
        elevation: AppSize.s4,
      ),
      // App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColorManager.white,
        elevation: AppSize.s4,
        shadowColor: AppColorManager.primary.withOpacity(0.7),
        iconTheme: const IconThemeData(color: AppColorManager.black),
        titleTextStyle: getRegularStyle(fontSize: FontSize.s16)
            .apply(color: AppColorManager.black),
      ),
      // Button theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppColorManager.grey1,
        buttonColor: AppColorManager.primary,
        splashColor: AppColorManager.primary.withOpacity(0.7),
      ),
      iconTheme: const IconThemeData(color: AppColorManager.black),
      listTileTheme: ListTileThemeData(
        iconColor: AppColorManager.primary,
        textColor: AppColorManager.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColorManager.white,
          selectedItemColor: AppColorManager.primary,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColorManager.grey1),

      //Tab
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColorManager.primary,
        labelColor: AppColorManager.black,
      ),

      //Switch
      switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(AppColorManager.white),
      ),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(),
          backgroundColor: AppColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
      ),
      //Text Theme
      textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(fontSize: FontSize.s16)
            .apply(color: AppColorManager.black),
        titleMedium: getMediumStyle(fontSize: FontSize.s14)
            .apply(color: AppColorManager.black),
        bodySmall: getRegularStyle().apply(color: AppColorManager.black),
        bodyLarge: getRegularStyle().apply(color: AppColorManager.black),
      ),

      //input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle().apply(color: AppColorManager.grey1),
        labelStyle: getMediumStyle().apply(color: AppColorManager.darkGrey),
        errorStyle: getRegularStyle().apply(color: AppColorManager.red),
        // enable border
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // focused border
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // error border
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColorManager.red, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ),
      dividerColor: AppColorManager.grey,
      popupMenuTheme: PopupMenuThemeData(
        color: AppColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        elevation: AppSize.s8,
      ),
      chipTheme: ChipThemeData(
        selectedColor: AppColorManager.primary,
        checkmarkColor: AppColorManager.white,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColorManager.primary,
      ));
}
