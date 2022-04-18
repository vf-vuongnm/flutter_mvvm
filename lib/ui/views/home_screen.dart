import 'package:mvvm/ui/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home').tr(),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("goToProfile").tr(),
          onPressed: () {
            AutoRouter.of(context).push(const ProfileScreen());
          },
        ),
      ),
    );
  }
}
