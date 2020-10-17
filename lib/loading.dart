import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.red[500],
      child: Center(
        child: Column(
          children: [
            Container(
              width: size.width * 0.15,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/appicon.png')
                ),
              ),
            ),
            SpinKitChasingDots(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        )
      ),
    );
  }
}
