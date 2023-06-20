import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar ( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

      final snackbar = SnackBar(      
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Fugiat in quis cillum laborum dolor irure nisi in mollit proident. Elit ex sit pariatur ex ullamco consequat velit consequat culpa minim Lorem qui laboris laborum. Nostrud enim mollit eu veniam excepteur quis. Commodo consectetur ea labore ex fugiat reprehenderit.'),
        actions: [
          TextButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Aceptar')
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Nostrud qui tempor cillum ipsum incididunt excepteur. Commodo anim mollit nostrud ut sint nostrud pariatur aliqua do ut proident eiusmod minim. Magna ex aute ut cupidatat sunt dolore esse culpa nostrud nisi excepteur consectetur. Proident et ea eu et reprehenderit aliqua quis culpa est dolor ad velit minim sint. Consequat anim laborum fugiat eu cillum. Laboris laboris eiusmod exercitation elit do.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar dialogo')
            ),
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