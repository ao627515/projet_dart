import 'package:campusflow_models/campusflow_models.dart';

String formatDate(DateTime date) {
  final y = date.year.toString();
  final m = date.month.toString().padLeft(2, '0');
  final d = date.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

Future<void> main() async {
  final repo = MockTaskRepository(delay: const Duration(milliseconds: 150));

  print('=== CampusFlow ===\n');

  final user = await repo.fetchCurrentUser();
  print('Utilisateur : ${user.nom} <${user.email}> (${user.filiere ?? "Non renseigné"})\n');

  final tasks = await repo.fetchTasks();
  print('Échéances (${tasks.length}) :');
  for (final task in tasks) {
    final status = task.terminee ? '[x]' : '[ ]';
    print('  $status ${task.titre.padRight(16)} (échéance : ${formatDate(task.echeance)})');
  }
  print('');

  final task = tasks.first;
  final updated = task.copyWith(terminee: true);
  print('Action : Marquer "${task.titre}" comme fait (copyWith)');
  print('  Avant : terminee = ${task.terminee}');
  print('  Après : terminee = ${updated.terminee}\n');

  print('Test de résilience réseau (try/catch) :');
  try {
    await repo.fetchTasks(shouldFail: true);
  } catch (e) {
    print('  Exception interceptée avec succès : $e');
  }
}
