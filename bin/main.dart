import 'package:campusflow_models/campusflow_models.dart';

void main() async {
  print('=== CampusFlow : Modèles et Dépôt Dart ===\n');

  // 1. Démonstration des modèles et copyWith
  print('--- 1. Modèles et Immuabilité (copyWith) ---');
  final task = Task(
    titre: 'Rendu TP Dart',
    echeance: DateTime.now().add(const Duration(days: 1)),
  );
  print('Tâche initiale : $task');

  final updatedTask = task.copyWith(
    terminee: true,
    description: 'Complété avec succès !',
  );
  print('Tâche mise à jour (copie) : $updatedTask');
  print('Tâche initiale intacte : terminee = ${task.terminee}\n');

  // 2. Démonstration de fromJson
  print('--- 2. Sérialisation / Désérialisation JSON ---');
  final courseJson = {
    'code': 'MOB',
    'titre': 'Programmation Mobile',
    'enseignant': 'Moctar COMPAORE',
  };
  final course = Course.fromJson(courseJson);
  print('Course créé depuis JSON : $course\n');

  // 3. Démonstration du chargement asynchrone via MockTaskRepository
  print('--- 3. Chargement simulé avec Future.delayed ---');
  final repo = MockTaskRepository(delay: const Duration(milliseconds: 500));

  print('Chargement des données en cours...');
  try {
    final tasks = await repo.fetchTasks();
    print('Succès ! ${tasks.length} tâche(s) chargée(s) :');
    for (final t in tasks) {
      print(' - [${t.terminee ? "X" : " "}] ${t.titre} (Échéance : ${t.echeance.toLocal()})');
    }

    final user = await repo.fetchCurrentUser();
    print('\nUtilisateur connecté : ${user.nom} (${user.email}) - ${user.filiere}');
  } catch (e) {
    print('Erreur : $e');
  }

  // 4. Démonstration de la gestion d'erreur attendue
  print('\n--- 4. Test d\'erreur réseau simulée ---');
  try {
    await repo.fetchTasks(shouldFail: true);
  } catch (e) {
    print('Erreur interceptée avec succès : $e');
  } finally {
    print('Fin du chargement.');
  }
}

