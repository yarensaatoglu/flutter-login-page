import 'package:flutter/material.dart';
import 'package:flutter_login_page/create_page.dart';

class LoginPage extends StatefulWidget {
  String name;
  String surname;
  String password;
  String email;
  LoginPage({this.name,this.surname,this.email,this.password});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName;
  String userPassword;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
                child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //TextFieldlar
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter username text';
                                }
                                return null;
                              },
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value){
                                userName = value;
                              },
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.person, color: Colors.white, size: 22,),
                                labelText: "User Name",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password text';
                                }
                                return null;
                              },
                              cursorColor: Colors.white,
                              onChanged: (value){
                                userPassword=value;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white, size: 22,),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white,size: 22,)
                              ),
                            ),
                            SizedBox(height: 25,),
                            Text("Forget Password ?", style: TextStyle(color: Colors.white60,fontSize: 17),),
                            SizedBox(height: 45,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("SIGN IN",style: TextStyle(color: Colors.white),),
                                SizedBox(width:15 ,),
                                ElevatedButton(onPressed:(){
                                    setState(() {
                                      if(formKey.currentState.validate()){
                                        formKey.currentState.save();
                                        _LoginContol();
                                      }
                                    });
                                },
                                  style: ButtonStyle(
                                    //minimumSize: MaterialStateProperty.all(Size(double.infinity, 35)),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: Colors.white),
                                          )
                                      )
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.red,size: 22,),
                                ),
                              ],
                            ),
                            SizedBox(height: 40,),
                            Center(
                              child: GestureDetector(
                                child: Text("Don't have an account? CREATE", style: TextStyle(color: Colors.white),),
                                onTap: (){
                                  setState(() {
                                   Navigator.push(
                                      context,MaterialPageRoute(builder: (context) => CreatePage()));
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 450,
              left: 5,
              child: Container(
                height: 200,
                width: 300,
                child: Image.asset("images/icon.png"),
              ),
            ),
            Positioned(
                top: 150,
                left: 150,
                child: Text("M A R K A", style: TextStyle(fontSize: 30, fontFamily: "MarkaFont"),))
          ],
        ),
      ),
    );
  }

  _LoginContol() {
    if(userName == widget.email && userPassword == widget.password) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Success")));
    }
    else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User name or password is fault. Try again...")));
    }
  }
}
