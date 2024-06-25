Future<void> _saveProfile() async {
  User? user = FirebaseAuth.instance.currentUser;
  String uid = user?.uid ?? '';

  String name = _nameController.text.trim();
  String surname = _surnameController.text.trim();
  String dob = _dobController.text.trim();
  String email = _emailController.text.trim();
  String phone = _phoneController.text.trim();

  // Check if any field is empty
  if (name.isEmpty) {
    _showMessage('Name is required');
    return;
  }

  // Save profile image to Firestore
  String profileImagePath = '';
  if (_profileImage != null) {
    profileImagePath = _profileImage!.path;
  }

  // Check if email needs to be updated
  bool emailChanged = email != user!.email;

  try {
    if (emailChanged && !_isSocialSignIn) {
      // Eğer email değişikliği varsa ve sosyal medya ile giriş yapılmamışsa
      // Email adresini güncelleyebilmek için doğrulama isteği gönder
      await user.verifyBeforeUpdateEmail(email);

      // Doğrulama işlemi tamamlandıktan sonra dinleyici ekleyerek profil ve kullanıcı verilerini güncelle
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null && user.emailVerified && mounted) {
          // Firestore'daki "profiles" koleksiyonunu güncelle
          await FirebaseFirestore.instance.collection('profiles').doc(uid).set({
            'name': name,
            'surname': surname,
            'dob': dob,
            'email': email,
            'phone': phone,
            'countryCode': _countryCode,
            'gender': _gender,
            'profileImage': profileImagePath,
          });

          // Firestore'daki "users" koleksiyonunu güncelle
          await FirebaseFirestore.instance.collection('users').doc(uid).update({
            'email': email,
          });

          // Profil sayfasına yönlendir
          if (mounted) {
            nextScreenReplace(context, ProfilePage());
          }
        }
      });
    } else {
      // Email değişikliği yoksa veya sosyal medya ile giriş yapılmışsa
      // Sadece profil ve kullanıcı verilerini güncelle
      await FirebaseFirestore.instance.collection('profiles').doc(uid).set({
        'name': name,
        'surname': surname,
        'dob': dob,
        'email': email,
        'phone': phone,
        'countryCode': _countryCode,
        'gender': _gender,
        'profileImage': profileImagePath,
      });

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'email': email,
      });

      // Profil sayfasına yönlendir
      if (mounted) {
        nextScreenReplace(context, ProfilePage());
      }
    }
  } catch (e) {
    // Hata durumunda profil sayfasına yönlendir
    nextScreenReplace(context, ProfilePage());
  }
}
