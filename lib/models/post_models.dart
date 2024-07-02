import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class Post {
  final String author;
  final String authorProfileImage; // Profil resmi eklendi
  final String text;
  final DateTime date;
  final String? imageUrl;

  Post({
    required this.author,
    required this.authorProfileImage,
    required this.text,
    required this.date,
    this.imageUrl,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      author: map['author'],
      authorProfileImage: map['authorProfileImage'], // Profil resmi
      text: map['text'],
      date: (map['date'] as Timestamp).toDate(),
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'authorProfileImage': authorProfileImage, // Profil resmi
      'text': text,
      'date': date,
      'imageUrl': imageUrl,
    };
  }
}

class PostModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Post> _posts = [];

  List<Post> get posts => List.unmodifiable(_posts);

  Future<void> createPost(
    String author,
    String authorProfileImage, // Profil resmi
    String text,
    File? image,
  ) async {
    try {
      String? imageUrl;
      if (image != null) {
        imageUrl = await _uploadImage(image);
      }

      final post = Post(
        author: author,
        authorProfileImage: authorProfileImage, // Profil resmi
        text: text,
        date: DateTime.now(),
        imageUrl: imageUrl,
      );

      await _firestore.collection('posts').add(post.toMap());

      _posts.insert(0, post);
      notifyListeners();
    } catch (e) {
      print("Gönderi oluşturulurken hata oluştu: $e");
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
      print("Resim yüklenirken hata oluştu: $e");
      return null;
    }
  }

  Future<void> fetchPosts() async {
    try {
      final snapshot = await _firestore
          .collection('posts')
          .orderBy('date', descending: true)
          .get();
      List<Post> newPosts = snapshot.docs
          .map((doc) => Post.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      _posts.clear(); // Listeyi temizle
      _posts.addAll(newPosts);
      notifyListeners();
    } catch (e) {
      print("Gönderiler alınırken hata oluştu: $e");
    }
  }
}
