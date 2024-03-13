import 'package:book_distribution/view/login/help_us_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';


class BookShopRegister extends StatefulWidget {
  const BookShopRegister({super.key});

  @override
  State<BookShopRegister> createState() => _BookShopRegisterState();
}

class _BookShopRegisterState extends State<BookShopRegister> {
  TextEditingController txtOrganisationName = TextEditingController();
  TextEditingController txtType = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  TextEditingController txtContactPerson = TextEditingController();
  TextEditingController txtDesignation = TextEditingController();
  TextEditingController txtCPN = TextEditingController();
  TextEditingController txtCPE = TextEditingController();
  TextEditingController txtZone = TextEditingController();
  TextEditingController txtRegion = TextEditingController();
  TextEditingController txtTerritory = TextEditingController();
  TextEditingController txtSalesAgent = TextEditingController();
  TextEditingController txtRegistration = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;
  String currentLocation = '';

  @override
  void initState() {
    super.initState();
  }

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
                "Register Bookshop",
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
                hintText: "Bookshop Name",
              ),
  
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtEmail,
                hintText: "Email Address",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtNumber,
                hintText: "Phone Number",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtContactPerson,
                hintText: "Contact Person",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtDesignation,
                hintText: "Designation",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtCPN,
                hintText: "Contact Person’s Phone Number",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtCPE,
                hintText: "Contact Person’s Email Address",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: TextEditingController(text: currentLocation),
                hintText: "GPS Location",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtZone,
                hintText: "Zone",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtRegion,
                hintText: "Region",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtTerritory,
                hintText: "Territory",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtSalesAgent,
                hintText: "Sales Agent",
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtRegistration,
                hintText: "Registration Date",
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
