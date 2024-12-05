import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/AppColors.dart';
class Change_Password extends StatefulWidget {
  const Change_Password({super.key});

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {


  String userId = '';


  @override
  void initState() {
    super.initState();
    _loadData();

  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id') ?? 'N/A';
    });
    print('User Id: $userId');
  }



  TextEditingController _newpassword = TextEditingController();
  TextEditingController _currentpassword = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  bool _isLoading = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 110, // Set this height
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24)),
                      color: AppColors.bluecolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25,right: 10,top: 25),
                      child:
                      Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset('assets/arrowbutton.svg',height: 30,width: 30,)),
                          SizedBox(width: 5,),
                          Text("Change password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          // Container(
                          //   height: 20,
                          //   width: 200,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(4),
                          //       color: AppColors.greencolor
                          //   ),
                          //   child: Center(child: Text("Business Value Estimator",style: TextStyle(color: AppColors.bluecolor),)),
                          // ),
                          // Image.asset('assets/userimage.png')
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 22,right: 22,top: 5),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _signUpFormKey,
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  TextFormField(
                    controller: _currentpassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'current password',
                        filled: true,
                        fillColor: Colors.white
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your current password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _newpassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'New password',
                        filled: true,
                        fillColor: Colors.white
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a new password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _confirmpassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Confirm password',
                        filled: true,
                        fillColor: Colors.white
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your new password';
                      }
                      if (value != _newpassword.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: () {
                      if (_signUpFormKey.currentState?.validate() ?? false);
                      changepassword();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.redColor
                      ),
                      child: Center(child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text('Send', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> changepassword() async {
    if (_currentpassword.text.isEmpty || _newpassword.text.isEmpty ) {
      Fluttertoast.showToast(
        msg: "All fields are required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    if (_newpassword.text != _confirmpassword.text) {
      Fluttertoast.showToast(
        msg: "New password and confirm password do not match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('user_id'); // Retrieve user ID from SharedPreferences

      if (userId == null) {
        Fluttertoast.showToast(
          msg: "Session expired, please log in again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      Map<String, String> body = {
        "password": _newpassword.text,
        "old_password": _currentpassword.text,
        "user_id": userId.toString().trim(), // Pass user ID for backend verification
      };

      final response = await http.post(
        Uri.parse("https://techimmense.in/MeritValuation/webservice/change_password?user_id=${userId}"),

        body: jsonEncode(body),
      );

      print("Response status: ${response.statusCode}");
      //   print("Response headers: ${response.headers}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        var contentType = response.headers['content-type'];
        if (contentType != null && contentType.contains('application/json')) {
          var responseData = jsonDecode(response.body);
          print("Response Data: $responseData");

          if (responseData['status'] == "1") {
            Fluttertoast.showToast(
              msg: responseData['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            Fluttertoast.showToast(
              msg: responseData['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } else {
          print("Received non-JSON response");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unexpected response format")),
          );
        }
      } else {
        print("Change password failed with status: ${response.statusCode}");
        print("Error message: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to change password. Please try again later.")),
        );
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred. Please try again later.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}