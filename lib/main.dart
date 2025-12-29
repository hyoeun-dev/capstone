import 'package:capstone/colors.dart';
import 'package:capstone/cubit/accordion_choice_chip.dart';
import 'package:capstone/cubit/accordion_favorites_cubit.dart';
import 'package:capstone/cubit/social_favorite_cubit.dart';
import 'package:capstone/cubit/sorting_dropdown_cubit.dart';
import 'package:capstone/cubit/tag_dropdown_cubit.dart';
import 'package:capstone/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR');
  runApp(const Capstone());
}

class Capstone extends StatelessWidget {
  const Capstone({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TagDropdownCubit(),
        ),
        BlocProvider(
          create: (context) => AccordionFavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => AccordionChoiceChip(),
        ),
        BlocProvider(
          create: (context) => SortingDropdownCubit(),
        ),
        BlocProvider(
          create: (context) => SocialFavoriteCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: whiteColor,
          primaryColor: ColorPalette.accentColors['blue'],
          appBarTheme: AppBarTheme(
            backgroundColor: whiteColor,
            surfaceTintColor: whiteColor,
            elevation: 0,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle: TextStyle(
              fontFamily: 'BookkGothic',
              color: blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(fontFamily: 'BookkGothic', color: blackColor, fontSize: 20, fontWeight: FontWeight.w700),
            titleMedium: TextStyle(fontFamily: 'BookkGothic', color: blackColor, fontSize: 16, fontWeight: FontWeight.w700),
            titleSmall: TextStyle(fontFamily: 'BookkGothic', color: blackColor, fontSize: 14, fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(fontFamily: 'BookkGothic', color: blackColor, fontSize: 14, fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(fontFamily: 'BookkGothic', color: blackColor, fontSize: 12, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(fontFamily: 'BookkGothic', color: blackColor, fontSize: 10, fontWeight: FontWeight.w600),
          ),
          cardTheme: CardThemeData(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: mediumGreyColor, width: 1),
            ),
            color: whiteColor,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ColorPalette.accentColors['light beige'],
            foregroundColor: blackColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          dialogTheme: DialogThemeData(
            elevation: 0,
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: mediumGreyColor, width: 1),
            ),
          ),
          dividerTheme: DividerThemeData(
            color: dividerColor,
            thickness: 1,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}

