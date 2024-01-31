import 'package:flutter/material.dart';
import 'package:nic_flutter_assignments/widgets/appbar.dart';

class AddUpdate extends StatefulWidget {
  const AddUpdate({super.key});

  @override
  State<AddUpdate> createState() => _AddUpdateState();
}

class _AddUpdateState extends State<AddUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(title: "Add Data"),
    );
  }
}
