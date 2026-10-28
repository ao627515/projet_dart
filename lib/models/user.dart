class User {
  final String nom;
  final String email;
  final String? filiere;

  const User({
    required this.nom,
    required this.email,
    this.filiere,
  });

  /// Crée une copie modifiée de l'utilisateur
  User copyWith({
    String? nom,
    String? email,
    String? filiere,
  }) {
    return User(
      nom: nom ?? this.nom,
      email: email ?? this.email,
      filiere: filiere ?? this.filiere,
    );
  }

  /// Désérialisation depuis un objet JSON (Map)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nom: json['nom'] as String,
      email: json['email'] as String,
      filiere: json['filiere'] as String?,
    );
  }

  /// Sérialisation en objet Map JSON
  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'email': email,
      if (filiere != null) 'filiere': filiere,
    };
  }

  @override
  String toString() {
    return 'User(nom: $nom, email: $email, filiere: $filiere)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.nom == nom &&
        other.email == email &&
        other.filiere == filiere;
  }

  @override
  int get hashCode => nom.hashCode ^ email.hashCode ^ filiere.hashCode;
}

