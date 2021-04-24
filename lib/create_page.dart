import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String name;
  String surname;
  String email;
  String password;
  var appSharedPreferences;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) => appSharedPreferences);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    appSharedPreferences.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              bottom: 0.0,
              top: 0.0,
              right: 0.0,
              left: 100,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40))),
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
                                  return 'Please enter name text';
                                }
                                return null;
                              },
                              initialValue: name,
                              cursorColor: Colors.white,
                              onSaved: (value){
                                name = value;
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
                                labelText: "Name",
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
                                  return 'Please enter surname text';
                                }
                                return null;
                              },
                              initialValue: surname,
                              cursorColor: Colors.white,
                              onSaved: (deger){
                                surname = deger;
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
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.person, color: Colors.white, size: 22,),
                                  labelText: "Surname",
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
                                  return 'Please enter email text';
                                }
                                return null;
                              },
                              initialValue: email,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.white,
                              onSaved: (deger){
                                email = deger;
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
                                prefixIcon: Icon(Icons.email, color: Colors.white, size: 22,),
                                labelText: "E-Mail",
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
                              initialValue: password,
                              cursorColor: Colors.white,
                              onSaved: (value){
                                password = value;
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
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white, size: 22,),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                              ),
                            ),
                            SizedBox(height: 60,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("REGISTER",style: TextStyle(color: Colors.white),),
                                SizedBox(width:15 ,),
                                ElevatedButton(onPressed: (){
                                  if(formKey.currentState.validate()){
                                    formKey.currentState.save();
                                    _addUser();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(content: Text("Register inormation:\n name : $name\n surname: $surname\n email: $email \n password: $password")));
                                  }
                                },
                                  style: ButtonStyle(
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
                                child: Text("Have someone? LOGIN", style: TextStyle(color: Colors.white),),
                                onTap: (){
                                  setState(() {
                                    if(name !=null && surname!=null && password!= null && email!=null){
                                      Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => LoginPage(name: name,surname: surname,password: password,email: email,)));
                                    }
                                    else{
                                      Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => LoginPage()));
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 130,
                left: 15,
                child: Text("M\nA\nR\nK\nA\n", style: TextStyle(fontSize: 40,fontFamily: "MarkaFont"),)
            ),
            Positioned(
              bottom: 25,
              left: 45,
              child: Container(
                child: Image.asset("images/icon2.png",width: 100,height: 250,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addUser() async {
    formKey.currentState.save();
    await (appSharedPreferences as SharedPreferences).setString("spName", name);
    await (appSharedPreferences as SharedPreferences).setString("spSurname", surname);
    await (appSharedPreferences as SharedPreferences).setString("spEmail", email);
    await (appSharedPreferences as SharedPreferences).setString("spPassword", password);
  }
}
