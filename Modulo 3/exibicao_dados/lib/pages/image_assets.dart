import 'package:flutter/material.dart';
import 'package:trilhaapp_inicial/shared/widgets/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _Page2State();
}

class _Page2State extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImage.user1,
          height: 100,
        ),
        Image.asset(
          AppImage.user2,
          height: 100,
        ),
        Image.asset(
          AppImage.user3,
          height: 100,
        ),
        Image.asset(
          AppImage.paisagem1,
          height: 100,
        ),
        Image.asset(
          AppImage.paisagem2,
          height: 100,
        ),
        Image.asset(
          AppImage.paisagem3,
          height: 100,
        )
      ],
    );
  }
}
