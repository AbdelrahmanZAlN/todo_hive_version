import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final int lines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  // final Function(String) onSave;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.onChange,
    required this.validator,
    required this.label,
    this.controller,
    this.hint,
    this.keyboardType=TextInputType.text,
    this.isPassword=false,
    this.lines=1

  });
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      cursorColor: Theme.of(context).focusColor,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChange,
      minLines: lines,
      maxLines: lines,
      controller: controller,
      style:Theme.of(context).textTheme.bodyMedium ,
      decoration: InputDecoration(

        floatingLabelBehavior:
        hint!=null?
        FloatingLabelBehavior.always:
        FloatingLabelBehavior.auto,
        labelText: label,
        //contentPadding: const EdgeInsets.all(20),
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).focusColor,
        ),
        hintText: hint,
        hintStyle:Theme.of(context).textTheme.bodyMedium,
        focusedBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).focusColor
          )
        )

        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: kPrimarySwatch,
        //     )
        //   ),
        //   border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6)
        // )
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
    );
  }
}
