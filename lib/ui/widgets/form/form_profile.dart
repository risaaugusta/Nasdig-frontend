part of '../widgets.dart';

class FormProfile extends StatefulWidget {
  final GlobalKey<FormBuilderState> fbKey;
  final VoidCallback clearForm;
  final bool autovalidate;
  final bool selfRegister;

  FormProfile({
    Key key,
    this.fbKey,
    this.clearForm,
    this.autovalidate = false,
    this.selfRegister = false,
  }) : super(key: key);

  @override
  _FormProfileState createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile>
    with AutomaticKeepAliveClientMixin<FormProfile> {
  @override
  bool get wantKeepAlive => true;
  var random = new Random();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadd),
        children: <Widget>[
          SizedBox(height: verticalSpace),
          AlertBox(
            message:
            '${!widget.selfRegister ? 'Harap perhatikan dengan seksama terhadap data '
                'yang Anda masukkan, karena data-data ini bersifat '
                'rahasia dan harus bisa dipertanggungjawabkan kemudian hari. ' : ''}'
                'Semua data harus diisi kecuali disebutkan sebailknya.',
          ),
          FormBuilder(

            autovalidate: widget.autovalidate,
            child: Column(
              children: <Widget>[
                SizedBox(height: verticalSpace),
                FormBuilderTextField(
                  attribute: "name",
                  style: textStyle,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Nama Lengkap",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredTxtMsg),
                  ],
                ),
                SizedBox(height: verticalSpace),
                FormBuilderTextField(
                  attribute: "birthPlace",
                  style: textStyle,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Tempat Lahir",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredTxtMsg),
                  ],
                ),
                SizedBox(height: verticalSpace),
                FormBuilderDateTimePicker(
                  attribute: "birthDateIsoDate",
                  style: textStyle,
                  textInputAction: TextInputAction.done,
                  inputType: InputType.date,
                  format: DateFormat("d MMMM yyyy"),
                  initialDate: DateTime.now().subtract(Duration(days: 5475)),
                  lastDate: DateTime.now().subtract(Duration(days: 5475)),
                  decoration: InputDecoration(
                    labelText: "Tanggal Lahir",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredTxtMsg),
                  ],
                  onChanged: (v) {
                    if (v != null) {
                      String birthDateFmt =
                      DateFormat('dd/MM/yyyy').format(v).toString();
                      print('birthDateFmt $birthDateFmt');
                      widget.fbKey.currentState
                          .setAttributeValue('birthDate', birthDateFmt);
                    }
                  },
                ),
                SizedBox(height: verticalSpace),
                FormBuilderDropdown(
                  attribute: "gender",
                  style: textStyle,
                  hint: Text(hintTextSelect),
                  decoration: InputDecoration(
                    labelText: "Jenis Kelamin",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredSelectMsg),
                  ],
                  items: genders
                      .map(
                        (item) => DropdownMenuItem(
                      value: item.key,
                      child: Text("${item.value}"),
                    ),
                  )
                      .toList(),
                ),
                SizedBox(height: verticalSpace),
                FormBuilderDropdown(
                  attribute: "bloodType",
                  style: textStyle,
                  hint: Text(hintTextSelect),
                  decoration: InputDecoration(
                    labelText: "Golongan Darah",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
//                    validators: [
//                      FormBuilderValidators.required(
//                          errorText: requiredSelectMsg),
//                    ],
                  items: bloodType
                      .map((item) => DropdownMenuItem(
                      value: item.key, child: Text("${item.value}")))
                      .toList(),
                ),
                SizedBox(height: verticalSpace),
                FormBuilderDropdown(
                  attribute: "religion",
                  style: textStyle,
                  hint: Text(hintTextSelect),
                  decoration: InputDecoration(
                    labelText: "Agama",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
//                    onChanged: ,
                  validators: [
                    FormBuilderValidators.required(errorText: requiredSelectMsg),
                  ],
                  items: religions
                      .map((item) => DropdownMenuItem(
                      value: item.key, child: Text("${item.value}")))
                      .toList(),
                ),
                SizedBox(height: verticalSpace),
                FormBuilderDropdown(
                  attribute: "job",
                  style: textStyle,
                  hint: Text(hintTextSelect),
                  decoration: InputDecoration(
                    labelText: "Status Pekerjaan",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredSelectMsg),
                  ],
                  items: jobs
                      .map((item) => DropdownMenuItem(
                      value: item.key, child: Text("${item.value}")))
                      .toList(),
                ),
                SizedBox(height: verticalSpace),
                FormBuilderTextField(
                  attribute: "idCardNumber",
                  style: textStyle,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  inputFormatters: [
                    BlacklistingTextInputFormatter(
                      RegExp("[ \t]"),
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: "Nomor KTP",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredTxtMsg),
                    FormBuilderValidators.numeric(errorText: requiredNumericMsg),
                    FormBuilderValidators.maxLength(16,
                        errorText: requiredMaxLenMsg(16)),
                  ],
                ),
                SizedBox(height: verticalSpace),
                FormBuilderTextField(
                  attribute: "phoneNumber",
                  style: textStyle,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  inputFormatters: [
                    BlacklistingTextInputFormatter(
                      RegExp("[ \t]"),
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: "Nomor telepon",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    errorStyle: errorStyle,
                  ),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredTxtMsg),
                    FormBuilderValidators.numeric(errorText: requiredNumericMsg),
                    FormBuilderValidators.minLength(10,
                        errorText: requiredMinLenMsg(10)),
                  ],
                ),
                SizedBox(height: verticalSpace),
                FormBuilderDropdown(
                  attribute: "education",
                  style: textStyle,
                  hint: Text(hintTextSelect),
                  decoration: InputDecoration(
                    labelText: "Pendidikan Terakhir",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
                  items: degrees
                      .map(
                        (item) => DropdownMenuItem(
                      value: item.key,
                      child: Text("${item.value}"),
                    ),
                  )
                      .toList(),
                  validators: [
                    FormBuilderValidators.required(errorText: requiredSelectMsg),
                  ],
                ),
                SizedBox(height: verticalSpace),
                FormBuilderDropdown(
                  attribute: "sayap",
                  style: textStyle,
                  hint: Text(hintTextSelect),
                  decoration: InputDecoration(
                    labelText: "Sayap (Jika Anda juga anggota sayap)",
                    labelStyle: labelStyle,
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    errorStyle: errorStyle,
                  ),
                  items: orgs
                      .map((item) => DropdownMenuItem(
                      value: item.key, child: Text("${item.value}")))
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: verticalSpace),
          Center(
            child: LinkButton(
              text: 'Hapus Data Profil',
              onTap: widget.clearForm,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: verticalSpace * 2),
        ],
      ),
    );
  }
}
