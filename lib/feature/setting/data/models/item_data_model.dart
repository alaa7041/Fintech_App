import 'package:flutter/material.dart';

class ItemDataModel {

final String image;
final String text;
final IconData icon;
final Function()? onTap;

  ItemDataModel({required this.image, required this.text, required this.icon,required this.onTap});


}