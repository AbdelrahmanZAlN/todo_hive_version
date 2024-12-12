import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../providers/settings_provider.dart';

class ThemeButtonSheet extends StatelessWidget {
  const ThemeButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.enableLightMode();
            },
            child: provider.themeMode==ThemeMode.light?
                getSelectedWidget(context, AppLocalizations.of(context)!.light  )
                :getUnselectedWidget(context, AppLocalizations.of(context)!.light),
          ),
          const SizedBox(height: 15,),
          InkWell(
            onTap: (){
              provider.enableDarkMode();
            },
            child: provider.themeMode==ThemeMode.dark?
                getSelectedWidget(context, AppLocalizations.of(context)!.dark)
                :getUnselectedWidget(context, AppLocalizations.of(context)!.dark),
          )
        ],
      ),
    );
  }

  Widget getSelectedWidget(BuildContext context, String mode){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(mode,
          style: Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: Theme.of(context).dividerColor),

        ),
        Icon(Icons.check,color: Theme.of(context).dividerColor,)
      ],
    );
  }
  Widget getUnselectedWidget(BuildContext context, String mode){
    return  Text(mode,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
