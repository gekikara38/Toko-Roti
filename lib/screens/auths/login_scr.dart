import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:toko_roti/resources/constants.dart';
import 'package:toko_roti/resources/widgets/separator_text.dart';
import 'package:toko_roti/resources/widgets/size_config.dart';
import 'package:toko_roti/resources/widgets/terms_conditions.dart';
import 'package:toko_roti/services/authentication.dart';

bool _signUpActive = false;
bool _signInActive = true;

class LoginScreen extends StatefulWidget {
  LoginScreen({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = new GlobalKey<FormState>();

  String _username;
  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

  TabController controller;

  //check if form is valid before perform login or sgnup

  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _changeToSignUp() {
    resetForm();
    setState(() {
      _signUpActive = true;
      _signInActive = false;
      _isLoginForm = false;
//      print(_isLoginForm);
    });
  }

  void _changeToSignIn() {
    resetForm();
    setState(() {
      _signUpActive = false;
      _signInActive = true;
      _isLoginForm = true;
//      print(_isLoginForm);
    });
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formkey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formkey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    if (_signInActive == false) {
      print(_isLoginForm);
      setState(() {
        _changeToSignIn();
      });
    } else {
      print(_isLoginForm);
      setState(() {
        _changeToSignUp();
        _isLoginForm = !_isLoginForm;
        print(_isLoginForm);
      });
    }
//    resetForm();
//    setState(() {
//      _isLoginForm = !_isLoginForm;
//    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.init(context, allowFontScaling: false);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: CPalette.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CPalette.backgroundColor2,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/app_logo.png",
                  scale: MediaQuery.of(context).size.aspectRatio * 7,
                ),
//                scale: MediaQuery.of(context).size.height*0.004,)
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.square(MediaQuery.of(context).size.height * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(35),
                    horizontal: ScreenUtil().setWidth(70)),
                color: _signInActive ? Colors.white : Colors.transparent,
                onPressed: _changeToSignIn,
//                borderSide: new BorderSide(
//                  style: BorderStyle.none,
//                ),
                child: new Text("LOGIN",
                    style: _signInActive ? TStyle.active : TStyle.disable),
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal * 12),
              FlatButton(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(35),
                    horizontal: ScreenUtil().setWidth(55)),
                color: _signInActive ? Colors.transparent : Colors.white,
                onPressed: _changeToSignUp,
                child: new Text(
                  "SIGN UP",
                  style: _signUpActive ? TStyle.active : TStyle.disable,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30),
                        vertical: ScreenUtil().setHeight(50)),
                    child:
                        _signInActive ? _showSignIn(context) : _showSignUp()),
                _showCircularProgress(),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          TermsConditions(),
        ],
      ),
    );
  }

  Widget _showSignIn(context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
          key: _formkey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              emailInput(),
              passwordInput(),
              showPrimaryButton(),
              SeparatorText(),
              socialMedia(),
            ],
          )),
    );
  }

  Widget _showSignUp() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
          key: _formkey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              usernameInput(),
              emailInput(),
              passwordInput(),
              showPrimaryButton(),
              SeparatorText(),
              socialMedia(),
              showErrorMessage(),
            ],
          )),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget usernameInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(35), 0.0, 0.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(35)),
          border: InputBorder.none,
          hintText: "Username",
          hintStyle: TStyle.hint,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Username can\'t be empty' : null,
        onSaved: (value) => _username = value.trim(),
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(35), 0.0, 0.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(35)),
          border: InputBorder.none,
          hintText: "Email address",
          hintStyle: TStyle.hint,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            Icons.mail_outline,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget passwordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(35), 0.0, 0.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(35)),
          border: InputBorder.none,
          hintText: "Password",
          hintStyle: TStyle.hint,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(35), 0.0, 0.0),
        child: SizedBox(
          height: ScreenUtil().setHeight(100.0),
          width: ScreenUtil().setWidth(300.0),
          child: new RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0)),
            color: CPalette.secondaryColor,
            child: new Text(_isLoginForm ? 'LOGIN' : 'SIGN UP',
                style: TStyle.button),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget socialMedia() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
              child: RaisedButton.icon(
                  elevation: 0,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(10)),
                  onPressed: () {},
                  icon: new Image.asset(
                    "assets/icons/google.png",
                    scale: MediaQuery.of(context).devicePixelRatio * 5,
                  ),
                  label: Text(
                    "Google",
                    style: TStyle.button2,
                  )),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
              child: RaisedButton.icon(
                  elevation: 0,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(10)),
                  onPressed: () {},
                  icon: new Image.asset(
                    "assets/icons/facebook.png",
                    scale: MediaQuery.of(context).devicePixelRatio * 5,
                  ),
                  label: Text(
                    "Facebook",
                    style: TStyle.button2,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
