import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../providers/settings_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              if (provider.themeMode != ThemeMode.light) {
                provider.changeAppMode();
              }
            },
            child: provider.themeMode == ThemeMode.light
                ? getSelectedWidget(context, AppLocalizations.of(context)!.light)
                : getUnselectedWidget(context, AppLocalizations.of(context)!.light),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              if (provider.themeMode != ThemeMode.dark) {
                provider.changeAppMode();
              }
            },
            child: provider.themeMode == ThemeMode.dark
                ? getSelectedWidget(context, AppLocalizations.of(context)!.dark)
                : getUnselectedWidget(context, AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(BuildContext context, String mode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mode,
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: Theme.of(context).focusColor),
        ),
        Icon(Icons.check, color: Theme.of(context).focusColor),
      ],
    );
  }

  Widget getUnselectedWidget(BuildContext context, String mode) {
    return Text(
      mode,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
