part of 'widgets.dart';

class StringSplash {
  static const BUTTON = "Mulai";
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Spash page"),
//      ),
      body: Center(
        child: Image.asset("assets/vertical_logo.png")
//        child: RaisedButton(
//            child: Text(StringSplash.BUTTON),
//            onPressed: () {
//              context.bloc<PageBloc>().add(GoToLoginPage());
//            }),
      ),
    );
  }
}

//
//class SplashPage extends StatefulWidget {
//  @override
//  _SplashPageState createState() => new _SplashPageState();
//}
//
//class _SplashPageState extends State<SplashPage> {
//  @override
//  void initState() {
//    super.initState();
////    _checkFirstSeen();
//  }
//
////  Future _checkFirstSeen() async {
////    SharedPreferences prefs = await SharedPreferences.getInstance();
////    bool _seen = (prefs.getBool('seen') ?? false);
////
////    if (_seen) {
////      Navigator.pushReplacement(
////        context,
////        NoTransitionRoute(widget: TabView()),
////      );
////    } else {
////      prefs.setBool('seen', true);
////      Navigator.pushReplacement(
////        context,
////        NoTransitionRoute(widget: Intro()),
////      );
////    }
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: LoadingScreen(),
//      ),
//    );
//  }
//}
