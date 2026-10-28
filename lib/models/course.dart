class Course {
  final String code;
  final String titre;
  final String? enseignant;

  const Course({
    required this.code,
    required this.titre,
    this.enseignant,
  });

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

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      code: json['code'] as String,
      titre: json['titre'] as String,
      enseignant: json['enseignant'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'titre': titre,
      if (enseignant != null) 'enseignant': enseignant,
    };
  }

  @override
  String toString() => 'Course(code: $code, titre: $titre)';

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
