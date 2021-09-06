part of 'widgets.dart';

class KaderString {
  static const APP_BAR_TITLE = "Calon Pemilih";
}

class KaderListWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(
          KaderString.APP_BAR_TITLE,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF0676DC),
      ),
      body:    _buildListView(context),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AddVoter())
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0676DC),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffDBE6EE),
        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
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
    );
  }
}

ListView _buildListView(BuildContext context) {
  return ListView.builder(

    itemCount: 20,
    itemBuilder: (_, index)
  {
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  KaderDetailPage(index),
              ));
        },
      ),
    );
  }
  );
}
//