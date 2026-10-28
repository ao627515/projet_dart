class Course {
  final String code;
  final String titre;
  final String? enseignant;

  const Course({
    required this.code,
    required this.titre,
    this.enseignant,
  });

  /// Crée une copie modifiée du cours
  Course copyWith({
    String? code,
    String? titre,
    String? enseignant,
  }) {
    return Course(
      code: code ?? this.code,
      titre: titre ?? this.titre,
      enseignant: enseignant ?? this.enseignant,
    );
  }

  /// Désérialisation depuis un objet JSON (Map)
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      code: json['code'] as String,
      titre: json['titre'] as String,
      enseignant: json['enseignant'] as String?,
    );
  }

  /// Sérialisation en objet Map JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'titre': titre,
      if (enseignant != null) 'enseignant': enseignant,
    };
  }

  @override
  String toString() {
    return 'Course(code: $code, titre: $titre, enseignant: $enseignant)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Course &&
        other.code == code &&
        other.titre == titre &&
        other.enseignant == enseignant;
  }

  @override
  int get hashCode => code.hashCode ^ titre.hashCode ^ enseignant.hashCode;
}

