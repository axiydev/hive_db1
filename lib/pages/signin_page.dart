import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_db1/pages/signup_page.dart';
import 'package:hive_db1/service/hive_service.dart';
class SignIn extends StatefulWidget {
  static const String id='signin_page';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _userNameController=new TextEditingController();
  final _passController=new TextEditingController();
  void _doLogin(){
    String username=_userNameController.text.toString().trim();
    String password=_passController.text.toString().trim();
    HiveDB.storeStr(username:username,pass:password);
  //  tekshirish uchun
    Map<String,dynamic> m=HiveDB.loadStr();
    print(m['username']);
    print(m['password']);
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
                    Container(
                      height:65,
                      width:65,
                      child:ClipRRect(
                        borderRadius:BorderRadius.circular(20),
                        child:Image(
                          image:AssetImage('assets/images/ic_profil.jpg'),
                          fit:BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    //  #text span
                    Container(
                      width: double.infinity,
                      child:RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                          text:'Welcome Back!\n',
                          style:GoogleFonts.poppins(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 30,letterSpacing: 1),
                          children: [
                            TextSpan(
                              text:'Sign in to continue',
                              style:GoogleFonts.poppins(color:Colors.grey[300],fontWeight: FontWeight.w500,fontSize: 19,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    //  #text fields
                    _fields(icon:FontAwesomeIcons.user,text:'User Name',control: _userNameController,isPass: false),
                    SizedBox(height:10),
                    _fields(icon:FontAwesomeIcons.key,text:'Password',control: _passController,isPass: true),
                    SizedBox(height:20),
                    //#forget pass
                    Text('Forgot Password?',style:GoogleFonts.poppins(fontSize: 16,color:Colors.grey[500])),
                    SizedBox(height:30),
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
                          _doLogin();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //#Don`t have an account
              Expanded(
                flex:1,
                child:Container(
                  width: double.infinity,
                  margin:EdgeInsets.only(bottom: 25),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('Don\'t have an account? ',style:GoogleFonts.poppins(fontSize: 16,color:Colors.grey[500])),
                      GestureDetector(
                        child:Text('Sign Up'.toUpperCase(),style:GoogleFonts.poppins(fontSize: 16,color:Colors.blue,)),
                        onTap:()async{
                          await Navigator.pushNamed(context,SignUp.id);
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
  Widget _fields({icon ,text,control,isPass}){
    return Container(
      width: double.infinity,
      decoration:BoxDecoration(
        border:Border(bottom: BorderSide(width: 1.5,color:Colors.grey[300],),),
      ),
      child:TextField(
        controller: control,
        obscureText: isPass?true:false,
        style: GoogleFonts.poppins(
          color:Colors.grey[300],
        ),
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

