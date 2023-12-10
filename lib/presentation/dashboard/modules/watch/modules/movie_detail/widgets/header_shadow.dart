import 'package:flutter/material.dart';

class HeaderShadow extends StatelessWidget {
  const HeaderShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
