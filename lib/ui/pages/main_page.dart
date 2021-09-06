part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    DashboardWidgets(),
    KaderListWidgets(),
    AdminListWidgets(),
//    AdminDetailWidgets( ),
    AddVoter(),

  ];

//  String pageName = "";
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//    if (index == 0) {
//      setState(() {
//        pageName = "Admin";
//      });
//    } else if (index == 1) {
//      setState(() {
//        pageName = "Kader";
//      });
//    } else {
//      setState(() {
//        pageName = "Esaksi";
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
//      appBar: AppBar(
//        title: Text(pageName),
//        backgroundColor: Color(0xFF0676DC),
//      ),
      body: Container(
        height: queryData.size.height,
        width: queryData.size.width,
        child: Stack(
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            // Positioned(
            //   child: RaisedButton(
            //     onPressed: () {
            //       AuthServices.signOut().then(
            //           (_) => {context.bloc<PageBloc>().add(GoToLoginPage())});
            //     },
            //     child: Text("Sign Out"),
            //   ),
            // ),
            // Positioned(left: 80.0, child: Text("Faisal")),
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        backgroundColor: Color(0xffDBE6EE),
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.local_library),
//            title: Text('Admin'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.contact_mail),
//            title: Text('Kader'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.brightness_4),
//            title: Text('Esaksi'),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Color(0xFF0676DC),
//        onTap: _onItemTapped,
//      ),
      );
  }
}
