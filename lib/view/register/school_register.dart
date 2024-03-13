
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:book_distribution/view/onboarding/welcome_view.dart';

import 'package:email_validator/email_validator.dart';

import '../../common/color_extenstion.dart';

import '../../common_widget/round_textfield.dart';



class SchoolRegister extends StatefulWidget {
  const SchoolRegister({super.key});

  @override
  State<SchoolRegister> createState() => _SchoolRegisterState();
}

class _SchoolRegisterState extends State<SchoolRegister> {
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

  List<String> zones = [];
  List<String> regions = [];
  List<String> territories = [];

  @override
  void initState() {
    super.initState();
    fetchZones();
    fetchRegions();
    fetchTerritories();
  }

  Future<void> fetchZones() async {
    try {
      final dio = Dio();
      final response = await dio.get('http://51.44.21.140/BDSMS/api/zones');
      if (response.statusCode == 200) {
        setState(() {
          zones = List<String>.from(response.data);
        });
      }
    } catch (e) {
      print('Error fetching zones: $e');
    }
  }

  Future<void> fetchRegions() async {
    try {
      final dio = Dio();
      final response = await dio.get('http://51.44.21.140/BDSMS/api/regions');
      if (response.statusCode == 200) {
        setState(() {
          regions = List<String>.from(response.data);
        });
      }
    } catch (e) {
      print('Error fetching regions: $e');
    }
  }

  Future<void> fetchTerritories() async {
    try {
      final dio = Dio();
      final response = await dio.get('http://51.44.21.140/BDSMS/api/territories');
      if (response.statusCode == 200) {
        setState(() {
          territories = List<String>.from(response.data);
        });
      }
    } catch (e) {
      print('Error fetching territories: $e');
    }
  }
  

  bool _validateInputs() {
    if (txtOrganisationName.text.isEmpty ||
        txtType.text.isEmpty ||
        txtCategory.text.isEmpty ||
        txtEmail.text.isEmpty ||
        txtNumber.text.isEmpty ||
        txtContactPerson.text.isEmpty ||
        txtDesignation.text.isEmpty ||
        txtCPN.text.isEmpty ||
        txtCPE.text.isEmpty ||
        txtZone.text.isEmpty ||
        txtRegion.text.isEmpty ||
        txtSalesAgent.text.isEmpty ||
        txtRegistration.text.isEmpty ||
        txtTerritory.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return false;
    }

    if (!EmailValidator.validate(txtEmail.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email')),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                "Register School",
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
                hintText: "School Name",
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.textbox,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text("Type"),
                  underline: Container(),
                  items: ["Type1", "Type2"].map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                  onChanged: (selectVal) {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.textbox,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text("Category"),
                  underline: Container(),
                  items: ["State1", "State2"].map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                  onChanged: (selectVal) {},
                ),
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

              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Zone"),
                  value: txtZone.text,
                  onChanged: (newValue) {
                    setState(() {
                      txtZone.text = newValue!;
                    });
                  },
                  items: zones.map((zone) {
                    return DropdownMenuItem(
                      value: zone,
                      child: Text(zone),
                    );
                  }).toList(),
                ),
              ),


              const SizedBox(
                height: 15,
              ),

              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Region"),
                  value: txtRegion.text,
                  onChanged: (newValue) {
                    setState(() {
                      txtRegion.text = newValue!;
                    });
                  },
                  items: regions.map((region) {
                    return DropdownMenuItem(
                      value: region,
                      child: Text(region),
                    );
                  }).toList(),
                ),
              ),

              

              const SizedBox(
                height: 15,
              ),

            Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Territory"),
                  value: txtTerritory.text,
                  onChanged: (newValue) {
                    setState(() {
                      txtTerritory.text = newValue!;
                    });
                  },
                  items: territories.map((territory) {
                    return DropdownMenuItem(
                      value: territory,
                      child: Text(territory),
                    );
                  }).toList(),
                ),
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
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed:  () {
                  if (_validateInputs()) {
                     // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeView()),
                    );
                  }
                },

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.zero,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xffEF4C45), Color(0xffEF4C45)],
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: 50.0, minWidth: size.width * 0.5),
                      alignment: Alignment.center,
                      child: const Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
