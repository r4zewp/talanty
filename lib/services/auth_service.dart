import 'package:firebase_auth/firebase_auth.dart';
import 'package:talenty_two/models/user.dart';
import 'database.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user object based on FirebaseUser
  UserObj _userFromFirebaseUser(User user) {
    return user != null ? UserObj(uid: user.uid, email: user.email) : null;
  }

  // auth change user stream
  Stream<UserObj> get streamUser{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign anonymously
  Future signAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user) ;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign email & password
  Future signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User newUser = result.user;
      return _userFromFirebaseUser(newUser);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  // register w/ email & password
  Future registerEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User newUser = result.user;
      await DatabaseService(uid: newUser.uid).updateUserData('New Talent!', 'none', 0);
      return _userFromFirebaseUser(newUser);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}