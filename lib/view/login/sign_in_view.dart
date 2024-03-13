import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import 'package:book_distribution/view/onboarding/welcome_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtOrganisationName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  Future<void> signIn() async {
    final String phoneNumber = txtOrganisationName.text.trim();
    final String password = txtPassword.text;

    // Make API call to authenticate user
    final Uri url = Uri.parse('http://51.44.21.140/BDSMS/api/login');
    final response = await http.post(
      url,
      body: {
        'username': phoneNumber,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeView()),
      );
    } else {
      // If the server returns an error, show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid credentials. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/sign.JPG', // Change to your image path
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.4), // Adjust the opacity as needed
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      "Sign in to continue",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Center(
                      child: Container(
                        height: 107,
                        width: 107,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Color(0xffe5e5e5),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: const Center(
                          child: Text(
                            "B",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 72,
                              color: Color(0xffEF4C45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    RoundTextField(
                      controller: txtOrganisationName,
                      hintText: "Phone Number",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RoundTextField(
                      controller: txtPassword,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RoundButton(
                      title: "Sign In",
                      onPressed: signIn,
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()), // This ensures that the content fills the remaining space
            ],
          ),
        ],
      ),
    );
  }
}
