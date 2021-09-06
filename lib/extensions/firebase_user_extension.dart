part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser(
          {String name= "No Name",
          String selectedLanguage = "English",
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          selectedLanguage: selectedLanguage,
          balance: balance);

  Future<User> fromFirestore() async => await UserServices.getUser(this.uid);
}
