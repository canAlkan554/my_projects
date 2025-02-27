import 'package:flutter/material.dart';

TextField buildhomePageTextField(TextEditingController cont,String labelText,String hintText) {
  return TextField(
    controller: cont,
    decoration: InputDecoration(hintText: hintText,labelText: labelText,border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
  );
}