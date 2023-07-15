import 'package:flutter/material.dart';

import '../utils/kcolor.dart';

class CustomIcon extends StatelessWidget {
  String iconImage;
  bool? edit ; 
  bool? back; 
  VoidCallback onPressed; 
   CustomIcon({
    required this.iconImage, 
    this.edit = false, 
    this.back = false, 
    required this.onPressed, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(edit);
    print(back);
    return GestureDetector( 
      onTap: onPressed,
      child: Container( 
        width:48, height:48, 
        // margin: EdgeInsets.only(left:back! ?20: 0,top:20, right: edit! ? 20 :0 ),  
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        decoration:const BoxDecoration(  
           color:Kcolor.secondaryColor,  
           borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        alignment: Alignment.center,
        child:  ImageIcon(AssetImage(iconImage)),
      ),
    );
  }
}

