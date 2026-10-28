class Task {
  final String titre;
  final DateTime echeance;
  final String? description;
  final bool terminee;

  const Task({
    required this.titre,
    required this.echeance,
    this.description,
    this.terminee = false,
  });

  Task copyWith({
    String? titre,
    DateTime? echeance,
    String? description,
    bool? terminee,
  }) {
    return Task(
      titre: titre ?? this.titre,
      echeance: echeance ?? this.echeance,
      description: description ?? this.description,
      terminee: terminee ?? this.terminee,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      titre: json['titre'] as String,
      echeance: DateTime.parse(json['echeance'] as String),
      description: json['description'] as String?,
      terminee: json['terminee'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titre': titre,
      'echeance': echeance.toIso8601String(),
      if (description != null) 'description': description,
      'terminee': terminee,
    };
  }

  @override
  String toString() =>
      'Task(titre: $titre, echeance: $echeance, terminee: $terminee)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task &&
        other.titre == titre &&
        other.echeance == echeance &&
        other.description == description &&
        other.terminee == terminee;
  }

  @override
  int get hashCode =>
      titre.hashCode ^
      echeance.hashCode ^
      description.hashCode ^
      terminee.hashCode;
}
