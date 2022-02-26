import 'package:datademo/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class HomePage extends StatefulWidget {
static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin(){
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
     var box = Hive.box('akhmadjan_off');
     box.put("userName", userName);
     box.put("password", password);

     String user_id = box.get("userName");
     String user_pw = box.get("password");

     print(user_id);
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
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG90cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: 20,),
            Center(child: Text("Welcome back", style: TextStyle(fontSize: 28, color: Colors.white),)),
            SizedBox(height: 10,),
            Center(child: Text("Sign in to continue",style: TextStyle(fontSize: 18, color: Colors.white),)),
            SizedBox(height: 100,),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "User Name",
                prefixIcon: Icon(Icons.person_outline_sharp),),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.key_sharp,),),
            ),
            SizedBox(height: 20,),
            Text("Forgot Password?", style: TextStyle(letterSpacing: 2, color: Colors.white),),
            SizedBox(height: 30,),
            Container(
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
              child: GestureDetector(
                  onTap: () {
                    doLogin();
                  },
                  child: Icon(Icons.arrow_right_alt_rounded, color: Colors.white, size: 50,)),
            ),
            SizedBox(height: 90,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Don`t have an account?", style: TextStyle(color: Colors.white),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignUp.id);
                  },
                    child: Text("Sign up", style: TextStyle(color: Colors.blueAccent),)),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
