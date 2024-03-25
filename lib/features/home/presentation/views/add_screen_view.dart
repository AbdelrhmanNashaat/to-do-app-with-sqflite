import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/features/home/presentation/manager/validate_cubit/validate_cubit.dart';
import 'add_screen_view_body.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidateCubit(),
      child: const Scaffold(
        body: AddBody(),
      ),
    );
  }
}
