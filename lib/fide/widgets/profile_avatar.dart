import 'package:chess_prophet/common/constants/assets_path.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(DisplayProperties.defaultContentPadding),
      child: CircleAvatar(
        radius: DisplayProperties.profileAvatarRadius,
        backgroundImage: AssetImage(AssetPath.profileImg),
      ),
    );
  }
}
