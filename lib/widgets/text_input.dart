import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget {
  String title;
  int? Lines;
  TextEditingController? controller;
   TextInputType? keyboardType;
  final String? Function(String?)? validator;
  void Function()? onTap;


  TextInput({super.key , required this.title , this.Lines=1,  this.controller , this.keyboardType , this.validator, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          gapPadding: 4,
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1) , ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        hintText: title,
        contentPadding: EdgeInsets.symmetric(vertical: 12 , horizontal: 16)
      ),
      maxLines: Lines,
      onTap:onTap ,
    );
  }
}
