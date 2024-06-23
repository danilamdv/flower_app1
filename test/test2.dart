Future<void> _saveProfile() async {
  String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  String yeniEmail = _emailController.text.trim();

  // Yeni email mevcut email adresinden farklı ise
  if (yeniEmail != FirebaseAuth.instance.currentUser?.email) {
    try {
      // Firebase Authentication'da email güncelleme işlemi
      await FirebaseAuth.instance.currentUser!.updateEmail(yeniEmail);

      // Yeni email adresine onay emaili gönder
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      // E-posta onaylandıktan sonra Firestore'da profiles koleksiyonunu güncelle
      await _waitEmailVerificationAndUpdateFirestore(uid);

      // Başarıyla kaydedildiğinde bilgilendirme göster
      await completed(context);

      // Profil sayfasına yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } catch (e) {
      // Hataları işle (ör. email zaten kullanılıyor, geçersiz format)
      print('Email güncelleme hatası: $e');
      // Hata mesajı gösterebilir veya hatayı gerektiği şekilde işleyebilirsiniz
    }
  } else {
    // Eğer email adresi değişmediyse, Firestore'da mevcut email ile güncelle
    await FirebaseFirestore.instance.collection('profiles').doc(uid).set({
      'name': _nameController.text,
      'surname': _surnameController.text,
      'dob': _dobController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'countryCode': _countryCode,
      'gender': _gender,
      'profileImage': _profileImage?.path ?? '',
    });

    // Başarıyla kaydedildiğinde bilgilendirme göster
    await completed(context);

    // Profil sayfasına yönlendir
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
}

Future<void> _saveProfile() async {
  String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  String yeniEmail = _emailController.text.trim();

  // Yeni email mevcut email adresinden farklı ise
  if (yeniEmail != FirebaseAuth.instance.currentUser?.email) {
    try {
      // Firebase Authentication'da email güncelleme işlemi
      //  await FirebaseAuth.instance.currentUser!.updateEmail(yeniEmail);

      // Yeni email adresine onay emaili gönder
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      // E-posta onaylandıktan sonra Firestore'da profiles koleksiyonunu güncelle
      await _waitEmailVerificationAndUpdateFirestore(uid);

      // Başarıyla kaydedildiğinde bilgilendirme göster
      await completed(context);

      // Profil sayfasına yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } catch (e) {
      // Hataları işle (ör. email zaten kullanılıyor, geçersiz format)
      print('Email güncelleme hatası: $e');
      // Hata mesajı gösterebilir veya hatayı gerektiği şekilde işleyebilirsiniz
    }
  } else {
    // Eğer email adresi değişmediyse, Firestore'da mevcut email ile güncelle
    await FirebaseFirestore.instance.collection('profiles').doc(uid).set({
      'name': _nameController.text,
      'surname': _surnameController.text,
      'dob': _dobController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'countryCode': _countryCode,
      'gender': _gender,
      'profileImage': _profileImage?.path ?? '',
    });

    // Başarıyla kaydedildiğinde bilgilendirme göster
    await completed(context);

    // Profil sayfasına yönlendir
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
}

Future<void> _waitEmailVerificationAndUpdateFirestore(String uid) async {
  bool emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  if (!emailVerified) {
    // E-posta henüz onaylanmadıysa, onaylanana kadar bekleyin
    await FirebaseAuth.instance.currentUser!.reload();
    while (!emailVerified) {
      await Future.delayed(Duration(seconds: 5));
      emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    }
  }

  // E-posta onaylandıktan sonra Firestore'da profiles koleksiyonunu güncelle
  await FirebaseFirestore.instance.collection('profiles').doc(uid).set({
    'name': _nameController.text,
    'surname': _surnameController.text,
    'dob': _dobController.text,
    'email': _emailController.text,
    'phone': _phoneController.text,
    'countryCode': _countryCode,
    'gender': _gender,
    'profileImage': _profileImage?.path ?? '',
  });
}
