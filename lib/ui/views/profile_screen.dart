import 'package:mvvm/business_logic/view_models/global_view_model.dart';
import 'package:mvvm/business_logic/view_models/profile_screen_view_model.dart';
import 'package:mvvm/shared/common_dialog.dart';
import 'package:mvvm/ui/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('profile').tr(),
        ),
        body: const SafeArea(
            child: ProfileBody()
        )
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      CommonDialog.showLoadingDialog(context);
      await context.read<ProfileScreenViewModel>().getProfile();
      _onGetProfileCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    ProfileScreenViewModel viewModel = context.watch<ProfileScreenViewModel>();
    var userAvatar = viewModel.userPresentation?.avatar ?? "";

    return Center(
      child: Stack(
        children: [
          if(viewModel.errorMessage.isEmpty)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      image: userAvatar.isEmpty ? null : DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(viewModel.userPresentation?.avatar ?? "")
                      ),
                    )
                ),
                const SizedBox(height: 16,),
                Text("${viewModel.userPresentation?.fullName}"),
                const SizedBox(height: 32,),
                ElevatedButton(
                    child: const Text("logout").tr(),
                    onPressed: () async {
                      await viewModel.logout();
                      _onLogoutCompleted();
                    }
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () async {
                    context.read<GlobalViewModel>().saveLanguage("ja");
                  },
                  child: const Text("Change to Japanese"),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () async {
                    context.read<GlobalViewModel>().saveLanguage("en");
                  },
                  child: const Text("Change to English"),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () async {
                    context.read<GlobalViewModel>().saveLanguage("ur");
                  },
                  child: const Text("Change to Urdu"),
                ),

              ],
            ),
          if(viewModel.errorMessage.isNotEmpty)
            Text(viewModel.errorMessage, style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.redAccent),),
        ],
      ),
    );
  }

  _onLogoutCompleted() {
    AutoRouter.of(context).replaceAll([const SplashScreen()]);
  }

  _onGetProfileCompleted() {
    CommonDialog.closeVisibleDialog(context);
  }
}
