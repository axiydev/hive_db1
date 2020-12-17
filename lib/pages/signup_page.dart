import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_db1/pages/signin_page.dart';
import 'package:hive_db1/service/hive_service.dart';
class SignUp extends StatefulWidget {
  static const String id='signup_page';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userNameController=new TextEditingController();
  final _emailController=new TextEditingController();
  final _phoneNumController=new TextEditingController();
  final _passController=new TextEditingController();
  void _doLogin1(){
    String username=_userNameController.text.toString().trim();
    String email=_emailController.text.toString().trim();
    String phone=_phoneNumController.text.toString().trim();
    String password=_passController.text.toString().trim();
    HiveDB.storeAccount(username: username,email: email,phone: phone,pass: password);
    //  tekshirish uchun

    Map<String,dynamic> m1=HiveDB.loadAccount();
    print(m1['user']);
    print(m1['email']);
    print(m1['phone']);
    print(m1['pass']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //rgb(26, 29, 55)
      backgroundColor:Color.fromRGBO(26, 29, 55, 1),
      body: SingleChildScrollView(
        child:Container(
          margin:EdgeInsets.symmetric(horizontal: 30,),
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Expanded(
                flex:10,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    //#profil image
                    SizedBox(height: 20,),
                    //  #text span
                    Container(
                      width: double.infinity,
                      child:RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                          text:'Create\n',
                          style:GoogleFonts.poppins(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 30,letterSpacing: 1),
                          children: [
                            TextSpan(
                              text:'Account',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    //  #text fields
                    //#username
                    _fields1(icon:FontAwesomeIcons.user,text:'User Name',control: _userNameController,isPass: false),
                    //#email
                    _fields1(icon:FontAwesomeIcons.envelope,text:'E-Mail',control: _emailController,isPass: false),
                    //#phone number
                    _fields1(icon:FontAwesomeIcons.phone,text:'Phone Number',control: _phoneNumController,isPass: false),
                    //password
                    _fields1(icon:FontAwesomeIcons.key,text:'Password',control: _passController,isPass: true),
                    SizedBox(height:40),
                    //  #button
                    Container(
                      height: 70,
                      width:70,
                      decoration:BoxDecoration(
                        shape:BoxShape.circle,
                        gradient:LinearGradient(
                          begin: Alignment(-1,-1),
                          colors:[
                            Colors.blue,
                            Colors.blue[700],
                            Colors.blue[600],
                            Colors.blue[500],
                            Colors.lightBlue[200],
                          ],
                        ),
                      ),
                      child:IconButton(
                        icon:Icon(Icons.arrow_forward_sharp,size:35,color:Colors.white),
                        onPressed:(){
                       _doLogin1();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //#Already have an account
              Expanded(
                flex:1,
                child:Container(
                  width: double.infinity,
                  margin:EdgeInsets.only(bottom: 25),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('Already have an account? ',style:GoogleFonts.poppins(fontSize: 16,color:Colors.grey[500])),
                      GestureDetector(
                        child:Text('Sign In'.toUpperCase(),style:GoogleFonts.poppins(fontSize: 16,color:Colors.blue,)),
                        onTap:(){
                          Navigator.pushNamed(context, SignIn.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
  Widget _fields1({icon ,text,control,isPass}){
    return Container(
      width: double.infinity,
      margin:EdgeInsets.only(bottom: 10),
      decoration:BoxDecoration(
        border:Border(bottom: BorderSide(width: 1.5,color:Colors.grey[300],),),
      ),
      child:TextField(
        controller: control,
        style:GoogleFonts.poppins(
          color:Colors.grey[300],
        ),
        obscureText: isPass?true:false,
        decoration:InputDecoration(
          hintText: text,
          hintStyle:GoogleFonts.poppins(
            color:Colors.grey[300],
          ),
          border:InputBorder.none,
          icon:FaIcon(icon,color:Colors.grey[300],size:20),
        ),
      ),
    );
}
}

