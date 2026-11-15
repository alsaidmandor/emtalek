import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/repositories/mock_home_repository.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/home/presentation/screens/main_shell.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainShell:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(MockHomeRepository())..load(),
            child: const MainShell(),
          ),
        );
      default:
        return null;
    }
  }
}
