part of 'widgets.dart';

class AddVoter extends StatefulWidget {
  @override
  _AddVoterState createState() => _AddVoterState();
}

class _AddVoterState extends State<AddVoter> {
//  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoggedIn = true;
  bool _verified = true;
  var _authToken;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
  }

  _fetchSessionAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = AuthUtils.getToken(prefs);

    if (authToken != null) {
      setState(() {
        _authToken = authToken;
        _isLoggedIn = true;
        _verified = AuthUtils.getVerified(prefs) ?? false;
      });
    } else {
      setState(() {
        _authToken = null;
        _isLoggedIn = false;
      });
    }
  }

  _goToLogin() {
    Navigator.push(
      context,
      NoTransitionRoute(widget: SignInPage()),
    ).then((resJson) {
      _fetchSessionAndNavigate();
//      print('resJson $resJson');
      if (resJson != null && resJson['isLoggedIn']) {
        NetworkUtils.showSnackBar(_scaffoldKey, resJson['signedInSuccessMsg']);
      }
    });
  }

//  _goToAccount() {
//    Navigator.pushAndRemoveUntil(
////        context,
////        NoTransitionRoute(widget: TabView(tabKey: 'account')),
////        (Route<dynamic> route) => false);
//  }

  @override
  Widget build(BuildContext context) {
    Widget viewNotLoggedIn() {
      return ViewNotLoggedIn(
        title: 'Ayo ajak teman untuk bergabung',
        image: 'assets/images/tambah_kader.png',
        message: 'Silakan buat akun / masuk terlebih dahulu '
            'untuk menambah kader',
        textAction: 'Masuk / Daftar',
        textActionOnTap: _goToLogin,
        textActionButtonStyle: true,
      );
    }

//    Widget viewNotVerified() {
//      return ViewNotLoggedIn(
//        image: 'assets/images/placeholder.png',
//        title: 'Anda belum diverifikasi',
//        message: 'Tap Akun untuk melihat status verifikasi Anda',
//        textAction: 'Lihat Status Verifikasi',
//        textActionOnTap: _goToAccount,
//        textActionButtonStyle: true,
//      );
//    }

    return _isLoggedIn && _verified
        ? RegistrationWizard(
            selfRegister: true,
            authToken: _authToken,
            email: '',
          )
        : Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            key: _scaffoldKey,
//            appBar: AppBar(
//              elevation: 0,
//              title: Text('Tambah Timses'),
//              centerTitle: true,
//              backgroundColor: Color(0xFF0676DC),
//            ),
            body: RegistrationWizard(selfRegister: true ),
          );
  }
}
