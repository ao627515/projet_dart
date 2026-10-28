import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  group('CampusFlow Models', () {
    test('copyWith', () {
      final task = Task(
        titre: 'Rendu TP Dart',
        echeance: DateTime(2026, 10, 29),
        terminee: false,
      );

      final updated = task.copyWith(
        terminee: true,
        description: 'Fait',
      );

      expect(updated.terminee, isTrue);
      expect(updated.description, equals('Fait'));
      expect(updated.titre, equals(task.titre));
      expect(task.terminee, isFalse);
    });

    test('fromJson', () {
      final taskJson = {
        'titre': 'Projet Flutter',
        'echeance': '2026-11-06T17:00:00.000Z',
        'description': 'Maquette',
        'terminee': false,
      };
      final task = Task.fromJson(taskJson);
      expect(task.titre, equals('Projet Flutter'));
      expect(task.echeance, equals(DateTime.parse('2026-11-06T17:00:00.000Z')));
      expect(task.description, equals('Maquette'));
      expect(task.terminee, isFalse);

      final courseJson = {
        'code': 'MOB',
        'titre': 'Programmation Mobile',
        'enseignant': 'Moctar COMPAORE',
      };
      final course = Course.fromJson(courseJson);
      expect(course.code, equals('MOB'));
      expect(course.titre, equals('Programmation Mobile'));

      final userJson = {
        'nom': 'Amina',
        'email': 'amina@campusflow.bf',
        'filiere': 'Master 1 Informatique',
      };
      final user = User.fromJson(userJson);
      expect(user.nom, equals('Amina'));
      expect(user.email, equals('amina@campusflow.bf'));
    });

    test('erreur attendue', () async {
      final repository = MockTaskRepository(delay: Duration.zero);

      expect(
        () async => await repository.fetchTasks(shouldFail: true),
        throwsA(isA<Exception>()),
      );
    });
  });
}
