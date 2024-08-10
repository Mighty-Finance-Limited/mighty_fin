import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/features/features.dart';
import '../../../utils/utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        iconTheme: const IconThemeData(
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              "/notifications",
            ),
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const UserProfileImageWidget(),
          SettingsListTileWidget(
            iconData: Icons.edit,
            title: "Edit Profile",
            onPressed: () => Navigator.pushNamed(context, "/profile"),
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const CustomHeadingWidget(
            text: 'General Settings',
          ),
          ///This is for testing purposes and will be removed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                return SwitchListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: ThemeData.light().colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  title: const Text('Change NavBar(Tests)'),
                  value: state.usePersistentNavBar,
                  onChanged: (bool value) {
                    context.read<NavigationBloc>().add(
                        ToggleNavigationStyleEvent(usePersistentNavBar: value));
                  },
                );
              },
            ),
          ),
          SettingsListTileWidget(
            iconData: Icons.brightness_6_outlined,
            title: "Mode",
            subTitle: "Light & Dark",
            onPressed: () {},
            trailingWidget: SizedBox(
              width: 120,
              height: 90,
              // color: Colors.red,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.brightness_7,
                    color: primaryAmber,
                  ),
                  BlocBuilder<ThemeBloc, ThemeData>(
                    builder: (context, state) {
                      return Switch(
                        value: state == AppTheme().getDarkTheme(),
                        onChanged: (bool val) {
                          context.read<ThemeBloc>().add(ToggleThemeEvent());
                        },
                      );
                    },
                  ),
                  const Icon(
                    Icons.brightness_2,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          SettingsListTileWidget(
            iconData: Icons.question_mark,
            title: "About",
            onPressed: () {},
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          SettingsListTileWidget(
            iconData: Icons.support_agent,
            title: "Support",
            onPressed: () => Navigator.pushNamed(context, "/support"),
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          SettingsListTileWidget(
            iconData: Icons.credit_card_outlined,
            title: "Payment Info",
            onPressed: () {},
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          SettingsListTileWidget(
            iconData: Icons.info,
            title: "Terms & Conditions",
            onPressed: () =>
                Navigator.pushNamed(context, "/termsAndConditions"),
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
