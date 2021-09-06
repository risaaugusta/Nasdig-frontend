part of 'pages.dart';

class KaderDetailPage extends StatelessWidget {
  final int index;

  KaderDetailPage(this.index);

  @override
  Widget build(BuildContext context) {

    return new Stack(
      children: <Widget>[
        // The containers in the background
        new ListView(
          children: <Widget>[
            Container(
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg.png"),
                    fit: BoxFit.fitWidth,
                  )),
//              child: Container(
//                child: Image(
//                  width: 30,
//                  height: 70,
//                  image: AssetImage("assets/najwa.jpg"),
//                ),
//              ),
              child: Center(
                child: new Container(
                    width: 150,
                    height: 150,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: new AssetImage(
                                "assets/danilla.png")
                        )
                    )
                ),
              ),

            ),
            new Container(
              height: MediaQuery.of(context).size.height * .800,
              color: Colors.white,

              child: Scaffold(
                body: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 90),
                      child: Text("Nama",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 20),
                      child: Text("Tempat / Tanggal Lahir",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 20),
                      child: Text("Jenis Kelamin",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 20),
                      child: Text("Agama",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 20),
                      child: Text("Status Pekerjaan",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 20),
                      child: Text("Status Perkawinan ",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 20),
                      child: Text("Nomor Telepon",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( left: 20, top: 20),
                      child: Text("Pendidikan Terakhir ",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 15,
                              color: Color(0xff4C6D87))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 3 ),
                      child: Text("Info of capil $index",
                          style: TextStyle(
                              fontFamily: HeaderString.SEMI_FONT,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

        new Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .38,
              right: 20.0,
              left: 20.0),
          child: new Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: new Card(
                color: Colors.white,
                elevation: 4.0,
                child: Container(
//
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("The detail of timses $index",
                            style: TextStyle(
                                fontFamily: HeaderString.SEMI_FONT,
                                fontSize: 18,
                                color: Colors.black )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_on, color: Color(0xffF3C4C1)),
                            Text("City, Indonesia",
                                style: TextStyle(
                                    fontFamily: HeaderString.SEMI_FONT,
                                    fontSize: 15,
                                    color: Colors.grey)),
                          ],
                        ),
                      ]),
                )),
          ),
        )
      ],
    );
  }
}
