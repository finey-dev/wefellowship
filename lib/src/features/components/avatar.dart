import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wefellowship/utilities/utilities.dart';
import 'package:wefellowship/src/configs/configs.dart';

class ProfilePic extends StatelessWidget {
  final File? image;
  final Function? onPressed;

  const ProfilePic({
    Key? key,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          image == null
              ? const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                  ),
                )
              : CircleAvatar(
                  backgroundImage: FileImage(image!),
                ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: onPressed as void Function()?,
                child: SvgPicture.asset(AppAssetsPath.camera),
              ),
            ),
          )
        ],
      ),
    );
  }
}
