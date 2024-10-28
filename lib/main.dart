import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tazkarti/view/screens/home_screen.dart';
import 'package:tazkarti/view_model/cubit/app_cubit.dart';

void main() {
    Stripe.publishableKey='pk_test_51OIUW1JIimmtSera1g2BFcVGshXMsqmfLJH2e7vGgEsckXFnvk7RaiBFdiCzbO2dE8SwnhW5WxZx7B4jfKH0XXdH00D0ufaUMW';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return BlocProvider(
      create: (context) => AppCubit()..getTicketsData(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
