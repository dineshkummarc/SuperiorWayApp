// class AuthService {
//   static bool signIn(String email, String password) {
//     return email == "hifzaofpk@gmail.com" && password == "password123";
//   }
// }

class AuthService {
  // Mock authentication logic
  static bool signIn(String email, String password) {
    // Replace this with real authentication logic (e.g., API call)
    return email == "zubair142@gmail.com" && password == "123456";
  }

  // Mock sign-up logic
  static bool signUp(String email, String password) {
    // Replace this with real sign-up logic (e.g., API call)
    return true; // Simulate successful sign-up
  }
}