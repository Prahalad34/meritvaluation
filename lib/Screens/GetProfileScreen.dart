import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:meritvaluation/Constants/Https.dart';

import '../Models/GetProfile.dart';

class GetProfileScreen extends StatefulWidget {
  const GetProfileScreen({super.key});

  @override
  State<GetProfileScreen> createState() => _GetProfileScreenState();
}

class _GetProfileScreenState extends State<GetProfileScreen> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _address = TextEditingController();

  final ApiService controller = ApiService();
  GetProfile? getprofile;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  // loadUser function me API call kiya aur result ko state me store kiya
  void loadUser() async {
    SVProgressHUD.show(); // Show loading indicator
    GetProfile? fetchedUser = await controller.getProfile();
    print(fetchedUser);
    SVProgressHUD.dismiss(); // Dismiss loading indicator
    setState(() {
      getprofile = fetchedUser;

      if(getprofile != null && getprofile!.result != null){

        _email.text = getprofile!.result!.email ?? "";
        _name.text = getprofile!.result!.firstName ?? "";
        _lastname.text = getprofile!.result!.lastName ?? "";
        _password.text = getprofile!.result!.password ?? "";
        _address.text = getprofile!.result!.address ?? "";
        _number.text = getprofile!.result!.mobile ?? "";

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
        child: SingleChildScrollView(
          child: getprofile != null && getprofile!.result != null
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Center(child: ClipOval(child: Image.network("${getprofile!.result!.image}",height: 80,width: 80,fit: BoxFit.cover,))),

              Text("Name",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                    hintText: "Jonh deny"
                ),
              ),
              SizedBox(height: 12,),
              TextField(
                controller: _lastname,
                decoration: InputDecoration(
                    hintText: "Jonh deny"
                ),
              ),
              SizedBox(height: 12,),
              Text("Email",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: "Jjohndeny@gmail.com"
                ),
              ),
              SizedBox(height: 12,),
              Text("Address",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              TextField(
                controller: _address,
                decoration: InputDecoration(
                  hintText: "St. Celina, Delaware 10299",
                  suffixIcon: InkWell(
               //     onTap: _navigateToAddressScreen, // Call the method to open Address_Screen
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Text("Password",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              TextField(
                controller: _password,
                decoration: InputDecoration(
                    hintText: "***********"
                ),
              ),
              SizedBox(height: 12,),
              Text("Contact No.",style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              TextField(
                controller: _number,
                decoration: InputDecoration(
                  hintText: "9996536734",

                ),
              ),

            ],
          ):Text('No Data Available')
        ),
      ),
    );
  }
}
