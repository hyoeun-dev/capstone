import 'package:capstone/cubit/accordion_choice_chip.dart';
import 'package:capstone/cubit/accordion_favorites_cubit.dart';
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
        BlocProvider(create: (context) => TagDropdownCubit(),),
        BlocProvider(create: (context) => AccordionFavoritesCubit(),),
        BlocProvider(create: (context) => AccordionChoiceChip(),),
        BlocProvider(create: (context) => SortingDropdownCubit(),),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

