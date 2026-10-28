# CampusFlow - Modèles Dart Pur

Projet d'atelier : **Les modèles de CampusFlow en Dart pur**  
Cours : **Programmation Mobile (Master - Moctar COMPAORE, Université Aube Nouvelle)**

---

## 1. Structure du projet

```text
projet_dart/
├── bin/
│   └── main.dart                     # Démonstration exécutable en console
├── lib/
│   ├── models/
│   │   ├── course.dart               # Modèle Course (code, titre, enseignant)
│   │   ├── task.dart                 # Modèle Task (titre, echeance, description, terminee)
│   │   └── user.dart                 # Modèle User (nom, email, filiere)
│   ├── repository/
│   │   └── campusflow_repository.dart# Dépôt simulé avec Future.delayed
│   └── campusflow_models.dart        # Fichier d'export de la bibliothèque
├── test/
│   └── campusflow_models_test.dart   # Tests unitaires (copyWith, fromJson, erreur attendue)
├── .gitignore                        # Fichiers ignorés par Git
├── pubspec.yaml                      # Métadonnées et dépendances du package
└── README.md                         # Documentation
```

---

## 2. Fonctionnalités implémentées

1. **Trois modèles de données immuables** :
   - `Task` : `titre`, `echeance`, `description`, `terminee` avec constructeur nommé, `copyWith` et immuabilité (`final`).
   - `Course` : `code`, `titre`, `enseignant`.
   - `User` : `nom`, `email`, `filiere`.

2. **Désérialisation JSON et Asynchronisme** :
   - Constructeurs d'usine `fromJson` pour chaque modèle.
   - Méthodes `toJson` pour chaque modèle.
   - `MockTaskRepository` : simulation de requêtes asynchrones avec `Future.delayed` et gestion des cas d'erreur réseau.

3. **Tests unitaires validés avec `dart test`** :
   - Test 1 : `copyWith` (copie modifiée sans altérer l'instance source).
   - Test 2 : `fromJson` (désérialisation correcte des objets JSON).
   - Test 3 : `erreur attendue` (vérification que les exceptions sont levées comme prévu).

---

## 3. Commandes utiles

- **Installer les dépendances** :
  ```bash
  dart pub get
  ```

- **Lancer les tests unitaires** :
  ```bash
  dart test
  ```

- **Lancer la démonstration** :
  ```bash
  dart run bin/main.dart
  ```
