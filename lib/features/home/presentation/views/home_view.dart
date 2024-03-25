import 'package:flutter/material.dart';
import 'package:to_do_app2/features/home/presentation/views/home_view_body.dart';

import 'widgets/fab.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFab(),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
