import 'package:app/views/widgets/progress-indicator.widget.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  Loader({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return Center(
        child: GenericProgressIndicator(),
      );
    }

    if (object.length == 0) {
      return Center(
        child: Text("Nenhum registro encontrado"),
      );
    }

    return callback();
  }
}
