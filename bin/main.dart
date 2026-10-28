import 'package:campusflow_models/campusflow_models.dart';

Future<void> main() async {
  final task = Task(
    titre: 'Rendu TP Dart',
    echeance: DateTime.now().add(const Duration(days: 1)),
  );
  final updated = task.copyWith(terminee: true);
  print(updated);

  final repo = MockTaskRepository(delay: const Duration(milliseconds: 200));

  try {
    final tasks = await repo.fetchTasks();
    print('Tâches chargées : ${tasks.length}');

    final user = await repo.fetchCurrentUser();
    print('Utilisateur : ${user.nom} (${user.email})');

    await repo.fetchTasks(shouldFail: true);
  } catch (e) {
    print('Erreur réseau capturée : $e');
  }
}
