//part of 'pages.dart';
//
//class TimsesFormPage extends StatefulWidget {
//  TimsesFormPage() : super();
//
//  final String title = "Registrasi Timses";
//
//  @override
//  _TimsesFormPageState createState() => _TimsesFormPageState();
//}
//
//class _TimsesFormPageState extends State<TimsesFormPage> {
//  int currentStep = 0;
//  List<Step> steps = [
//    Step(
//        title: Text("Profil",
//            style: TextStyle(
//              fontFamily: HeaderString.SEMI_FONT,
//              fontSize: 18,
//            )
//        ),
//        content: Column(
//          children: <Widget>[
//            Card(
//                color: Color(0xffFFA3A3),
//                child: Padding(
//                  padding: EdgeInsets.all(10),
//                  child: Text(
//                      "Harap perhatikan dengan saksama terhadap data yang dimasukkan!",
//                      style: TextStyle(
//                        color: Color(0xffC14B44),
//                        fontFamily: HeaderString.SEMI_FONT,
//                        fontSize: 15,
//                      )),
//                )),
//            SizedBox(
//              height: 25,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Nama Lengkap",
//                hintText: "Nama Lengkap",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Tempat Lahir",
//                hintText: "Tempat Lahir",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Tanggal Lahir",
//                hintText: "Tanggal Lahir",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Jenis Kelamin",
//                hintText: "Jenis Kelamin",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Golongan Darah",
//                hintText: "Golongan Darah",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Agama",
//                hintText: "Agama",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Status Perkawinan",
//                hintText: "Status Perkawinan",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Status Pekerjaan",
//                hintText: "Status Pekerjaan",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Nomor KTP",
//                hintText: "Nomor KTP",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Nomor Telepon",
//                hintText: "Nomor Telepon",
//              ),
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Pendidikan Terakhir",
//                hintText: "Pendidikan Terakhir",
//              ),
//            ),
//          ],
//        ),
//        isActive: true),
//    Step(
//        title: Text("Email",
//            style: TextStyle(
//              fontFamily: HeaderString.SEMI_FONT,
//              fontSize: 18,
//            )),
//        content: Column(
//          children: <Widget>[
//            Card(
//                color: Color(0xffFFA3A3),
//                child: Padding(
//                  padding: EdgeInsets.all(10),
//                  child: Text(
//                      "Jika calon timses tidak memiliki email, masukkan email dengan format namalengkap@namakecamatan.pegassus.id (misalnya) ardalabs@kedopok.pegassus.id dan pastikan centang di bawah ini.",
//                      style: TextStyle(
//                        color: Color(0xffC14B44),
//                        fontFamily: HeaderString.SEMI_FONT,
//                        fontSize: 15,
//                      )),
//                )),
//            SizedBox(
//              height: 25,
//            ),
//            CheckboxListTile(
//              title: Text("Timses tidak memiliki email",
//                  style: TextStyle(
//                    fontFamily: HeaderString.SEMI_FONT,
//                    fontSize: 15,
//                  )),
//              value: true,
//              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            TextFormField(
//              decoration: InputDecoration(
//                border:
//                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                labelText: "Alamat email",
//                hintText: "Alamat email",
//              ),
//            ),
//          ],
//        ),
//        isActive: true),
//    Step(
//        title: Text("Alamat",
//            style: TextStyle(
//              fontFamily: HeaderString.SEMI_FONT,
//              fontSize: 18,
//            )),
//        content: Column(
//          children: <Widget>[
//
//          ],
//        ),
//        isActive: true),
//    Step(
//        title: Text("Dokumen",
//            style: TextStyle(
//              fontFamily: HeaderString.SEMI_FONT,
//              fontSize: 18,
//            )),
//        content: Text("step 4"),
//        state: StepState.complete,
//        isActive: true),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "Registrasi Timses",
//          textAlign: TextAlign.center,
//        ),
//        backgroundColor: Color(0xFF0676DC),
//      ),
//      body: Container(
//        child: Stepper(
//          currentStep: this.currentStep,
//          steps: steps,
//          type: StepperType.vertical,
//          onStepTapped: (step) {
//            setState(() {
//              currentStep = step;
//            });
//          },
//          onStepContinue: () {
//            setState(() {
//              if (currentStep < steps.length - 1) {
//                currentStep = currentStep + 1;
//              } else {
//                currentStep = 0;
//              }
//            });
//          },
//          onStepCancel: () {
//            setState(() {
//              if (currentStep > 0) {
//                currentStep = currentStep - 1;
//              } else {
//                currentStep = 0;
//              }
//            });
//          },
//        ),
//      ),
//    );
//  }
//}
