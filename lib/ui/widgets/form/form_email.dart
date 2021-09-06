part of '../widgets.dart';

class FormEmail extends StatefulWidget {
  final GlobalKey<FormBuilderState> fbKey;
  final VoidCallback clearForm;
  final bool autovalidate;
  final Function(bool) onChangedIsInactiveEmail;
  final bool isInactiveEmail;
  final bool selfRegister;
  final String email;

  FormEmail({
    Key key,
    this.fbKey,
    this.clearForm,
    this.autovalidate = false,
    this.onChangedIsInactiveEmail,
    this.isInactiveEmail = false,
    this.selfRegister = false,
    this.email,
  }) : super(key: key);

  @override
  _FormEmailState createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail>
    with AutomaticKeepAliveClientMixin<FormEmail> {
  bool _obscureText = true;

  @override
  bool get wantKeepAlive => true;

  _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadd),
        children: <Widget>[
          SizedBox(height: verticalSpace),
          Container(
            child: AlertBox(
              message:
              '${!widget.selfRegister ?
              'Jika calon timses tidak memiliki email, masukkan email dengan format namalengkap@namakecamatan.pegassus.com'
                  '(misalnya) ardalabs@kedopok.pegassus.com ' : ''}'
                  'dan pastikan centang di bawah ini.',
            ),
          ),
          FormBuilder(

            autovalidate: widget.autovalidate,
            child: Column(
              children: <Widget>[
                SizedBox(height: verticalSpace / (widget.selfRegister ? 1 : 2)),
                widget.selfRegister
                    ? Container()
                    : FormBuilderCheckbox(
                        attribute: 'isInactiveEmail',
                        label: Text(
                          "Kader tidak memiliki email",
                          style: labelStyle,
                        ),
                        leadingInput: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorStyle: errorStyle,
                        ),
                        onChanged: (v) => widget.onChangedIsInactiveEmail(v),
                      ),
                widget.isInactiveEmail
                    ? Container()
                    : FormBuilderTextField(
                        attribute: "emailAddress",
                        style: textStyle,
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                        readOnly: widget.selfRegister,
                        inputFormatters: [
                          BlacklistingTextInputFormatter(
                            RegExp("[ \t]"),
                          ),
                        ],
                        decoration: InputDecoration(
                          labelText:
                              "${widget.selfRegister ? 'Konfirmasi' : ''} Alamat Email",
                          labelStyle: labelStyle,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          errorStyle: errorStyle,
                        ),
                        validators: [
                          FormBuilderValidators.required(
                              errorText: requiredTxtMsg),
                          FormBuilderValidators.email(
                              errorText: requiredValidEmailMsg),
                        ],
                      ),
                SizedBox(height: verticalSpace),
                widget.selfRegister
                    ? FormBuilderTextField(
                        attribute: "password",
                        style: textStyle,
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                        obscureText: _obscureText,
                        maxLines: 1,
                        inputFormatters: [
                          BlacklistingTextInputFormatter(
                            RegExp("[ \t]"),
                          ),
                        ],
                        decoration: InputDecoration(
                            labelText: "Buat Kata Kunci Baru",
                            labelStyle: labelStyle,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            errorStyle: errorStyle,
                            suffixIcon: GestureDetector(
                              onTap: _toggleObscureText,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Icon(_obscureText
                                    ? Mdi.eyeOutline
                                    : Mdi.eyeOffOutline),
                              ),
                            )),
                        validators: [
                          FormBuilderValidators.required(
                              errorText: requiredTxtMsg),
//                        FormBuilderValidators.pattern("",
//                            errorText: 'Kata kunci tidak boleh ada spasi.'),
                          FormBuilderValidators.minLength(
                            6,
                            errorText: 'Kata kunci minimal 6 karakter.',
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
//        !widget.isInactiveEmail ? Column(
//          children: <Widget>[
//            SizedBox(height: verticalSpace),
//            Center(
//              child: LinkButton(
//                text: 'Hapus Data Email',
//                onTap:  widget.clearForm,
//                color: Colors.redAccent,
//              ),
//            ),
//            SizedBox(height: 40),
//          ],
//        ) : Container(),
        ],
      ),
    );
  }
}
