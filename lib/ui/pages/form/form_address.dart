//part of '../pages.dart';
//
//class FormAddress extends StatefulWidget {
//  final GlobalKey<FormBuilderState> fbKey;
//  final VoidCallback clearForm;
//  final bool autovalidate;
//  final bool overseasLocation;
//  final Function(bool) onChangedOverseasLocation;
//  final bool selfRegister;
//  final GlobalKey<ScaffoldState> scaffoldKey;
//
//  FormAddress({
//    Key key,
//    @required this.fbKey,
//    @required this.clearForm,
//    @required this.autovalidate,
//    @required this.overseasLocation,
//    @required this.onChangedOverseasLocation,
//    @required this.selfRegister,
//    @required this.scaffoldKey,
//  }) : super(key: key);
//
//  @override
//  _FormAddressState createState() => _FormAddressState();
//}
//
//class _FormAddressState extends State<FormAddress>
//    with AutomaticKeepAliveClientMixin<FormAddress> {
////  final GlobalKey<FormBuilderState> _localAddressFbKey =
////      GlobalKey<FormBuilderState>();
//
//  Future<List<Province>> _provinces;
//  ScrollController _scrollController;
//  bool _isLoading = true;
//  Map<String, List<dynamic>> _location = {
//    'kabupaten': null,
//    'kecamatan': null,
//    'kelurahan': null,
//  };
//
//  @override
//  void initState() {
//    super.initState();
//    _fetchProvinceLocal();
//    WidgetsBinding.instance.addPostFrameCallback((_) => afterLayout(context));
//  }
//
//  @override
//  bool get wantKeepAlive => true;
//
//  afterLayout(BuildContext context) async {
//    _fetchProvince();
//  }
//
//  Future<Null> _fetchProvinceLocal([bool showLoading = true]) async {
//    if (showLoading) _showLoading();
//    String ep = '${globals.epLocationProvince}';
//    // local
//    final resJsonLocal = await NetworkUtils.getLocalApiValue(ep);
////    print('Province resJsonLocal $resJsonLocal');
//    if (resJsonLocal['status'] == 'SUCCESS') {
////      print('use local initially');
//      final data = resJsonLocal['data'];
//      setState(() {
//        _provinces = compute(parseResponse, jsonEncode(data));
//      });
//    }
////    _hideLoading();
//    return null;
//  }
//
//  Future<Null> _fetchProvince() async {
//    String msg = '';
//    var data;
//
//    String ep = '${globals.epLocationProvince}';
//
//    // get online & local
//    final resJsonLocal = await NetworkUtils.getLocalApiValue(ep);
//    final resJson = await NetworkUtils.httpGet(ep);
////    print('Province resJsonLocal $resJsonLocal');
//    final diff = JsonPatch.diff(resJson, resJsonLocal);
//
//    if (diff.length == 0) {
//      print('Province same');
//    } else {
//      print('Province diff');
//      if (resJson['status'] == 'SUCCESS') {
//        data = resJson['data'];
//        // set new value from online
//        await NetworkUtils.setLocalApiValue(ep, resJson);
//        setState(() {
//          _provinces = compute(parseResponse, jsonEncode(data));
//        });
//      } else if (resJson['status'] == 'ERROR') {
//        msg = resJson['message'];
//        msg = msg == globals.msgNoInternet
//            ? msg + ' ' + globals.msgUseOfflineData
//            : msg;
//      } else {
//        msg = globals.msgFailedLoadData;
//      }
//      if (msg != '') NetworkUtils.showSnackBar(widget.scaffoldKey, msg);
//    }
//    _hideLoading();
//    return null;
//  }
//
//  void _fetchLocationListById(String baseEp, int id, String location) async {
//    // reset
//    setState(() {
//      _location[location] = null;
//    });
//    String msg = '';
//    String ep = '$baseEp/$id';
//    final resJson = await NetworkUtils.httpGet(ep);
//    if (resJson['status'] == 'SUCCESS') {
//      setState(() {
//        _location[location] = resJson['data'];
//      });
//    } else if (resJson['status'] == 'ERROR') {
//      msg = resJson['message'];
//      msg = msg == globals.msgNoInternet
//          ? msg + ' ' + globals.msgUseOfflineData
//          : msg;
//    } else {
//      msg = globals.msgFailedLoadData;
//    }
//    if (msg != '') NetworkUtils.showSnackBar(widget.scaffoldKey, msg);
//    return null;
//  }
//
//  _showLoading() {
//    setState(() {
//      _isLoading = true;
//    });
//  }
//
//  _hideLoading() {
//    setState(() {
//      _isLoading = false;
//    });
//  }
//
//  _clearForm() {
//    widget.clearForm();
//    // invalidate children
//    setState(() {
//      _location['kabupaten'] = null;
//      _location['kecamatan'] = null;
//      _location['kelurahan'] = null;
//    });
//  }
//
//  _clearAllLocation() {
//    setState(() {
//      _location['kabupaten'] = null;
//      _location['kecamatan'] = null;
//      _location['kelurahan'] = null;
//    });
//  }
//
//  _onSelectProvince(int id) {
//    if (id != null) {
//      print('provinceId $id');
//      // invalidate children
//      _clearAllLocation();
//      _fetchLocationListById(
//        globals.epLocationKabupatenByProvinceId,
//        id,
//        'kabupaten',
//      );
//    }
//  }
//
//  _onSelectKabupaten(int id) {
//    if (id != null) {
//      print('kabupatenId $id');
//      // invalidate children
//      setState(() {
//        _location['kecamatan'] = null;
//        _location['kelurahan'] = null;
//      });
//      _fetchLocationListById(
//        globals.epLocationKecamatanByKabupatenId,
//        id,
//        'kecamatan',
//      );
//    }
//  }
//
//  _onSelectKecamatan(dynamic val) {
//    if (val != null) {
//      print('kecamatanId ${val['id']}');
//      // invalidate children
//      setState(() {
//        _location['kelurahan'] = null;
//      });
//      _fetchLocationListById(
//        globals.epLocationKelurahanByKecamatanId,
//        val['id'],
//        'kelurahan',
//      );
//    }
//  }
//
//  _onSelectKelurahan(String id) {
//    if (id != null) {
//      print('location/kelurahanId $id');
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//
//    country.sort(
//          (a, b) => a.value.toLowerCase().compareTo(b.value.toLowerCase()),
//    );
//
//    return ListView(
//      controller: _scrollController,
//      padding: EdgeInsets.symmetric(horizontal: horizontalPadd),
////      child: Column(
//      children: <Widget>[
//        FutureBuilder(
//          future: _provinces,
//          builder:
//              (BuildContext context, AsyncSnapshot<List<Province>> snapshot) {
//            if (snapshot.hasData) {
//              List<Province> list = snapshot.data;
//
//              return FormBuilder(
//                key: widget.fbKey,
//                initialValue: {
//                  'overseasLocation': widget.overseasLocation,
//                  'location': globals.debugMode && widget.overseasLocation
//                      ? '5ee5a4a4e1996c1ba3c80bdf'
//                      : null,
//                  'lnCity': globals.debugMode ? 'Houston' : null,
//                  'rtNumber': globals.debugMode ? '1' : null,
//                  'rwNumber': globals.debugMode ? '5' : null,
//                  'address':
//                  globals.debugMode ? 'Jl. Warakas VI No 97-99' : null,
//                },
//                autovalidate: widget.autovalidate,
//                child: Column(
//                  children: <Widget>[
//                    SizedBox(height: verticalSpace / 2),
//                    FormBuilderCheckbox(
//                      attribute: 'overseasLocation',
//                      label: Text(
//                        "${widget.selfRegister ? 'Saya' : 'Kader'} berdomisili di luar negeri",
//                        style: labelStyle,
//                      ),
//                      leadingInput: true,
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        errorStyle: errorStyle,
//                      ),
//                      onChanged: (v) {
//                        _clearAllLocation();
//                        widget.onChangedOverseasLocation(v);
//                      },
//                    ),
//                    SizedBox(height: verticalSpace / 2),
//                    !widget.overseasLocation
//                        ? Column(
//                      children: <Widget>[
//                        FormBuilderDropdown(
//                          attribute: 'provinceId',
//                          style: textStyle,
//                          hint: Text(hintTextSelect),
//                          decoration: InputDecoration(
//                            labelText: "Provinsi",
//                            labelStyle: labelStyle,
//                            border: OutlineInputBorder(
//                                borderSide: BorderSide()),
//                            errorStyle: errorStyle,
//                          ),
//                          validators: [
//                            FormBuilderValidators.required(
//                                errorText: requiredSelectMsg),
//                          ],
//                          items: list
//                              .map(
//                                (item) => DropdownMenuItem(
//                              value: item.id,
//                              child: Text(item.name),
//                            ),
//                          )
//                              .toList(),
//                          onChanged: (v) => _onSelectProvince(v),
//                        ),
//                        _location['kabupaten'] != null
//                            ? SizedBox(height: verticalSpace)
//                            : Container(),
//                        _location['kabupaten'] != null
//                            ? FormBuilderDropdown(
//                          attribute: 'kabupatenId',
//                          style: textStyle,
//                          hint: Text(hintTextSelect),
//                          decoration: InputDecoration(
//                            labelText: "Kabupaten/Kota",
//                            labelStyle: labelStyle,
//                            border: OutlineInputBorder(
//                                borderSide: BorderSide()),
//                            errorStyle: errorStyle,
//                          ),
//                          validators: [
//                            FormBuilderValidators.required(
//                                errorText: requiredSelectMsg),
//                          ],
//                          items: _location['kabupaten'] != null &&
//                              _location['kabupaten'].length > 0
//                              ? _location['kabupaten']
//                              .map(
//                                (item) => DropdownMenuItem(
//                              value: item['id'],
//                              child: Text(item['name']),
//                            ),
//                          )
//                              .toList()
//                              : null,
//                          onChanged: (v) => _onSelectKabupaten(v),
//                        )
//                            : Container(),
//                        // kecamatan
//                        _location['kecamatan'] != null
//                            ? SizedBox(height: verticalSpace)
//                            : Container(),
//                        _location['kecamatan'] != null
//                            ? FormBuilderDropdown(
//                          attribute: 'kecamatan',
//                          style: textStyle,
//                          hint: Text(hintTextSelect),
//                          decoration: InputDecoration(
//                            labelText: "Kecamatan",
//                            labelStyle: labelStyle,
//                            border: OutlineInputBorder(
//                                borderSide: BorderSide()),
//                            errorStyle: errorStyle,
//                          ),
//                          validators: [
//                            FormBuilderValidators.required(
//                                errorText: requiredSelectMsg),
//                          ],
//                          items: _location['kecamatan'] != null &&
//                              _location['kecamatan'].length > 0
//                              ? _location['kecamatan']
//                              .map(
//                                (item) => DropdownMenuItem(
//                              value: item,
//                              child: Text(item['name']),
//                            ),
//                          )
//                              .toList()
//                              : null,
//                          onChanged: (v) => _onSelectKecamatan(v),
//                        )
//                            : Container(),
//                        // kelurahan
//                        _location['kelurahan'] != null
//                            ? SizedBox(height: verticalSpace)
//                            : Container(),
//                        _location['kelurahan'] != null
//                            ? FormBuilderDropdown(
//                          attribute: 'location',
//                          style: textStyle,
//                          hint: Text(hintTextSelect),
//                          decoration: InputDecoration(
//                            labelText: "Kelurahan",
//                            labelStyle: labelStyle,
//                            border: OutlineInputBorder(
//                                borderSide: BorderSide()),
//                            errorStyle: errorStyle,
//                          ),
//                          validators: [
//                            FormBuilderValidators.required(
//                                errorText: requiredSelectMsg),
//                          ],
//                          items: _location['kelurahan'] != null &&
//                              _location['kelurahan'].length > 0
//                              ? _location['kelurahan']
//                              .map(
//                                (item) => DropdownMenuItem(
//                              value: item['id'],
//                              child: Text(item['name']),
//                            ),
//                          )
//                              .toList()
//                              : null,
//                          onChanged: (v) => _onSelectKelurahan(v),
//                        )
//                            : Container(),
//                      ],
//                    )
//                        : FormBuilderDropdown(
//                      attribute: "location",
//                      style: textStyle,
//                      hint: Text(hintTextSelect),
//                      decoration: InputDecoration(
//                        labelText: "Negara",
//                        labelStyle: labelStyle,
//                        border:
//                        OutlineInputBorder(borderSide: BorderSide()),
//                        errorStyle: errorStyle,
//                      ),
//                      validators: [
//                        FormBuilderValidators.required(
//                            errorText: requiredSelectMsg),
//                      ],
//                      items: country
//                          .map(
//                            (item) => DropdownMenuItem(
//                          value: item.key,
//                          child: Text("${item.value}"),
//                        ),
//                      )
//                          .toList(),
//                    ),
//                    widget.overseasLocation
//                        ? SizedBox(height: verticalSpace)
//                        : Container(),
//                    widget.overseasLocation
//                        ? FormBuilderTextField(
//                      attribute: "lnCity",
//                      style: textStyle,
//                      textInputAction: TextInputAction.done,
//                      textCapitalization: TextCapitalization.none,
//                      autocorrect: false,
//                      decoration: InputDecoration(
//                        labelText: "Kota (Luar Negeri)",
//                        labelStyle: labelStyle,
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide(),
//                        ),
//                        errorStyle: errorStyle,
//                      ),
//                      validators: [
//                        FormBuilderValidators.required(
//                            errorText: requiredTxtMsg),
//                      ],
//                    )
//                        : Container(),
//                    SizedBox(height: verticalSpace),
//                    FormBuilderTextField(
//                      attribute: "address",
//                      style: textStyle,
//                      textInputAction: TextInputAction.done,
//                      textCapitalization: TextCapitalization.words,
//                      autocorrect: false,
//                      decoration: InputDecoration(
//                        labelText:
//                        "Alamat ${widget.overseasLocation ? '1' : 'Lengkap'}",
//                        labelStyle: labelStyle,
//                        helperText: widget.overseasLocation
//                            ? null
//                            : 'Masukkan nama jalan saja seperti Jl Manggar no 23',
//                        helperMaxLines: 2,
//                        helperStyle: helperStyle,
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide(),
//                        ),
//                        errorStyle: errorStyle,
//                      ),
//                      validators: [
//                        FormBuilderValidators.required(
//                            errorText: requiredTxtMsg),
//                      ],
//                    ),
//                    !widget.overseasLocation
//                        ? SizedBox(height: verticalSpace)
//                        : Container(),
//                    !widget.overseasLocation
//                        ? Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: FormBuilderTextField(
//                            attribute: "rtNumber",
//                            style: textStyle,
//                            textInputAction: TextInputAction.done,
//                            textCapitalization: TextCapitalization.words,
//                            keyboardType: TextInputType.number,
//                            autocorrect: false,
//                            decoration: InputDecoration(
//                              labelText: "RT",
//                              labelStyle: labelStyle,
//                              helperText: 'Masukkan angka',
//                              helperStyle: helperStyle,
//                              border: OutlineInputBorder(
//                                borderSide: BorderSide(),
//                              ),
//                              errorStyle: errorStyle,
//                            ),
//                            validators: [
//                              FormBuilderValidators.required(
//                                  errorText: requiredTxtMsg),
//                              FormBuilderValidators.numeric(
//                                  errorText: requiredNumericMsg)
//                            ],
//                          ),
//                        ),
//                        SizedBox(
//                          width: horizontalSpace,
//                        ),
//                        Expanded(
//                          child: FormBuilderTextField(
//                            attribute: "rwNumber",
//                            style: textStyle,
//                            textInputAction: TextInputAction.done,
//                            textCapitalization: TextCapitalization.words,
//                            keyboardType: TextInputType.number,
//                            autocorrect: false,
//                            decoration: InputDecoration(
//                              labelText: "RW",
//                              labelStyle: labelStyle,
//                              helperText: 'Masukkan angka',
//                              helperStyle: helperStyle,
//                              border: OutlineInputBorder(
//                                borderSide: BorderSide(),
//                              ),
//                              errorStyle: errorStyle,
//                            ),
//                            validators: [
//                              FormBuilderValidators.required(
//                                  errorText: requiredTxtMsg),
//                              FormBuilderValidators.numeric(
//                                  errorText: requiredNumericMsg)
//                            ],
//                          ),
//                        ),
//                      ],
//                    )
//                        : Container(),
//                    widget.overseasLocation
//                        ? Column(
//                      children: <Widget>[
//                        SizedBox(height: verticalSpace),
//                        FormBuilderTextField(
//                          attribute: "address1",
//                          style: textStyle,
//                          textInputAction: TextInputAction.done,
//                          textCapitalization: TextCapitalization.words,
//                          autocorrect: false,
//                          decoration: InputDecoration(
//                            labelText: "Alamat 2 ($fillIfAvailableMsg)",
//                            labelStyle: labelStyle,
//                            helperMaxLines: 2,
//                            helperStyle: helperStyle,
//                            border: OutlineInputBorder(
//                              borderSide: BorderSide(),
//                            ),
//                            errorStyle: errorStyle,
//                          ),
//                        )
//                      ],
//                    )
//                        : Container(),
//                  ],
//                ),
//              );
//            }
//            return Center(
//              child: Container(
//                margin: EdgeInsets.only(top: 30),
//                width: 30,
//                height: 30,
//                child: CircularProgressIndicator(),
//              ),
//            );
//          },
//        ),
//        SizedBox(height: verticalSpace),
//        _isLoading
//            ? Container()
//            : Center(
//          child: LinkButton(
//            text: 'Hapus Data Alamat',
//            onTap: () => _clearForm(),
//            color: Colors.redAccent,
//          ),
//        ),
//        SizedBox(height: verticalSpace * 2),
//      ],
//    );
//  }
//}
//
//// A function that will convert a response body into a List<Post>
//List<Province> parseResponse(String responseBody) {
//  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//  return parsed.map<Province>((json) => Province.fromJson(json)).toList();
//}
