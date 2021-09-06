part of '../widgets.dart';

class FormDocument extends StatefulWidget {
  final GlobalKey<FormBuilderState> fbKey;
  final VoidCallback clearForm;
  final bool autovalidate;

  FormDocument({
    Key key,
    this.fbKey,
    this.clearForm,
    this.autovalidate = false,
  }) : super(key: key);

  @override
  _FormDocumentState createState() => _FormDocumentState();
}

class _FormDocumentState extends State<FormDocument>
    with AutomaticKeepAliveClientMixin<FormDocument> {
//  _onChangedPhotos(String val) {
//    print('val $val');
//  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
//    double sWidth = MediaQuery.of(context).size.width-3*horizontalPadd;

    Row rowText(String text) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Mdi.squareMedium,
              color: Colors.black54,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        );

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadd),
        children: <Widget>[
          SizedBox(
            height: verticalSpace,
          ),
          Text(
            'Untuk mempercepat verifikasi data, mohon pastikan dokumen '
                'yang diunggah harus sesuai ketentuan, sehingga mudah '
                'dibaca sistem:',
            style: labelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          rowText('Foto diri: berwarna, setengah badan, '
              'bukan crop KTP, dan jelas (tidak buram).'),
          SizedBox(
            height: 10,
          ),
          rowText('KTP: Foto tegak dari atas, usahakan ditempat '
              'terang tanpa blitz, posisi mendatar, tidak diperkenankan '
              'fotocopy hitam/putih.'),
          FormBuilder(
            key: widget.fbKey,
            initialValue: {
//            'photosLocalUrl': globals.debugMode ? [] : null,
              // need to initialize so we can set attribute later
              'photos': null,
              'idCardPhotos': null,
              'checkboxToc': globals.debugMode,
              'checkboxConfirmCorrectData': globals.debugMode,
            },
            autovalidate: widget.autovalidate,
            child: Column(
              children: <Widget>[
                SizedBox(height: verticalSpace),
                FormBuilderImagePicker(
                  attribute: 'photosLocalUrl',
                  imageWidth: 130 * 3 / 4, // asumsi rasio h/w 4/3
//                preferredCameraDevice: CameraDevice.front,
                  imageQuality: 10, // 0-100, 100 = original
                  decoration: InputDecoration(
                    labelText: 'Unggah Foto Diri',
                    labelStyle: labelStyle,
                    errorStyle: errorStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  maxImages: 1,
                  iconColor: nasdemBlue,
                  validators: [
                    FormBuilderValidators.required(errorText: requiredUploadMsg),
                    (images) {
                      if (images.length != 1) {
                        return requiredUploadMsg;
                      }
                      return null;
                    }
                  ],
                ),
                SizedBox(height: verticalSpace),
                FormBuilderImagePicker(
                  attribute: 'idCardPhotosLocalUrl',
                  imageWidth: 130 * 8 / 5, // rasio ukuran KTP h/w 5/9
                  imageQuality: 10,
                  decoration: InputDecoration(
                    labelText: 'Unggah Foto KTP',
                    labelStyle: labelStyle,
                    errorStyle: errorStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  maxImages: 1,
                  iconColor: nasdemBlue,
                  validators: [
                    FormBuilderValidators.required(errorText: requiredUploadMsg),
                    (images) {
                      if (images.length != 1) {
                        return requiredUploadMsg;
                      }
                      return null;
                    }
                  ],
                ),
                SizedBox(height: verticalSpace / 2),
                FormBuilderCheckbox(
                  attribute: 'checkboxToc',
                  label: RichText(
                    text: TextSpan(
                      style: textStyle,
                      text: 'Saya menyatakan setuju dan sudah membaca ',
                      children: <TextSpan>[
                        LinkTextSpan(
                          text: 'Syarat dan Ketentuan',
                          style: TextStyle(decoration: TextDecoration.underline),
                          url: globals.epFeTerms,
                          context: context,
                        ),
                        TextSpan(text: ' menjadi Kader/Anggota Partai NasDem'),
                      ],
                    ),
                  ),
                  leadingInput: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.requiredTrue(
                      errorText:
                          "Anda harus menyetujui syarat dan ketentuan di atas",
                    ),
                  ],
                ),
                FormBuilderCheckbox(
                  attribute: 'checkboxConfirmCorrectData',
                  label: Text(
                    "Saya menyatakan bahwa semua informasi yang saya berikan adalah benar",
                    style: textStyle,
                  ),
                  leadingInput: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.requiredTrue(
                      errorText: "Anda harus menyetujui pernyataan di atas",
                    ),
                  ],
                ),
                SizedBox(height: verticalSpace * 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle style, String url, String text, BuildContext context})
      : super(
          style: style,
          text: text ?? url,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
//                MaterialPageRoute(
//                  builder: (context) => MyWebview(url: url),
//                ),
                SlideUpRoute(
                  widget: MyWebview(url: url),
                ),
              );
            },
        );
}
