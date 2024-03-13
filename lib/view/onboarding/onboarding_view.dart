import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:book_distribution/view/login/sign_in_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay for 2 seconds and open the notification page
      Future.delayed(const Duration(seconds: 4), () {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>   SignInView(),
        ),
      );
      
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // right top black
            Positioned(
              top: 20,
              right: -70,
              height: 250,
              child: Transform.rotate(
                angle: 4.5,
                child: const Image(
                  image: Svg('assets/img/svg-path.svg'),
                  color: Color(0xffB7143C),
                ),
              ),
            ),
            // left side orangeish
            Positioned(
              top: 5,
              left: -205,
              height: 450,
              child: Transform.rotate(
                angle: pi,
                child: const Image(
                  image: Svg('assets/img/svg-path.svg'),
                  color: Color(0xffE6A500),
                ),
              ),
            ),
            // Right side dark green
            Positioned(
              bottom: 180,
              right: -220,
              height: 350,
              child: Transform.rotate(
                angle: 2 * pi,
                child: const Image(
                  image: Svg('assets/img/svg-path.svg'),
                  color: Color(0xffEF4C45),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: 2 * pi,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 200, right: 120),
                    child: Image(
                      height: 100,
                      width: 90,
                      image: Svg('assets/img/svg-path.svg'),
                      color: Color(0xffF46217),
                    ),
                  ),
                ),
              ),
            ),
            // Right bottom corner side dark orange
            Positioned(
              bottom: -340,
              right: -240,
              height: 450,
              child: Transform.flip(
                flipX: true,
                flipY: true,
                child: const Image(
                  image: Svg('assets/img/svg-path.svg'),
                  color: Color(0xffD36A43),
                ),
              ),
            ),

            // left bottom corner side
            // some unknown color name haha
            Positioned(
              bottom: -130,
              left: -250,
              height: 450,
              child: Transform.rotate(
                angle: pi * 0.5,
                child: const Image(
                  image: Svg('assets/img/svg-path.svg'),
                  color: Color(0xff09ADE2),
                ),
              ),
            ),

            const Positioned.fill(
              bottom: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BDSMS',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'BDSMS revolutionizes the distribution and sales processes for books to educational institutions and bookshops. ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}