import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class CommunityItem {
  final String id;
  final String author;
  final String authorProfileImage;
  final DateTime date;
  final String text;
  final String userId;

  CommunityItem({
    required this.id,
    required this.author,
    required this.authorProfileImage,
    required this.date,
    required this.text,
    required this.userId,
  });
}

class Post extends CommunityItem {
  final String id;
  final String? imageUrl;
  final String userId; // Kullanıcı kimliği
  int likesCount;

  Post({
    required this.id,
    required String author,
    required String authorProfileImage,
    required String text,
    required DateTime date,
    required this.userId, // Kullanıcı kimliği
    this.imageUrl,
    this.likesCount = 0,
  }) : super(
            id: id,
            author: author,
            authorProfileImage: authorProfileImage,
            date: date,
            text: text,
            userId: userId);

  factory Post.fromMap(String id, Map<String, dynamic> map) {
    return Post(
      id: id,
      author: map['author'],
      authorProfileImage: map['authorProfileImage'],
      text: map['text'],
      date: (map['date'] as Timestamp).toDate(),
      userId: map['userId'], // Kullanıcı kimliği
      imageUrl: map['imageUrl'],
      likesCount: map['likesCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'authorProfileImage': authorProfileImage,
      'text': text,
      'date': date,
      'userId': userId, // Kullanıcı kimliği
      'imageUrl': imageUrl,
      'likesCount': likesCount,
    };
  }

  Post copyWith({
    String? id,
    String? author,
    String? authorProfileImage,
    String? text,
    DateTime? date,
    String? userId, // Kullanıcı kimliği
    String? imageUrl,
    int? likesCount,
  }) {
    return Post(
      id: id ?? this.id,
      author: author ?? this.author,
      authorProfileImage: authorProfileImage ?? this.authorProfileImage,
      text: text ?? this.text,
      date: date ?? this.date,
      userId: userId ?? this.userId, // Kullanıcı kimliği
      imageUrl: imageUrl ?? this.imageUrl,
      likesCount: likesCount ?? this.likesCount,
    );
  }
}

class Question extends CommunityItem {
  final String id;
  final String userId; // Kullanıcı kimliği

  Question({
    required this.id,
    required String author,
    required String authorProfileImage,
    required String text,
    required DateTime date,
    required this.userId, // Kullanıcı kimliği
  }) : super(
            id: id,
            author: author,
            authorProfileImage: authorProfileImage,
            date: date,
            text: text,
            userId: userId);

  factory Question.fromMap(String id, Map<String, dynamic> map) {
    return Question(
      id: id,
      author: map['author'],
      authorProfileImage: map['authorProfileImage'],
      text: map['text'],
      date: (map['date'] as Timestamp).toDate(),
      userId: map['userId'], // Kullanıcı kimliği
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'authorProfileImage': authorProfileImage,
      'text': text,
      'date': date,
      'userId': userId, // Kullanıcı kimliği
    };
  }

  Question copyWith({
    String? id,
    String? author,
    String? authorProfileImage,
    String? text,
    DateTime? date,
    String? userId, // Kullanıcı kimliği
  }) {
    return Question(
      id: id ?? this.id,
      author: author ?? this.author,
      authorProfileImage: authorProfileImage ?? this.authorProfileImage,
      text: text ?? this.text,
      date: date ?? this.date,
      userId: userId ?? this.userId, // Kullanıcı kimliği
    );
  }
}

class CommunityPageModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<CommunityItem> _items = [];

  String userName = '';

  List<CommunityItem> get items => List.unmodifiable(_items);

  Future<void> fetchItems() async {
    try {
      final postSnapshot = await _firestore
          .collection('posts')
          .orderBy('date', descending: true)
          .get();
      final questionSnapshot = await _firestore
          .collection('questions')
          .orderBy('date', descending: true)
          .get();

      List<Post> posts = postSnapshot.docs
          .map(
              (doc) => Post.fromMap(doc.id, doc.data() as Map<String, dynamic>))
          .toList();
      List<Question> questions = questionSnapshot.docs
          .map((doc) =>
              Question.fromMap(doc.id, doc.data() as Map<String, dynamic>))
          .toList();

      _items.clear();
      _items.addAll(posts);
      _items.addAll(questions);
      _items.sort((a, b) => b.date.compareTo(a.date));
      notifyListeners();
    } catch (e) {
      print("Items fetch error: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchComments(
      String itemId, bool isPost) async {
    final collection = isPost ? 'posts' : 'questions';
    final snapshot = await FirebaseFirestore.instance
        .collection(collection)
        .doc(itemId)
        .collection('comments')
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return {
        'commentId': doc.id,
        'text': data['text'],
        'userId': data['userId'],
        'date': data['date'],
      };
    }).toList();
  }

  Future<void> deletePost(String postId) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        print("User not logged in");
        return;
      }

      DocumentSnapshot postSnapshot =
          await _firestore.collection('posts').doc(postId).get();

      Post post = Post.fromMap(
          postSnapshot.id, postSnapshot.data() as Map<String, dynamic>);

      if (post.userId == currentUser.uid) {
        await _firestore.collection('posts').doc(postId).delete();
        _items.removeWhere((item) => item is Post && item.id == postId);
        notifyListeners();
      } else {
        print("User is not the owner of the post");
      }
    } catch (e) {
      print("Post deletion error: $e");
    }
  }

  Future<void> deleteQuestion(String questionId) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        print("User not logged in");
        return;
      }

      DocumentSnapshot questionSnapshot =
          await _firestore.collection('questions').doc(questionId).get();

      Question question = Question.fromMap(
          questionSnapshot.id, questionSnapshot.data() as Map<String, dynamic>);

      if (question.userId == currentUser.uid) {
        await _firestore.collection('questions').doc(questionId).delete();
        _items.removeWhere((item) => item is Question && item.id == questionId);
        notifyListeners();
      } else {
        print("User is not the owner of the question");
      }
    } catch (e) {
      print("Question deletion error: $e");
    }
  }

  Future<void> deleteComment(
      String itemId, String commentId, bool isPost) async {
    final collection = isPost ? 'posts' : 'questions';
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(itemId)
        .collection('comments')
        .doc(commentId)
        .delete();
  }

  Future<void> createPost(
    String author,
    String authorProfileImage,
    String text,
    File? image,
  ) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        print("User not logged in");
        return;
      }

      String? imageUrl;
      if (image != null) {
        imageUrl = await _uploadImage(image);
      }

      final post = Post(
        id: '',
        author: author,
        authorProfileImage: authorProfileImage,
        text: text,
        date: DateTime.now(),
        userId: currentUser.uid,
        imageUrl: imageUrl,
      );

      final docRef = await _firestore.collection('posts').add(post.toMap());
      final newPost = post.copyWith(id: docRef.id);

      _items.insert(0, newPost);
      _items.sort((a, b) => b.date.compareTo(a.date));
      notifyListeners();
    } catch (e) {
      print("Post creation error: $e");
      throw e;
    }
  }

  Future<void> createQuestion(
    String author,
    String text,
    String authorProfileImage,
  ) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        print("User not logged in");
        return;
      }

      final question = Question(
        id: '',
        author: author,
        authorProfileImage: authorProfileImage,
        text: text,
        date: DateTime.now(),
        userId: currentUser.uid,
      );

      final docRef =
          await _firestore.collection('questions').add(question.toMap());
      final newQuestion = question.copyWith(id: docRef.id);

      _items.insert(0, newQuestion);
      _items.sort((a, b) => b.date.compareTo(a.date));
      notifyListeners();
    } catch (e) {
      print("Question creation error: $e");
      throw e;
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef =
          storageRef.child('images/${DateTime.now().toIso8601String()}');
      await imageRef.putFile(image);
      return await imageRef.getDownloadURL();
    } catch (e) {
      print("Image upload error: $e");
      return null;
    }
  }

  Future<void> addComment(String itemId, String text, bool isPost) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        print("User not logged in");
        return;
      }

      final comment = {
        'author': currentUser.displayName,
        'authorProfileImage': currentUser.photoURL,
        'text': text,
        'date': Timestamp.now(),
        'uid': currentUser.uid
      };
      final collection = isPost ? 'posts' : 'questions';

      await _firestore
          .collection(collection)
          .doc(itemId)
          .collection('comments')
          .add(comment);
    } catch (e) {
      print("Comment addition error: $e");
      throw e;
    }
  }
}
