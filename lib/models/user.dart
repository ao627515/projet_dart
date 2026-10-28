class User {
  final String nom;
  final String email;
  final String? filiere;

  const User({
    required this.nom,
    required this.email,
    this.filiere,
  });

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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nom: json['nom'] as String,
      email: json['email'] as String,
      filiere: json['filiere'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'email': email,
      if (filiere != null) 'filiere': filiere,
    };
  }

  @override
  String toString() => 'User(nom: $nom, email: $email)';

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
