import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class SignUp extends StatefulWidget {
  static final String id = "sign_up";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin(){
    String userName = userNameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var box = Hive.box('akhmadjan_off');
    box.put("userName", userName);
    box.put("email", email);
    box.put("phone", phone);
    box.put("password", password);

    String user_id = box.get("userName");
    String user_em = box.get("email");
    String user_ph = box.get("phone");
    String user_pw = box.get("password");

    print(user_id);
    print(user_em);
    print(user_ph);
    print(user_pw);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(child: Text("Create", style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            Center(child: Text("Account",style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),)),
            SizedBox(height: 80,),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "User Name",
                prefixIcon: Icon(Icons.person_outline_sharp),),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email_outlined,),),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.phone_outlined,),),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.key_sharp,),),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                doLogin();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                  gradient: LinearGradient(
                      colors: [
                        Colors.lightBlue.withOpacity(.2),
                        Colors.lightBlue.withOpacity(.9),
                      ]
                  ),
                ),
                child: Icon(Icons.arrow_right_alt_rounded, color: Colors.white, size: 50,),
              ),
            ),
            SizedBox(height: 90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(color: Colors.white),),
                SizedBox(width: 5,),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Sign In", style: TextStyle(color: Colors.blueAccent),)),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
