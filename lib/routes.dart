import 'package:flutter_exchange_currency/di/di_setup.dart';
import 'package:flutter_exchange_currency/presentation/home/home_screen.dart';
import 'package:flutter_exchange_currency/presentation/home/home_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => ChangeNotifierProvider(
      create: (context) => getIt<HomeViewModel>(),
      child: const HomeScreen(),
    ),
  )
]);