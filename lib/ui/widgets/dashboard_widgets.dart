part of 'widgets.dart';

class StringConst {
  static const RECENT_NEWS = "Berita Terbaru";
  static const ALL_NEWS = "Semua Berita ";
  static const SEMI_FONT_NAME = 'MaisonNeue';
  static const BOLD_FONT_NAME = 'MaisonNeue bold';
}

class HeaderString {
  static const WELCOME_TEXT =
      "Berikut adalah laporan singkat yang terjadi hari ini";
  static const SEMI_FONT = "MaisonAjai";
  static const BOLD_FONT = "MaisonNeue bold";
  static const CONTENT_TITLE = "Informasi Kader";
  static const CONTENT_MENU = "Menu";
  static const MENU_ADMIN = "Timses";
  static const MENU_KADER = "Capil";
  static const MENU_ESAKSI = "e-Saksi";
  static const MENU_LOGOUT = "Logout";
  static const LABEL_CAKADA = "CAKADA";
  static const LABEL_CAWAKADA = "CAWAKADA";
}



class DashboardWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0676DC),
      child: ListView(
        children: <Widget>[
          // HEADER
          Container(
            width: 300,
            height: 180,
            decoration: BoxDecoration(
              color: Color(0xFF0676DC),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 30,
                  margin: EdgeInsets.only(right: 180, top: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/horiz-logo.png"))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 160),
                  child: Text("Selamat datang, User!",
                      style: TextStyle(
                          fontFamily: HeaderString.SEMI_FONT,
                          fontSize: 15,
                          color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 30),
                  child: Text(
                    HeaderString.WELCOME_TEXT,
                    style: TextStyle(
                        fontFamily: HeaderString.BOLD_FONT,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20),
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text(HeaderString.CONTENT_TITLE,
                        style: TextStyle(
                            fontFamily: HeaderString.BOLD_FONT,
                            fontSize: 18,
                            color: Color(0xff4C6D87))),
                  ),
                  Row(

                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 40 ),
                          margin: EdgeInsets.only(top:20),
                          height: 150,
//
                          child: Image(image: AssetImage("assets/najwa.jpg"))),
                      Container(
                        height: 150,
//                          padding: EdgeInsets.only(left: 40),
                          margin: EdgeInsets.only(top:20, left: 40),
                          child: Image(image: AssetImage("assets/najwa.jpg"))
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text(
                            HeaderString.LABEL_CAKADA,
                            style: TextStyle(
                                fontFamily: HeaderString.SEMI_FONT,
                                fontSize: 15,
                                color: Color(0xff4C6D87)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Text(
                            HeaderString.LABEL_CAWAKADA,
                            style: TextStyle(
                                fontFamily: HeaderString.SEMI_FONT,
                                fontSize: 15,
                                color: Color(0xff4C6D87)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260, top: 50),
                    child: Text(HeaderString.CONTENT_MENU,
                        style: TextStyle(
                            fontFamily: HeaderString.BOLD_FONT,
                            fontSize: 18,
                            color: Color(0xff4C6D87))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: <Widget>[
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminListWidgets()));
                          },
                          fillColor: Color(0xffDBE6EE),
                          child: Icon(
                            Icons.local_library,
                            size: 20.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KaderListWidgets()));
                          },
                          fillColor: Color(0xffDBE6EE),
                          child: Icon(
                            Icons.contact_mail,
                            size: 20.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          fillColor: Color(0xffDBE6EE),
                          child: Icon(
                            Icons.library_books,
                            size: 20.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        FlatButton(
                            onPressed: null,
                            child: Image.asset(
                              'assets/logout.png',
                              width: 25,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 23),
                          child: Text(
                            HeaderString.MENU_ADMIN,
                            style: TextStyle(
                                fontFamily: HeaderString.SEMI_FONT,
                                fontSize: 15,
                                color: Color(0xff4C6D87)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Text(
                            HeaderString.MENU_KADER,
                            style: TextStyle(
                                fontFamily: HeaderString.SEMI_FONT,
                                fontSize: 15,
                                color: Color(0xff4C6D87)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 42),
                          child: Text(
                            HeaderString.MENU_ESAKSI,
                            style: TextStyle(
                                fontFamily: HeaderString.SEMI_FONT,
                                fontSize: 15,
                                color: Color(0xff4C6D87)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            HeaderString.MENU_LOGOUT,
                            style: TextStyle(
                                fontFamily: HeaderString.SEMI_FONT,
                                fontSize: 15,
                                color: Color(0xff4C6D87)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
