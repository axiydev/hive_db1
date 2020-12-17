import 'package:hive/hive.dart';
class HiveDB{
  //Signin uchun
  static var box=Hive.box('hive_tb');
  static storeStr({String username,String pass})async{
    await box.put('username',username);
    await box.put('password',pass);
  }
  static Map<String,dynamic> loadStr(){
    Map<String,dynamic> mp=new Map();
    mp['username']=box.get('username');
    mp['password']=box.get('password');
    return mp;
  }
  static removeStr()async{
    await box.delete('username');
    await box.delete('password');
  }

//   Signup uchun
  static storeAccount({String username,String email,String phone,String pass})async{
    await box.put('user',username);
    await box.put('email',email);
    await box.put('phone',phone);
    await box.put('pass',pass);
  }
  static Map<String,dynamic> loadAccount(){
    Map<String,dynamic> mp1=new Map();
    mp1['user']=box.get('user');
    mp1['email']=box.get('email');
    mp1['phone']=box.get('phone');
    mp1['pass']=box.get('pass');
    return mp1;
  }
  static removeAccount()async{
    await box.delete('username');
    await box.delete('email');
    await box.delete('phone');
    await box.delete('password');
  }
}