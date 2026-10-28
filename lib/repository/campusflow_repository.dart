import '../models/course.dart';
import '../models/task.dart';
import '../models/user.dart';

/// Interface du dépôt pour les données de CampusFlow
abstract class TaskRepository {
  Future<List<Task>> fetchTasks({bool shouldFail = false});
  Future<List<Course>> fetchCourses({bool shouldFail = false});
  Future<User> fetchCurrentUser({bool shouldFail = false});
}

/// Dépôt simulé implémentant le chargement asynchrone avec Future.delayed
class MockTaskRepository implements TaskRepository {
  final Duration delay;

  MockTaskRepository({this.delay = const Duration(milliseconds: 300)});

  @override
  Future<List<Task>> fetchTasks({bool shouldFail = false}) async {
    // Simulation du temps d'attente réseau
    await Future.delayed(delay);

    if (shouldFail) {
      throw Exception('Erreur réseau : impossible de charger les tâches.');
    }

    // Données brutes simulées (JSON)
    final mockJsonTasks = [
      {
        'titre': 'Rendu TP Dart',
        'echeance': '2026-10-29T23:59:00.000Z',
        'description': 'Modèles et tests unitaires',
        'terminee': false,
      },
      {
        'titre': 'Projet Flutter',
        'echeance': '2026-11-06T17:00:00.000Z',
        'description': 'Interface et navigation de CampusFlow',
        'terminee': false,
      },
      {
        'titre': 'Examen UX',
        'echeance': '2026-11-09T08:00:00.000Z',
        'description': 'Évaluation sur les wireframes et l’accessibilité',
        'terminee': true,
      },
    ];

    // Conversion JSON -> Modèle avec fromJson
    return mockJsonTasks.map((json) => Task.fromJson(json)).toList();
  }

  @override
  Future<List<Course>> fetchCourses({bool shouldFail = false}) async {
    await Future.delayed(delay);

    if (shouldFail) {
      throw Exception('Erreur réseau : impossible de charger les cours.');
    }

    final mockJsonCourses = [
      {
        'code': 'MOB',
        'titre': 'Programmation Mobile',
        'enseignant': 'Moctar COMPAORE',
      },
      {
        'code': 'UXUI',
        'titre': 'Design UX & Wireframes',
        'enseignant': 'Université Aube Nouvelle',
      },
    ];

    return mockJsonCourses.map((json) => Course.fromJson(json)).toList();
  }

  @override
  Future<User> fetchCurrentUser({bool shouldFail = false}) async {
    await Future.delayed(delay);

    if (shouldFail) {
      throw Exception('Erreur réseau : impossible de charger le profil.');
    }

    final mockJsonUser = {
      'nom': 'Amina',
      'email': 'amina@campusflow.bf',
      'filiere': 'Master 1 Informatique',
    };

    return User.fromJson(mockJsonUser);
  }
}

