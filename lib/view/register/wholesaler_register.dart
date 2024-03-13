import 'package:book_distribution/view/login/help_us_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class WholeSalerRegister extends StatefulWidget {
  const WholeSalerRegister({super.key});

  @override
  State<WholeSalerRegister> createState() => _WholeSalerRegisterState();
}

class _WholeSalerRegisterState extends State<WholeSalerRegister> {
  TextEditingController txtOrganisationName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Register WholeSaler",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextField(
                controller: txtOrganisationName,
                hintText: "Wholesaler Name",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                  controller: txtEmail,
                  hintText: "Email Address",
                  keyboardType: TextInputType.emailAddress),
              
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtMobile,
                hintText: "Mobile Phone",
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtCode,
                hintText: "Registration Date",
              ),
              const SizedBox(
                height: 15,
              ),
              
             
              const SizedBox(
                height: 8,
              ),
              RoundLineButton(
                title: "Register",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpUsView()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
