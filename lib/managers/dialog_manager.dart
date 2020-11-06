import 'package:flutter/material.dart';
import 'package:flutter_app/services/alert_dialog_service.dart';
import 'package:hooks_riverpod/all.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({Key key, this.child}) : super(key: key);
  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {

  AlertDialogService _dialogService = useProvider(alertDialogProvider);

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog() {
    Alert(
        context: context,
        title: "FilledStacks",
        desc: "My tutorials show realworld structures.",
        closeFunction: () => _dialogService.dialogComplete(),
        buttons: [
          DialogButton(
            child: Text('Ok'),
            onPressed: () {
              _dialogService.dialogComplete();
              Navigator.of(context).pop();
            },
          )
        ]).show();
  }
}
