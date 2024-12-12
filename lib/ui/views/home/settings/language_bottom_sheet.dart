import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/settings_provider.dart';

class LanguageButtonSheet extends StatelessWidget {
  const LanguageButtonSheet({super.key});

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
              provider.enableEnglish();
            },
            //provider.locale==Locale('en')
            child: provider.languageCode=='en'?
            getSelectedWidget(context, 'English')
                :getUnselectedWidget(context, 'English'),
          ),
          const SizedBox(height: 15,),
          InkWell(
            onTap: (){
              provider.enableArabic();
            },
            //provider.locale==Locale('ar')
            child: provider.languageCode=='ar'?
            getSelectedWidget(context, 'العربيه')
                :getUnselectedWidget(context, 'العربيه'),
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
