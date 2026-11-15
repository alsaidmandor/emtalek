import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/more_drawer.dart';
import 'home_content.dart';
import 'placeholder_tab.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _index = 2; // home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MoreDrawer(),
      body: IndexedStack(
        index: _index,
        children: [
          const PlaceholderTab('المطورون'),
          const PlaceholderTab('السوق'),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (_, state) => HomeContent(
              state: state,
              onMenu: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ),
          const PlaceholderTab('العروض'),
          const PlaceholderTab('عقاراتي'),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        index: _index,
        onChanged: (i) => setState(() => _index = i),
      ),
    );
  }
}
