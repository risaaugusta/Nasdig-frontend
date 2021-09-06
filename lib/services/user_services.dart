part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(User user) async{

      _userCollection.document(user.id).setData({
        'email': user.email,
        'name': user.name,
        'balance': user.balance,
        'selectedLanguage': user.selectedLanguage,
        'profilePicture': user.profilePicture ?? ""
      });
  }

  static Future<User> getUser(String id) async{
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    print( snapshot.data['email']  );
    return User(id, snapshot.data['email'],
        balance: snapshot.data['balance'],
        profilePicture: snapshot.data['profilePicture'],
        selectedLanguage: snapshot.data['selectedLanguage'],
        name: snapshot.data['name']);
  }
}
