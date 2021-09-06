part of '../widgets.dart';

class RegistrationWizard extends StatefulWidget {
  final bool selfRegister;
  final String authToken;
  final String email;

  RegistrationWizard({
    this.selfRegister = false,
    this.authToken,
    this.email,
  });

  @override
  _RegistrationWizardState createState() => _RegistrationWizardState();
}

class _RegistrationWizardState extends State<RegistrationWizard> {
  GlobalKey<ScaffoldState> _scaffoldKeyLocal = GlobalKey<ScaffoldState>();
  bool _errorUploadPhoto = false;
  bool _isLoading = false, _showSubmitScreen = false;
  String _loadingText = 'Mohon tunggu...';
  Status _registerStatus = Status.error;
  String _registerMsg = '';
  String _email, _password;
  bool _btnLoading = false;

  final List<GlobalKey<FormBuilderState>> _listFbKey = [
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
  ];

  PageController _pageController;
  ScrollController _scrollController;
  bool _hideLeftNav = true;
  bool _hideRightNav = false;

  int _pageLen;
  int _currentPage = 0;
  List<String> _listFormTitle = ['Profil', 'Alamat', 'Email', 'Dokumen'];

  List<bool> _autovalidate = [false, false, false, false];
  bool _overseasLocation = globals.debugMode ? true : false;
  bool _isInactiveEmail = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _scrollController = new ScrollController();
    _pageLen = _listFormTitle.length;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
    _pageController?.dispose();
  }

  Future<bool> _onWillPop([bool byPassAlert = false]) async {
    if (byPassAlert) {
      return true;
    } else {
      String msg =
          'Apakah Anda ingin membatalkan ${widget.selfRegister ? 'pendaftaran' : 'tambah kader'}?';
      final result = await showOkCancelAlertDialog(
        context: context,
        title: globals.appName,
        message: msg,
        okLabel: 'Ya',
        cancelLabel: 'Tidak',
        barrierDismissible: false,
      );
      if (result == OkCancelResult.ok) {
        return true;
      } else {
        return false;
      }
    }
  }

  _onPageViewChange(int newPage) {
//    print('newPage $newPage');
    int thePage = _currentPage;
    if (newPage > _currentPage && !_validateForm()) {
      // don't advance page
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      _scrollController.jumpTo(0);
      thePage = newPage;
    }

    setState(() {
      _hideLeftNav = thePage == 0 ? true : false;
      _hideRightNav = thePage == _pageLen - 1 ? true : false;
      _currentPage = thePage;
    });
  }

  _onPressedPrev() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  _onPressedNext() {
    if (_validateForm()) {
//      _scrollController.jumpTo(0);
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  bool _validateForm() {
    bool valid = false;
    print('_currentPage $_currentPage');
    setState(() {
      _autovalidate[_currentPage] = true;
    });

    if (_listFbKey[_currentPage].currentState != null &&
        _listFbKey[_currentPage].currentState.saveAndValidate()) {
      print(_listFbKey[_currentPage].currentState.value);
      valid = true;
    } else {
      NetworkUtils.showSnackBar(
        _scaffoldKeyLocal,
        '${_listFormTitle[_currentPage]} belum lengkap, mohon periksa kembali.',
        'ERROR',
      );
    }
    return valid;
  }

  _onSubmit() async {
    if (_validateForm()) {
      _showLoading();
      await _uploadPhoto();
      if (!_errorUploadPhoto) {
        var body = _mergeAndCleanUpMap();
        _submitRegistration(body);
      }
//      _hideLoading();
    }
  }

  Future<String> _uploadFunction(String keyName, File file) async {
    String ep = globals.epUploadImage;
    final resJson = await NetworkUtils.multipartRequest(
      ep,
      keyName,
      file,
      widget.authToken,
    );

    if (resJson != null && resJson['status'] == 'SUCCESS') {
      var url = resJson['data']['url'];
      return url;
    } else {
      setState(() {
        _errorUploadPhoto = true;
//        _showSubmitScreen = false;
      });
      return null;
    }
  }

  Future<Null> _uploadPhoto() async {
    setState(() {
      _loadingText = 'Menyiapkan data...';
    });
    GlobalKey<FormBuilderState> fbDocument = _listFbKey[3];
    File photosLocalUrl =
        fbDocument.currentState.fields['photosLocalUrl'].currentState.value[0];
    File idCardPhotosLocalUrl = fbDocument
        .currentState.fields['idCardPhotosLocalUrl'].currentState.value[0];

    String photosUrl = await _uploadFunction('image', photosLocalUrl);
    setState(() {
      _loadingText = 'Mengirim data...';
    });
    String idCardPhotosUrl =
        await _uploadFunction('image', idCardPhotosLocalUrl);

    if (!_errorUploadPhoto) {
      print('photos $photosUrl');
      print('idCardPhotos $idCardPhotosUrl');
      _listFbKey[3].currentState.setAttributeValue('photos', photosUrl);
      _listFbKey[3]
          .currentState
          .setAttributeValue('idCardPhotos', idCardPhotosUrl);
    } else {
      final msg = 'Gagal menyiapkan data';
      _hideLoading();
      setState(() {
        _registerStatus = Status.error;
        _registerMsg = msg;
      });
    }
    print('end upload photo');
    return null;
  }

  Map<String, dynamic> _mergeAndCleanUpMap() {
    // merge
    Map<String, dynamic> fbProfle = _listFbKey[0].currentState.value;
    Map<String, dynamic> fbAddress = _listFbKey[1].currentState.value;
    Map<String, dynamic> fbEmail = _listFbKey[2].currentState.value;
    Map<String, dynamic> fbDocument = _listFbKey[3].currentState.value;

    // combine map with spread operator
    Map<String, dynamic> fbAll = {};
    fbAll.addAll(fbProfle);
    fbAll.addAll(fbAddress);
    fbAll.addAll(fbEmail);
    fbAll.addAll(fbDocument);

    print('fbAll: $fbAll');

    // check email & password if need to update
    if (_isInactiveEmail) {
      String name = fbAll['name'];
      String kecamatanName =
          _overseasLocation ? fbAll['lnCity'] : fbAll['kecamatan']['name'];
      String combine = '$name@$kecamatanName';
      ReCase temp = ReCase(combine);
      String recaseEmail = '${temp.pascalCase}.nasdem.id';
      fbAll.update('emailAddress', (v) => recaseEmail);
      print('fbAll after upd email: $fbAll');
    }

    if (!widget.selfRegister) {
      String phoneNumber = fbAll['phoneNumber'];
      fbAll.update('password', (v) => phoneNumber);
      print('fbAll after upd pass: $fbAll');
    } else {
      // save email and password for auto login
      setState(() {
        _email = fbAll['emailAddress'];
        _password = fbAll['password'];
      });
    }

    // clean up
    fbAll.remove('provinceId');
    fbAll.remove('kabupatenId');
    fbAll.remove('kecamatan');
    fbAll.remove('birthDateIsoDate');
    fbAll.remove('photosLocalUrl');
    fbAll.remove('idCardPhotosLocalUrl');
    fbAll.remove('checkboxToc');
    fbAll.remove('checkboxConfirmCorrectData');
    if (_overseasLocation) {
      fbAll.remove('rtNumber');
      fbAll.remove('rwNumber');
    } else {
      fbAll.remove('lnCity');
    }
    if (fbAll['address1'] == '') fbAll.remove('address1');
    // convert bool to string
    fbAll.update('overseasLocation', (v) => v.toString());
    fbAll.update('isInactiveEmail', (v) => v.toString());
    // add flag selfRegister
    fbAll.putIfAbsent('selfRegister', () => widget.selfRegister.toString());

    print('fbAll after cleanup: $fbAll');

    return fbAll;
  }

  Future<Null> _submitRegistration(Object body) async {
    String msg;
    setState(() {
      _loadingText = 'Mengirim data...';
    });
    print('body $body');

    String ep = globals.epRegisterSubmit;
    final resJson = await NetworkUtils.httpPost(ep, body, widget.authToken);

    if (resJson != null && resJson['status'] == 'SUCCESS') {
      msg = resJson['message'];
      setState(() {
        _registerStatus = Status.success;
        _isLoading = false;
      });
    } else if (resJson['status'] == 'ERROR') {
      msg = resJson['message'];
    } else {
      msg = globals.msgFailedLoadData;
    }

    setState(() {
      _registerMsg = msg;
    });

    return null;
  }

//  _showFailedRegisterAlert(String msg) async {
//    final result = await showOkAlertDialog(
//      context: context,
////      title: globals.appName,
//      message: msg,
//      okLabel: 'Tutup',
//      barrierDismissible: false,
//    );
//    if (result == OkCancelResult.ok) {
//      // hide submit screen
//      setState(() {
//        _showSubmitScreen = false;
//      });
//    }
//  }

  _clearForm(GlobalKey<FormBuilderState> fbKey, String title) async {
    String msg = 'Apakah Anda ingin menghapus data $title?';
    final result = await showOkCancelAlertDialog(
      context: context,
      title: globals.appName,
      message: msg,
      okLabel: 'Ya',
      cancelLabel: 'Tidak',
    );
    if (result == OkCancelResult.ok) {
      fbKey.currentState.reset();
    }
  }

  _onChangedOverseasLocation(bool v) {
    setState(() {
      _overseasLocation = v;
    });
  }

  _onChangedIsInactiveEmail(bool v) {
    setState(() {
      _isInactiveEmail = v;
    });
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
      _showSubmitScreen = true;
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  _authenticateUser() async {
    setState(() {
      _btnLoading = true;
    });
    String ep = globals.epUserLogin;
    Object body = {'email': _email, 'password': _password};
    var resJson = await NetworkUtils.httpPost(ep, body);

    if (resJson['status'] == 'SUCCESS') {
      // success login
      String authToken = resJson['data']['token'];
      print('authToken auto login $authToken');
      // save auth token
      AuthUtils.saveUserAuthToken(resJson);
      // register dev token for FCM
      AuthUtils.registerUserDeviceToken(authToken);
      // back to prev page with data
      String signedInSuccessMsg = resJson['message'];
      Object respJson = {
        'isLoggedIn': true,
        'signedInSuccessMsg': signedInSuccessMsg
      };
      Navigator.of(context).pop(respJson);
    } else if (resJson['status'] == 'ERROR') {
      final msg = resJson['message'];
      NetworkUtils.showSnackBar(_scaffoldKeyLocal, msg);
    } else {
      final msg = globals.msgFailedLoadData;
      NetworkUtils.showSnackBar(_scaffoldKeyLocal, msg);
    }
    setState(() {
      _btnLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(_registerStatus == Status.success),
      child: Scaffold(
        key: _scaffoldKeyLocal,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title:
                    Text(widget.selfRegister ? 'Registrasi' : 'Tambah Kader'),
                centerTitle: true,
                pinned: true,
                floating: true,
                elevation: 5,
                forceElevated: innerBoxIsScrolled,
                bottom: _showSubmitScreen
                    ? null
                    : PreferredSize(
                        preferredSize: Size(0, 72),
                        child: WizardHeader(
                          currentPage: _currentPage,
                          listFormTitle: _listFormTitle,
                        ),
                      ),
              ),
            ];
          },
          body: Stack(
            children: <Widget>[
              PageView(
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: _onPageViewChange,
                children: <Widget>[
                  FormProfile(
                    fbKey: _listFbKey[0],
                    autovalidate: _autovalidate[0],
                    selfRegister: widget.selfRegister,
                    clearForm: () => _clearForm(
                          _listFbKey[0],
                          _listFormTitle[0],
                        ),
                  ),
                  FormAddress(
                    fbKey: _listFbKey[1],
                    autovalidate: _autovalidate[1],
                    clearForm: () => _clearForm(
                          _listFbKey[1],
                          _listFormTitle[1],
                        ),
                    overseasLocation: _overseasLocation,
                    onChangedOverseasLocation: _onChangedOverseasLocation,
                    selfRegister: widget.selfRegister,
                    scaffoldKey: _scaffoldKeyLocal,
                  ),
                  FormEmail(
                    fbKey: _listFbKey[2],
                    autovalidate: _autovalidate[2],
                    clearForm: () => _clearForm(
                          _listFbKey[2],
                          _listFormTitle[2],
                        ),
                    onChangedIsInactiveEmail: _onChangedIsInactiveEmail,
                    isInactiveEmail: _isInactiveEmail,
                    selfRegister: widget.selfRegister,
                    email: widget.email,
                  ),
                  FormDocument(
                    fbKey: _listFbKey[3],
                    clearForm: () => _clearForm(
                          _listFbKey[2],
                          _listFormTitle[2],
                        ),
                    autovalidate: _autovalidate[3],
                  ),
                ],
              ),
              _showSubmitScreen
                  ? Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: _isLoading
                            ? LoadingScreen(
                                loadingText: _loadingText,
                              )
                            : TitleMessageView(
                                image: 'assets/images/salto.png',
                                title:
                                    '${_registerStatus == Status.success ? 'Berhasil' : 'Gagal'} registrasi kader',
                                message: _registerMsg,
                                textActionButtonStyle: true,
                                loading: _btnLoading,
                                textAction: _registerStatus == Status.success &&
                                        widget.selfRegister
                                    ? 'Masuk Sekarang'
                                    : 'Tutup',
                                textActionOnTap: () {
                                  if (_registerStatus == Status.success &&
                                      widget.selfRegister) {
                                    _authenticateUser();
                                  } else if (_registerStatus ==
                                          Status.success &&
                                      !widget.selfRegister) {
                                    Navigator.of(context).pop(true);
                                  } else {
                                    setState(() {
                                      _showSubmitScreen = false;
                                    });
                                  }
                                },
                              ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        bottomNavigationBar: _showSubmitScreen
            ? null
            : SizedBox(
                height: 75,
                child: WizardNavigation(
                  currentPage: _currentPage,
                  hideLeftNav: _hideLeftNav,
                  hideRightNav: _hideRightNav,
                  onPressedNext: _onPressedNext,
                  onPressedPrev: _onPressedPrev,
                  onSubmit: _onSubmit,
                ),
              ),
      ),
    );
  }
}
