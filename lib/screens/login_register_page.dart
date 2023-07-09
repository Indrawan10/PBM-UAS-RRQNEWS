import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});
  static const routeName = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool isPasswordVisible =
      false; // Tambahkan variabel untuk mengatur visibilitas password

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  String get username => _controllerUsername.text;

  Widget _title() {
    return Text(
      'RRQ Esports',
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    bool
        isPassword, // Tambahkan parameter untuk menandai apakah input ini adalah password
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            obscureText: isPassword
                ? !isPasswordVisible
                : false, // Mengatur visibilitas password
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey.shade800,
              filled: true,
              hintStyle: TextStyle(color: Colors.white70),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon:
                  isPassword // Menambahkan ikon mata untuk mengubah visibilitas password
                      ? IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        )
                      : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Error: $errorMessage',
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.orange, Colors.deepOrange],
          ),
        ),
        child: Text(
          isLogin ? 'Login' : 'Register',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          isLogin ? 'Register Instead' : 'Login Instead',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.grey.shade900],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(height: 50),
              if (!isLogin) _entryField('Username', _controllerUsername, false),
              _entryField('Email', _controllerEmail, false),
              _entryField('Password', _controllerPassword,
                  true), // Tandai input ini sebagai password
              _errorMessage(),
              SizedBox(height: 20),
              _submitButton(),
              SizedBox(height: 10),
              _loginOrRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
