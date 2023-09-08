
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peerp_toon/presentation/screens/sellerScreen/seller.screen.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';

import '../../../SellerApp/dashbord/homeDeshbord.dart';


class SellerRegistration extends StatefulWidget {
  SellerRegistration({Key? key}) : super(key: key);

  @override
  State<SellerRegistration> createState() => _SellerRegistrationState();
}

class _SellerRegistrationState extends State<SellerRegistration> {
  int currentStep = 0;
  String? _selectedState;
  XFile? imagess;
  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => imagess = image);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  XFile? pancard;
  void pickPanImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => pancard = image);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  XFile? adhar;
  void pickAdharImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => adhar = image);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  XFile? gst;
  void pickGstImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => gst = image);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  XFile? shop1;
  void pickShop1Image() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => shop1 = image);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  XFile? shop2;
  void pickShop2Image() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => shop2 = image);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  XFile? shop3;
  void pickShop3Image() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => shop3 = image);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Store Registration"),
        backgroundColor: Colors.pinkAccent,
      ),
      body:
      Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        elevation: 1,
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length -1;
          if(isLastStep){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>HomeDeshbordSeller() ),
            );                      // _initiateCache();
          print("hee");
          }

          setState(() => currentStep +=1);

        },
        onStepCancel: (){
          setState(() {
            currentStep -=1;
          });
        },

      ),
    );
  }

  final List<String> _statesList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal'  ];

  List<Step> getSteps() => [
        Step(
            isActive: currentStep >=0,
            title: Text('Step1'),
            content: Container(
              child: Form(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.pinkAccent),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                          hintText: 'Enter your business name',
                        ),
                      ),
                    ),
                    vSizedBox1,
                    Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.pinkAccent),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                          hintText: 'Enter Business Email',
                        ),
                      ),
                    ),
                    vSizedBox1,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.pinkAccent),
                      ),
                      child: TextFormField(

                        decoration: InputDecoration(

                          contentPadding: EdgeInsets.only(left: 20),

                          border: InputBorder.none,
                          hintText: 'Building/floor',
                        ),
                      ),
                    ),
                    vSizedBox1,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.pinkAccent),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                          hintText: 'Enter Pincode',
                        ),
                      ),
                    ),
                    vSizedBox1,
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.pinkAccent),

                      ),
/*
                      child: DropdownButton(
                        hint: Text('Select State'),
                        value: _selectedState,
                        onChanged: (value) {
                          setState(() {
                            _selectedState = value;
                          });
                        },
                        items: _statesList.map((state) {
                          return DropdownMenuItem(
                            value: state,
                            child: Text(state),
                          );
                        }).toList(),
                        underline: Container(), // removes the underline
                      ),
*/
                    ),

                    vSizedBox1,
                  ],
                ),
              ),
            )),
        Step(
            isActive: currentStep >=1,

            title: Text('Step2'), content: Container(
                    child:
                    Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              height: 50,
                                color: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Icon(Icons.file_copy, color: Colors.pinkAccent,),
                                    SizedBox(width: 10,),
                                    const Text(
                                        "Upload Cancelled cheque",
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w400,fontFamily: "Libre"
                                        )
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  pickImage();
                                }
                            ),
                            SizedBox(width: 10),
                            imagess != null ? Image.file(
                              File(imagess!.path),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ) : Container(),
                          ],
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                height: 50,
                                color: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Icon(Icons.upload_file, color: Colors.pinkAccent,),
                                    SizedBox(width: 10,),
                                    const Text(
                                        "upload Pan Card",
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w400,
                                          fontFamily: "Libre"
                                        )
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  pickPanImage();
                                }
                            ),
                            SizedBox(width: 10),
                            pancard != null ? Image.file(
                              File(pancard!.path),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ) : Container(),
                          ],
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                height: 50,
                                color: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Icon(Icons.upload_file, color: Colors.pinkAccent,),
                                    SizedBox(width: 10,),
                                    const Text(
                                        "Upload Adhar Card",
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Libre"
                                        )
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  pickAdharImage();
                                }
                            ),
                            SizedBox(width: 10),
                            adhar != null ? Image.file(
                              File(adhar!.path),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ) : Container(),
                          ],
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                height: 50,
                                color: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Icon(Icons.upload_file, color: Colors.pinkAccent,),
                                    SizedBox(width: 10,),

                                    const Text(
                                        "Upload  gst number",
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w400,fontFamily: "Libre"
                                        )
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  pickGstImage();
                                }
                            ),
                            SizedBox(width: 10),
                            gst != null ? Image.file(
                              File(gst!.path),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ) : Container(),
                          ],
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                height: 50,
                                color: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Icon(Icons.upload_file, color: Colors.pinkAccent,),
                                    SizedBox(width: 10,),
                                    const Text(
                                        "Upload shop image-1",
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w400,fontFamily: "Libre"
                                        )
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  pickShop1Image();
                                }
                            ),
                            SizedBox(width: 10),
                            shop1 != null ? Image.file(
                              File(shop1!.path),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ) : Container(),
                          ],
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                height: 50,
                                color: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [

                                    Icon(Icons.upload_file, color: Colors.pinkAccent,),
                                    SizedBox(width: 10,),
                                    const Text(
                                        "Upload shop image-2",
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w400,fontFamily: "Libre"
                                        )
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  pickShop2Image();
                                }
                            ),
                            SizedBox(width: 10),
                            shop2 != null ? Image.file(
                              File(shop2!.path),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ) : Container(),
                          ],
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                height: 50,
                                color: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Icon(Icons.upload_file, color: Colors.pinkAccent,),
                                    SizedBox(width: 10,),
                                    const Text(
                                        "Upload shop image-3",
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w400,fontFamily: "Libre"
                                        )
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  pickShop3Image();
                                }
                            ),
                            SizedBox(width: 10),
                            shop3 != null ? Image.file(
                              File(shop3!.path),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ) : Container(),
                          ],
                        ),
                        vSizedBox1,



                      ],
                    ),
        )),
/*
        Step(
            isActive: currentStep >=2,

            title: Text('Account'), content: Container())
*/
      ];
}
