import 'package:flutter/material.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FlashcardScreen(),
    );
  }
}

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int currentIndex = 0;
  bool showAnswer = false;

  final List<Map<String, String>> flashcards = [
    {'question': 'What is Flutter?', 'answer': 'An open-source UI toolkit by Google.'},
    {'question': 'What is Dart?', 'answer': 'A programming language optimized for Flutter.'},
    {'question': 'What is State in Flutter?', 'answer': 'Information that can change in the app.'},
  ];

  void nextFlashcard() {
    setState(() {
      showAnswer = false;
      currentIndex = (currentIndex + 1) % flashcards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final flashcard = flashcards[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                showAnswer ? flashcard['answer']! : flashcard['question']!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showAnswer = !showAnswer;
                  });
                },
                child: Text(showAnswer ? 'Show Question' : 'Show Answer'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: nextFlashcard,
                child: Text('Next Flashcard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
