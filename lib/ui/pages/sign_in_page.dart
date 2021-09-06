part of 'pages.dart';

class signString {
  static const BUTTON_LOGIN = "Masuk";
  static const TITLE_WELCOME = "Selamat datang!";
  static const TITLE_DESC = "Silakan masuk untuk memulai aplikasi";
  static const BOLD_FONT = "MaisonNeue bold";
  static const SEMI_FONT = "MaisonAjai";
  static const LABEL_EMAIL = "Email";
  static const HINT_EMAIL = "Email";
  static const LABEL_PASSWORD = "Password";
  static const HINT_PASSWORD = "Password";
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 100, right:  150),
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Image.asset("assets/horiz-logo.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text.rich(
                    TextSpan(
//                  text: String.TITLE_WELCOME, // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: signString.TITLE_WELCOME,
                            style: TextStyle(
                                fontFamily: signString.BOLD_FONT,
                                fontSize: 30,
                                color: Color(0xFF4C6D87))),
                        TextSpan(
                            text: '\nSilakan masuk untuk memulai aplikasi',
                            style: TextStyle(
                                fontFamily: signString.SEMI_FONT,
                                fontSize: 18,
                                color: Color(0xFF4C6D87)))
                      ],
                    ),
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isEmailValid = EmailValidator.validate(text);
                    });
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: signString.LABEL_EMAIL,
                    hintText: signString.HINT_EMAIL,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isPasswordValid = text.length >= 6;
                    });
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: signString.LABEL_PASSWORD,
                    hintText: signString.HINT_PASSWORD,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 43,
                    margin: EdgeInsets.only(bottom: 50),
                    child: isSigningIn
                        ? SpinKitFadingCircle(color: Color(0xFF0676DC))
                        : FloatingActionButton.extended(
                            label: Text(signString.BUTTON_LOGIN,
                                style: TextStyle(
                                    fontFamily: signString.SEMI_FONT,
                                    fontSize: 18)),
                            backgroundColor: Color(0xFF0676DC),
//                            onPressed: isEmailValid && isPasswordValid
//                                ? () async {
//                                    setState(() {
//                                      isSigningIn = true;
//                                    });
//
//                                    SignInSignUpResult result =
//                                        await AuthServices.signIn(
//                                            emailController.text,
//                                            passwordController.text);
//
//                                    if (result.user = null) {
//                                      setState(() {
//                                        isSigningIn = false;
//                                      });
//
//                                      Flushbar(
//                                          duration: Duration(seconds: 4),
//                                          flushbarPosition:
//                                              FlushbarPosition.TOP,
//                                          backgroundColor: Color(0xffFFB3B3),
//                                          message: result.message)
//                                        ..show(context);
//                                    }
//                                  }
//                                : null,
                      onPressed: () {
//                        print('IM PRESSED');
                        context.bloc<PageBloc>().add(GoToMainPage());
                      },
                          ),
                  ),
                ),

                // YANG BENAR //
//                SizedBox(
//                  width: 300,
//                  height: 43,
//                  child: isSigningIn
//                      ? SpinKitFadingCircle(color: Color(0xFF0676DC))
//                      : new RaisedButton(
//                          color: Color(0xFF0676DC),
//                          textColor: Colors.white,
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(30)),
//                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                          onPressed: isEmailValid && isPasswordValid
//                              ? () async {
//                                  setState(() {
//                                    isSigningIn = true;
//                                  });
//
//                                  SignInSignUpResult result =
//                                      await AuthServices.signIn(
//                                          emailController.text,
//                                          passwordController.text);
//
//                                  if (result.user = null) {
//                                    setState(() {
//                                      isSigningIn = false;
//                                    });
//
//                                    Flushbar(
//                                        duration: Duration(seconds: 4),
//                                        flushbarPosition: FlushbarPosition.TOP,
//                                        backgroundColor: Color(0xffFFB3B3),
//                                        message: result.message)
//                                      ..show(context);
//                                  }
//                                }
//                              : null,
////                onPressed: () {
////                  context.bloc<PageBloc>().add(GoToMainPage());
////                },
//                          child: new Text(String.BUTTON_LOGIN,
//                              style: TextStyle(
//                                  fontFamily: String.SEMI_FONT, fontSize: 18)),
//                        ),
//                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
