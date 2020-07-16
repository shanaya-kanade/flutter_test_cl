import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(this._assetPath, fit: BoxFit.fitHeight),
      constraints: BoxConstraints.expand(height: 200.0),
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
