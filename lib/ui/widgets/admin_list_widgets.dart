part of 'widgets.dart';

class AdminString {
  static const APP_BAR_TITLE = "Tim Sukses";
  static const SEMI_FONT_NAME = 'MaisonNeue';
  static const BOLD_FONT_NAME = 'MaisonNeue bold';
}

class AdminListWidgets extends StatelessWidget {
//  int _index = 0;

  @override
  Widget build(BuildContext context) {
//    Widget child = Container();
//
//    switch(_index) {
//      case 0:
//        child = AdminListWidgets();
//        break;
//
//      case 1:
//        child = KaderListWidgets();
//        break;
//    }
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(
          AdminString.APP_BAR_TITLE,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF0676DC),
      ),
      body: _adminListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddVoter()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0676DC),
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Color(0xffDBE6EE),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library,) ,
            title: Text('Timses'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            title: Text('Capil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('E-Saksi'),
          ),
        ],
        selectedItemColor: Color(0xFF0676DC),
      ),
////      bottomNavigationBar: BottomNavigationBar(
////        backgroundColor: Color(0xffDBE6EE),
////        items: <BottomNavigationBarItem>[
////          BottomNavigationBarItem(
////            icon: Tab(
////                icon: new Icon(
////              Icons.home,
////              color: Color(0xFF0676DC)
////            )),
////            title: Text('Home',
////                style: TextStyle(
////                    fontFamily: HeaderString.SEMI_FONT,
////                    fontSize: 15,
////                    color: Color(0xFF0676DC))),
////          ),
////          BottomNavigationBarItem(
////            icon: Tab(
////              icon: new Icon(
////                Icons.local_library,
////                color: Color(0xFF0676DC)
////              ),
////            ),
////            title: Text('Timses',
////                style: TextStyle(
////                    fontFamily: HeaderString.SEMI_FONT,
////                    fontSize: 15,
////                    color: Color(0xFF0676DC))),
////          ),
////          BottomNavigationBarItem(
////            icon: Tab(
////              icon: new Icon(
////                Icons.contact_mail,
////                color: Color(0xFF0676DC)
////              ),
////            ),
////            title: Text('Capil',
////                style: TextStyle(
////                    fontFamily: HeaderString.SEMI_FONT,
////                    fontSize: 15,
////                    color: Color(0xFF0676DC))),
////          ),
////          BottomNavigationBarItem(
////            icon: Tab(
////              icon: new Icon(
////                Icons.library_books,
////                color: Color(0xFF0676DC)
////              ),
////            ),
////            title: Text('E-Saksi',
////                style: TextStyle(
////                    fontFamily: HeaderString.SEMI_FONT,
////                    fontSize: 15,
////                    color: Color(0xFF0676DC))),
////          ),
//        ],
////        currentIndex: pageIndex,
//        selectedItemColor: Color(0xFF0676DC),
////        onTap: _onItemTapped,
      );
  }
}

ListView _adminListView(BuildContext context) {
  return ListView.builder(
      itemCount: 20,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text("Full name $index",
              style: TextStyle(
                fontFamily: HeaderString.SEMI_FONT,
                fontSize: 15,
              )),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.location_on, color: Color(0xffF3C4C1)),
              Text("City, Indonesia",
                  style: TextStyle(
                      fontFamily: HeaderString.SEMI_FONT,
                      fontSize: 15,
                      color: Colors.grey))
            ],
          ),
          leading: Image(
            width: 70,
            height: 70,
            image: AssetImage("assets/danilla.png"),
          ),
          trailing: IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminDetailPage(index),
                  ));
            },
          ),
        );
      });
}
