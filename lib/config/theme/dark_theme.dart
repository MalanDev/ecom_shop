import 'package:flutter/material.dart';

import '../color_manager.dart';
import '../font_manager.dart';
import '../styles_manager.dart';
import '../values_manager.dart';

class DarkTheme {
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
        scaffoldBackgroundColor: AppColorManager.black,

        // card view theme
        cardTheme: CardTheme(
          color: AppColorManager.grey.withOpacity(0.5),
          shadowColor: AppColorManager.black,
          elevation: AppSize.s4,
        ),
        // App bar theme
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColorManager.black,
          elevation: AppSize.s4,
          shadowColor: AppColorManager.primary.withOpacity(0.7),
          iconTheme: const IconThemeData(color: AppColorManager.white),
          titleTextStyle: getRegularStyle(fontSize: FontSize.s16)
              .apply(color: AppColorManager.white),
        ),
        // Button theme
        buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: AppColorManager.grey1,
          buttonColor: AppColorManager.primary,
          splashColor: AppColorManager.primary.withOpacity(0.7),
        ),
        iconTheme: const IconThemeData(color: AppColorManager.white),
        listTileTheme: ListTileThemeData(
          iconColor: AppColorManager.primary,
          textColor: AppColorManager.white,
        ),

        //Tab
        tabBarTheme: TabBarTheme(indicatorColor: AppColorManager.primary),

        //Switch
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStatePropertyAll(AppColorManager.primary),
        ),
        dialogBackgroundColor: AppColorManager.grey2,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColorManager.black,
            selectedItemColor: AppColorManager.primary,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: AppColorManager.grey1),

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
          bodySmall: getRegularStyle().apply(color: Colors.white),
          bodyLarge: getRegularStyle().apply(color: Colors.white),
          bodyMedium: getRegularStyle().apply(color: Colors.white),
          titleMedium:
              getMediumStyle(fontSize: FontSize.s14).apply(color: Colors.white),
          titleLarge: getRegularStyle().apply(color: Colors.white),
          titleSmall: getRegularStyle().apply(color: Colors.white),
          headlineLarge: getRegularStyle().apply(color: Colors.white),
          headlineMedium: getRegularStyle().apply(color: Colors.white),
          headlineSmall: getRegularStyle().apply(color: Colors.white),
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
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: AppColorManager.grey,
            shadowColor: AppColorManager.white),
        dividerColor: AppColorManager.white,
        popupMenuTheme: PopupMenuThemeData(
          color: AppColorManager.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          elevation: AppSize.s8,
          textStyle: getRegularStyle().apply(color: AppColorManager.white),
        ),
        chipTheme: ChipThemeData(
          selectedColor: AppColorManager.primary,
          checkmarkColor: AppColorManager.white,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColorManager.primary,
        ),
      );
}
