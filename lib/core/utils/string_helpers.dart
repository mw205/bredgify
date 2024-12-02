class StringHelpers {
/*************  ✨ Codeium Command ⭐  *************/
/// Inserts a line break after each word in the input string.
///
/// This function takes a single string and splits it into individual words
/// based on spaces. It then joins these words with a newline character,
/// effectively adding a line break after each word in the string.
///
/// Example:
/******  67d023a3-554b-478a-992e-5d015d02f95c  *******/
  static String addLineBreakAfterEachWord(String input) {
    // Split the string into words by spaces
    List<String> words = input.split(' ');

    // Join the words with a newline character
    return words.join('\n');
  }
}
