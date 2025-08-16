import 'package:flutter/material.dart';

class CategoryCapsule extends StatelessWidget {
  const CategoryCapsule({super.key,required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical:  8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      
      ),
      
      child: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
    );
  
  }
}