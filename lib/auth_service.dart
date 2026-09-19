import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isInitialized = false;

  AuthService() {
    _initialize();
  }

  Future<void> _initialize() async {
    if (!_isInitialized) {
      try {
        await _googleSignIn.initialize();
        _isInitialized = true;
      } catch (e) {
        print("Google Sign-In Başlatma Hatası: $e");
      }
    }
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<User?> signInWithGoogle() async {
    if (!_isInitialized) {
      await _initialize();
    }

    try {
      // 1. Kullanıcıyı doğrula (Authenticate)
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );

      // 2. idToken'ı al
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // 3. 7.x sürümünde accessToken için yetkilendirme (Authorization) isteği yap
      final List<String> scopes = ['email', 'profile'];
      final clientAuth = await googleUser.authorizationClient.authorizeScopes(scopes);

      // 4. Firebase kimlik bilgisini oluştur
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: clientAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 5. Firebase ile giriş yap
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Google Giriş Hatası: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (_) {}
    await _auth.signOut();
  }
}