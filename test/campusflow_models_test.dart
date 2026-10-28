import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  group('CampusFlow - Atelier Dart pur', () {
    // Test 1 : copyWith
    test('1. copyWith : crée une nouvelle instance modifiée sans altérer l\'originale', () {
      final task = Task(
        titre: 'Rendu TP Dart',
        echeance: DateTime(2026, 10, 29),
        terminee: false,
      );

      final updated = task.copyWith(
        terminee: true,
        description: 'Terminé avant l\'échéance',
      );

      // Vérifications
      expect(updated.terminee, isTrue);
      expect(updated.description, equals('Terminé avant l\'échéance'));
      expect(updated.titre, equals('Rendu TP Dart'));
      expect(task.terminee, isFalse); // L'instance d'origine reste immuable
      expect(task.description, isNull);
    });

    // Test 2 : fromJson
    test('2. fromJson : instancie fidèlement les modèles à partir de données Map/JSON', () {
      // Test sur Task
      final taskJson = {
        'titre': 'Projet Flutter',
        'echeance': '2026-11-06T17:00:00.000Z',
        'description': 'Conception interface mobile',
        'terminee': false,
      };
      final task = Task.fromJson(taskJson);
      expect(task.titre, equals('Projet Flutter'));
      expect(task.echeance, equals(DateTime.parse('2026-11-06T17:00:00.000Z')));
      expect(task.description, equals('Conception interface mobile'));
      expect(task.terminee, isFalse);

      // Test sur Course
      final courseJson = {
        'code': 'MOB',
        'titre': 'Programmation Mobile',
        'enseignant': 'Moctar COMPAORE',
      };
      final course = Course.fromJson(courseJson);
      expect(course.code, equals('MOB'));
      expect(course.titre, equals('Programmation Mobile'));
      expect(course.enseignant, equals('Moctar COMPAORE'));

      // Test sur User
      final userJson = {
        'nom': 'Amina',
        'email': 'amina@campusflow.bf',
        'filiere': 'Master 1 Informatique',
      };
      final user = User.fromJson(userJson);
      expect(user.nom, equals('Amina'));
      expect(user.email, equals('amina@campusflow.bf'));
      expect(user.filiere, equals('Master 1 Informatique'));
    });

    // Test 3 : erreur attendue
    test('3. erreur attendue : le dépôt simulé lève une exception en cas d\'erreur réseau', () async {
      final repository = MockTaskRepository(delay: Duration.zero);

      // Vérifie qu'une exception est bien levée lors de l'appel asynchrone
      expect(
        () async => await repository.fetchTasks(shouldFail: true),
        throwsA(isA<Exception>()),
      );
    });
  });
}

