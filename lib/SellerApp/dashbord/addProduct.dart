import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/app.colors.dart';
import '../../core/notifiers/authentication.notifer.dart';
import '../../core/notifiers/theme.notifier.dart';
import '../../presentation/screens/sellerScreen/seller.screen.dart';
import '../../presentation/widgets/custom.text.field.dart';
import '../../presentation/widgets/dimensions.widget.dart';

class AddProdect extends StatefulWidget {
  const AddProdect({Key? key}) : super(key: key);

  @override
  State<AddProdect> createState() => _AddProdectState();
}

class _AddProdectState extends State<AddProdect> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  FilePickerResult? pickedFile;
   String? _selectedCategory;


  List<String> _categories = [
    'Mobile & Tablet',
    'Electronics',
    'TV & Appliances',
    'Fashion',
    'Beauty',
    'Home & Furniture',
    'Grocery',
  ];
  List<XFile>? imageFileList = [];
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController stockEditingController = TextEditingController();
  final mrpController = TextEditingController();
  final priceController = TextEditingController();
  double discountPercentage = 0.0;


    void _calculateDiscountPercentage() {
      double mrp = double.tryParse(mrpController.text) ?? 0.0;
      double price = double.tryParse(priceController.text) ?? 0.0;
      if (mrp > 0 && price > 0 && mrp > price) {
        setState(() {
          discountPercentage = ((mrp - price) / mrp) * 100;
        });
      } else {
        setState(() {
          discountPercentage = 0.0;
        });
      }
    }

  // dynamic authData = parseData['token'];
  @ override
 /* void dispose() {
    mrpController.dispose();
    priceController.dispose();
    super.dispose();*/


  @override
  Widget build(BuildContext context) {
    _userLogin() {
      if (_formKey.currentState!.validate()) {
        var authNotifier =
            Provider.of<AuthenticationNotifier>(context, listen: false);
        authNotifier.addAProdect(
          context: context,
          token: "135|50mTwBrDERS0T20tm5T2ZXAubsHSzcDvqGW94H8Y",
          product_name: nameEditingController.text.toString(),
          stock: stockEditingController.text.toString(),
          description: descEditingController.text.toString(),
          image_ext: imageFileList.toString(),
          price: priceEditingController.text.toString(),
        );
      }
    }

    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pinkAccent,
        title: Text("Register Product",style: TextStyle(color: Colors.white, fontFamily: "Libre"), ),
        iconTheme: IconThemeData(
            color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    vSizedBox1,
                    Text("Product Details", style: TextStyle( fontSize: 16, fontWeight: FontWeight.w400,letterSpacing: 1,color: Colors.black, fontFamily: "Libre"),),
                    Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                         child:
                         Container(
                           height: 60,
                           decoration: BoxDecoration(
                             border: Border.all(
                               width: 1,
                               color: Colors.pinkAccent,
                             ),
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child: DropdownButton<String>(
                             value: _selectedCategory,
                             hint: Text('Choose product category', style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Libre"),),
                             isExpanded: true,
                             onChanged: (String? value) {
                               setState(() {
                                 _selectedCategory = value;
                               });
                             },
                             items: _categories.map<DropdownMenuItem<String>>((String value) {
                               return DropdownMenuItem<String>(
                                 value: value,
                                 child: Text(value),
                               );
                             }).toList(),
                           ),
                         )




                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: CustomTextField.customTextField(
                          textEditingController: nameEditingController,
                          hintText: 'product name'
                              '',
                          validator: (val) =>
                          val!.isEmpty ? '  Product' : null),
                    ),
                    vSizedBox1,
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child:
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: TextFormField(
                          maxLength: 100,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'product description',
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      )
                    ),
                    vSizedBox1,

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: CustomTextField.customTextField(
                          textEditingController: nameEditingController,
                          hintText: 'manufacturer name',
                          validator: (val) =>
                              val!.isEmpty ? '  Product' : null),
                    ),
                    vSizedBox1,
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: CustomTextField.customTextField(
                          textEditingController: nameEditingController,
                          hintText: 'Enter Sku Number',
                          validator: (val) =>
                          val!.isEmpty ? '  Product' : null),
                    ),
                    vSizedBox1,



                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child:
                      TextFormField(
                        controller: mrpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'MRP',
                        ),
                        onChanged: (value) {
                          _calculateDiscountPercentage();
                        },
                      ),

                    ),

                    vSizedBox1,
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child:
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Price',
                        ),
                        onChanged: (value) {
                          _calculateDiscountPercentage();
                        },
                      ),                    ),
                    vSizedBox1,
                    Text(
                      'Discount Percentage: ${discountPercentage.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    vSizedBox2,
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomTextField.customTextField(
                        // onChanged: (val) {
                        //   authNotifier(false)
                        //       .checkPasswordStrength(password: val);
                        // },
                        textEditingController: stockEditingController,
                        hintText: 'stock',
                      ),
                    ),
                    vSizedBox1,
                  ],
                ),
              ),
              vSizedBox3,
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: GridView.builder(
                        itemCount: imageFileList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext ctxt, int index) =>
                            Image.file(
                          File(imageFileList![index].path.toString()),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    hSizedBox1,
                    GestureDetector(
                      onTap: () {
                        selectedImages();
                      },
                      child: Container(
                        width: 106,
                        height: 96,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              vSizedBox4,
              MaterialButton(
                height: MediaQuery.of(context).size.height * 0.05,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () async {
                  print("Seller Screen");
                  _userLogin();

                  /// shopUserDetails(userEmail: textemailid.text.toString(), userAddress: textADDRESS.text.toString(), userPhoneNo: textphone.text.toString(), name: textcompanyName.text.toString(), GstnNo: textgstnuber.text.toString(), shopType: shopname.text.toString());
                  //  Navigator.of(context).pushReplacementNamed(AppRouter.homedeshbordseller) ;
                },
                color: AppColors.rawSienna,
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectedImages() async {

    final List<XFile>? selectImages = await _picker.pickMultiImage();

    if (selectImages!.isNotEmpty) {
      imageFileList!.addAll(selectImages);
      setState(() {
        // logoBase64 = pickedFile!.files.first.bytes;
      });
    }
    print("image lenth in app " + imageFileList!.length.toString());
    setState(() {});
  }
}
