import 'package:book_distribution/view/register/bookshop_register.dart';
import 'package:book_distribution/view/register/school_register.dart';
import 'package:book_distribution/view/register/wholesaler_register.dart';
import 'package:flutter/material.dart';
import 'package:book_distribution/view/onboarding/onboarding_view.dart';



class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  int selectedIndex = 0;

  void navigateToRegisterPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (index) {
            case 0:
              return const SchoolRegister();
            case 1:
              return const BookShopRegister();
            case 2:
              return const WholeSalerRegister(); // Add WholesalerRegister
            default:
              return Container();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: const AssetImage("assets/img/book.jpg"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 540,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildTabItem(0, "SCHOOL"),
                    buildTabItem(1, "BOOKSHOP"),
                    buildTabItem(2, "WHOLESALER"), // Add WHOLESALER tab
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                MaterialButton(
                  onPressed: () {
                    navigateToRegisterPage(selectedIndex);
                  },
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  color: const Color(0xffEF4C45),
                  height: 56,
                  minWidth: double.infinity,
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(
                      fontFamily: "SFUIText",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const OnboardingView(),
                  ),
                ); // Handle back button tap
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem(int index, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            setState(() {
              selectedIndex = index;
            });
          },
          padding: EdgeInsets.zero,
          splashColor: Colors.transparent,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "SFUIText",
              color: selectedIndex == index
                  ? const Color(0xffEF4C45)
                  : const Color(0xff696e72),
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? const Color(0xffEF4C45)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
        )
      ],
    );
  }
}


