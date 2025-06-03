class NumerologyCalculator {
  static int calculateLifePathNumber(String birthDate) {
    List<int> specialNumbers = [11, 22, 33];
    String cleanedDate = birthDate.replaceAll(RegExp(r'[^0-9]'), '');
    int sum = cleanedDate.split('').map(int.parse).reduce((a, b) => a + b);
    while (!specialNumbers.contains(sum) && sum > 9) {
      sum = sum.toString().split('').map(int.parse).reduce((a, b) => a + b);
    }
    return sum;
  }

  static int _calculateNumber(String text, List<String> includedLetters, Map<String, int> letterValues) {
    int sum = text.toUpperCase().split('').where((char) => includedLetters.contains(char)).map((char) => letterValues[char] ?? 0).reduce((a, b) => a + b);
    while (sum > 9 && sum != 11 && sum != 22 && sum != 33) {
      sum = sum.toString().split('').map(int.parse).reduce((a, b) => a + b);
    }
    return sum;
  }

  static int calculateDestinyNumber(String fullName) {
    List<String> allLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZİĞÜŞÖÇ'.split('');
    Map<String, int> letterValues = {
      'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5, 'F': 6, 'G': 7, 'H': 8, 'I': 9,
      'J': 1, 'K': 2, 'L': 3, 'M': 4, 'N': 5, 'O': 6, 'P': 7, 'Q': 8, 'R': 9,
      'S': 1, 'T': 2, 'U': 3, 'V': 4, 'W': 5, 'X': 6, 'Y': 7, 'Z': 8,
      'İ': 9, 'Ğ': 7, 'Ü': 3, 'Ş': 1, 'Ö': 6, 'Ç': 3
    };
    return _calculateNumber(fullName, allLetters, letterValues);
  }

  static int calculateSoulUrgeNumber(String fullName) {
    List<String> vowels = 'AEIOUİÜÖÇ'.split('');
    Map<String, int> letterValues = {
      'A': 1, 'E': 5, 'I': 9, 'O': 6, 'U': 3,
      'İ': 9, 'Ü': 3, 'Ö': 6, 'Ç': 3
    };
    return _calculateNumber(fullName, vowels, letterValues);
  }

  static int calculatePersonalityNumber(String fullName) {
    List<String> consonants = 'BCDFGHJKLMNPQRSTVWXYZĞŞÇ'.split('');
    Map<String, int> letterValues = {
      'B': 2, 'C': 3, 'D': 4, 'F': 6, 'G': 7, 'H': 8, 'J': 1, 'K': 2, 'L': 3,
      'M': 4, 'N': 5, 'P': 7, 'Q': 8, 'R': 9, 'S': 1, 'T': 2, 'V': 4, 'W': 5,
      'X': 6, 'Y': 7, 'Z': 8, 'Ğ': 7, 'Ş': 1, 'Ç': 3
    };
    return _calculateNumber(fullName, consonants, letterValues);
  }

 static String getNumerologyMeaning(int number) {
    Map<int, String> meanings = {
      1: "Yani lider ruhlu, bağımsız ve cesur bir yapıya sahip.",
      2: "Yani duygusal, uyumlu ve diplomatik bir karaktere sahip.",
      3: "Yani yaratıcı, neşeli, eğlenceli ve sosyal bir kişiliğe sahip.",
      4: "Yani disiplinli, güvenilir ve çalışkan bir birey.",
      5: "Yani özgürlüğü seven, maceracı bir ruha sahip bir birey.",
      6: "Yani aileye ve sorumluluklara önem veren bir karaktere sahip.",
      7: "Yani ruhsal derinliği olan, bilge ve analitik bir yapıya sahip.",
      8: "Yani başarı ve maddiyat odaklı bir kişiliğe sahip.",
      9: "Yani yardımsever, şefkatli ve hümanist bir birey.",
      11: "Yani ruhsal bir lider ve ilham verici bir kişiliğe sahip.",
      22: "Yani büyük hayaller kuran ve pratik bir vizyoner.",
      33: "Yani evrensel sevgi ve hizmetle dolu bir kişilik.",
    };
    return meanings[number] ?? "Kendine özgü ve nadir bir karaktere sahip.";
  }
}
