import '../models/course.dart';
import '../models/task.dart';
import '../models/user.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks({bool shouldFail = false});
  Future<List<Course>> fetchCourses({bool shouldFail = false});
  Future<User> fetchCurrentUser({bool shouldFail = false});
}

class MockTaskRepository implements TaskRepository {
  final Duration delay;

  MockTaskRepository({this.delay = const Duration(milliseconds: 300)});

  @override
  Future<List<Task>> fetchTasks({bool shouldFail = false}) async {
    await Future.delayed(delay);

    if (shouldFail) {
      throw Exception('Erreur de chargement des tâches');
    }

    final data = [
      {
        'titre': 'Rendu TP Dart',
        'echeance': '2026-10-29T23:59:00.000Z',
        'description': 'Modèles et tests unitaires',
        'terminee': false,
      },
      {
        'titre': 'Projet Flutter',
        'echeance': '2026-11-06T17:00:00.000Z',
        'description': 'Interface et navigation',
        'terminee': false,
      },
      {
        'titre': 'Examen UX',
        'echeance': '2026-11-09T08:00:00.000Z',
        'description': 'Wireframes et accessibilité',
        'terminee': true,
      },
    ];

    return data.map(Task.fromJson).toList();
  }

  @override
  Future<List<Course>> fetchCourses({bool shouldFail = false}) async {
    await Future.delayed(delay);

    if (shouldFail) {
      throw Exception('Erreur de chargement des cours');
    }

    final data = [
      {
        'code': 'MOB',
        'titre': 'Programmation Mobile',
        'enseignant': 'Moctar COMPAORE',
      },
      {
        'code': 'UXUI',
        'titre': 'Design UX & Wireframes',
        'enseignant': 'Aube Nouvelle',
      },
    ];

    return data.map(Course.fromJson).toList();
  }

  @override
  Future<User> fetchCurrentUser({bool shouldFail = false}) async {
    await Future.delayed(delay);

    if (shouldFail) {
      throw Exception('Erreur de chargement de l\'utilisateur');
    }

    final data = {
      'nom': 'Amina',
      'email': 'amina@campusflow.bf',
      'filiere': 'Master 1 Informatique',
    };

    return User.fromJson(data);
  }
}
