import 'package:flutter/material.dart';
import 'package:todo_final_project/ui/views/home/settings/theme_bottom_sheet.dart';
import '../../../../providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});


  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsetsDirectional.symmetric(vertical: 62),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical:8,horizontal: 10 ),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(15),
                color: Theme.of(context).cardColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor
                )
              ),

              child: Text(
                provider.mode=='Dark'?
                  AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),

          const SizedBox(height: 40,),

          Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical:8,horizontal: 10 ),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(14),
                color: Theme.of(context).cardColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor
                )
              ),

              child: Text(
                provider.languageCode=='en'?
                'English':'العربيه'
                ,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )

        ],
      ),
    );
  }
  void showThemeBottomSheet(BuildContext context){
    showBottomSheet(context: context,
        builder: (context) => const ThemeButtonSheet()
    );
  }
  void showLanguageBottomSheet(BuildContext context){
    showBottomSheet(context: context,
        builder: (context) => const LanguageButtonSheet()
    );
  }
}
