import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger _logger = Logger();

  // Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      _logger.e("Sign in failed", error: e);
      return null;
    }
  }

  // Register with email and password
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      _logger.e("Registration failed", error: e);
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _logger.e("Sign out failed", error: e);
    }
  }

  // Auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  User? get currentUser {
    return _auth.currentUser;
  }
}

/*// Example usage
void main() async {
  AuthService authService = AuthService();
  final Logger logger = Logger();

  // Sign in
  User? user = await authService.signInWithEmailPassword('example@example.com', 'password123');
  if (user != null) {
    logger.i('Signed in: ${user.email}');
  }

  // Register
  User? newUser = await authService.registerWithEmailPassword('newuser@example.com', 'password123');
  if (newUser != null) {
    logger.i('Registered: ${newUser.email}');
  }

  // Sign out
  await authService.signOut();
  logger.i('Signed out');
}*/


