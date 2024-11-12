import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo!'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('¿Estás seguro?'),
              content: const Text(
                  'Irure dolor sit dolore proident reprehenderit culpa excepteur et proident. Voluptate ad enim amet reprehenderit ex in nisi commodo. In velit pariatur fugiat esse nostrud mollit. Minim est quis enim aute fugiat aliqua non ipsum aute cillum fugiat culpa nulla dolore. Dolore ut tempor ex consectetur adipisicing. Adipisicing quis labore ad ex fugiat do ex voluptate deserunt aliqua magna.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Ut id enim eiusmod et proident amet reprehenderit exercitation labore cillum consectetur. Deserunt consequat do labore duis fugiat culpa. Eiusmod eu amet labore commodo do ut excepteur qui anim adipisicing enim sit. Ex labore exercitation sit exercitation velit adipisicing anim labore incididunt adipisicing. Fugiat incididunt nisi mollit adipisicing eiusmod occaecat veniam velit aute Lorem irure. Mollit officia in reprehenderit dolore aliqua sit dolore magna minim sunt.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar diálogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
