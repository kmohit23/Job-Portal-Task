extension StringExtensions on String {
  String get capitaliseFirst => _capitaliseFirst(trim());
  String get capitaliseEveryWord => _capitaliseEveryWord(trim());

  String get shortendName => _buildShortName(this);

  String _buildShortName(String name) {
    String shortendName = '';

    if (name.contains(" ")) {
      List<String> spittedName = name.split(" ");
      spittedName.remove(" ");
      shortendName = spittedName[0].split('').first.toUpperCase() +
          spittedName[1].split('').first.toUpperCase();
    } else {
      shortendName = name.split('').first.toUpperCase();
    }
    return shortendName;
  }

  String _capitaliseFirst(String text) {
    String capitalisedText = '';
    List<String> characters = text.split('');
    characters.first = characters.first.toUpperCase();
    capitalisedText = characters.join('');
    return capitalisedText;
  }

  String _capitaliseEveryWord(String text) {
    String capitalisedText = '';
    if (text.contains(' ')) {
      List<String> capitalisedWords = [];
      List<String> words = text.split(" ");
      words.removeWhere((i) => i == '');
      for (String word in words) {
        List<String> characters = word.split('');
        characters.first = characters.first.toUpperCase();
        capitalisedWords.add(characters.join(''));
      }
      capitalisedText = capitalisedWords.join(" ");
    } else {
      capitalisedText = _capitaliseFirst(text);
    }
    return capitalisedText;
  }
}
