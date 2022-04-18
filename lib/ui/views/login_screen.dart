import 'package:mvvm/business_logic/view_models/login_screen_view_model.dart';
import 'package:mvvm/ui/router/app_router.gr.dart';
import 'package:mvvm/ui/views/widgets/loading_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login').tr(),
      ),
      body: const SafeArea(
          child: _LoginBody()
      ),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  State<_LoginBody> createState() => __LoginBodyState();
}

class __LoginBodyState extends State<_LoginBody> {
  final usernameController = TextEditingController(text: "eve.holt@reqres.in");
  final passwordController = TextEditingController(text: "cityslicka");

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginScreenViewModel>();

    return LoadingContainer(
      isLoading: viewModel.isLoginRequesting,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/logo.png"
                      )
                    )
                  )
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
              autocorrect: false,
              enableSuggestions: false,
            ),
            const SizedBox(height: 16,),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              child: const Text("login").tr(),
              onPressed: () async {
                final username = usernameController.value.text;
                final password = passwordController.value.text;
                final isAuth = await viewModel.login(username, password);
                if(isAuth) {
                  AutoRouter.of(context).replace(const HomeScreen());
                }
              },
            ),
            const SizedBox(height: 16,),
            Text(viewModel.errorMessage, style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.redAccent),),
          ],
        ),
      ),
    );
  }
}
