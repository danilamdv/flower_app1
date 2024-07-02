import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Question {
  final String authorProfileImage;
  final String text;
  final String author;
  final DateTime date;

  Question({
    required this.text,
    required this.author,
    required this.date,
    required this.authorProfileImage,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      authorProfileImage: map['authorProfileImage'].toString(),
      author: map['author'].toString(),
      date: (map['date'] as Timestamp).toDate(),
      text: map['text'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authorProfileImage': authorProfileImage,
      'author': author,
      'date': date,
      'text': text,
    };
  }
}

class QuestionModel with ChangeNotifier {
  List<Question> _questions = [];

  List<Question> get questions => List.unmodifiable(_questions);

  Future<void> fetchPosts() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('questions').get();
      List<Question> newQuestions = snapshot.docs
          .map((doc) => Question.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      _questions.clear(); // Listeyi temizle
      _questions.addAll(newQuestions); // Yeni soruları ekle
      notifyListeners();
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  Future<void> addQuestion(Question question) async {
    try {
      await FirebaseFirestore.instance
          .collection('questions')
          .add(question.toMap());
      _questions.add(question);
      notifyListeners();
    } catch (e) {
      print('Error adding question: $e');
    }
  }

  Future<void> createQuestions(
    String author,
    String text,
    String authorProfileImage,
  ) async {
    final newQuestion = Question(
      author: author,
      date: DateTime.now(),
      text: text,
      authorProfileImage: authorProfileImage,
    );
    await addQuestion(newQuestion);
  }
}
