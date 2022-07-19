import 'package:flutter/material.dart';
import 'package:receitas/Views/home_page_view.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alerta', textAlign: TextAlign.center,),
          content: const Text('Deseja descartar as alterações?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('NÃO'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => HomePageView())),
              child: const Text('SIM'),
            ),
          ],
        ),
      ),
      icon: Icon(Icons.arrow_back),
    );
  }
}
