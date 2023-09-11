import 'dart:math';

String generateRandomPassword(int length) {
  final Random random = Random();
  const String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String digits = '0123456789';
  const String specialCharacters = '!@#\$%^&*()_-+=<>?/[]{}|';

  final String allCharacters =
      lowercaseLetters + uppercaseLetters + digits + specialCharacters;

  String password = '';

  for (int i = 0; i < length; i++) {
    final int randomIndex = random.nextInt(allCharacters.length);
    password += allCharacters[randomIndex];
  }

  return password;
}

void main() {
  final int passwordLength = 12; // Change the length as needed
  final String password = generateRandomPassword(passwordLength);
  print('Generated Password: $password');
}
