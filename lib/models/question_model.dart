class Question {
  final String category;
  final String question;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.category,
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

final List<Question> sampleQuestions = [
  Question(
    category: 'Widgets',
    question: 'What is a StatefulWidget in Flutter?',
    options: [
      'A widget that cannot change',
      'A widget that can change state over time',
      'A widget used only for animations',
      'A widget that is immutable',
    ],
    correctIndex: 1,
  ),
  Question(
    category: 'Dart',
    question: 'Which keyword makes a variable immutable in Dart?',
    options: ['var', 'final', 'let', 'constly'],
    correctIndex: 1,
  ),
  Question(
    category: 'State',
    question: 'Which method is used to tell Flutter to rebuild a StatefulWidget?',
    options: ['rebuild()', 'setState()', 'update()', 'refresh()'],
    correctIndex: 1,
  ),
  Question(
    category: 'Widgets',
    question: 'Which widget arranges children vertically?',
    options: ['Row', 'Column', 'Stack', 'Wrap'],
    correctIndex: 1,
  ),
  Question(
    category: 'Layouts',
    question: 'Which widget overlays children on top of each other?',
    options: ['Flex', 'Column', 'Stack', 'Expanded'],
    correctIndex: 2,
  ),
  Question(
    category: 'Dart',
    question: 'Dart is the language developed by which company?',
    options: ['Apple', 'Microsoft', 'Google', 'Facebook'],
    correctIndex: 2,
  ),
  Question(
    category: 'Async',
    question: 'Which keyword marks a function that returns a Future?',
    options: ['async', 'await', 'defer', 'future'],
    correctIndex: 0,
  ),
  Question(
    category: 'Packages',
    question: 'Which file lists dependencies for a Flutter app?',
    options: ['README.md', 'pubspec.yaml', 'build.gradle', 'packages.json'],
    correctIndex: 1,
  ),
  Question(
    category: 'Widgets',
    question: 'Which widget provides an app bar at the top of the screen?',
    options: ['Scaffold', 'AppBarWidget', 'TopBar', 'Container'],
    correctIndex: 0,
  ),
  Question(
    category: 'Dart',
    question: 'What type does the literal `true` have in Dart?',
    options: ['Boolean', 'bool', 'Bool', 'binary'],
    correctIndex: 1,
  ),
];
