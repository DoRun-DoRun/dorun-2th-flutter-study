import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final Function(int index, String title) onTap;
  const CreatePage({super.key, required this.onTap});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  int selectedValue = 0;
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What to do?',
              style: TextStyle(fontSize: 32),
            ),
            TextField(
              controller: textFieldController,
            ),
            const Text(
              'how important it is??',
              maxLines: 1,
              style: TextStyle(fontSize: 32),
            ),
            RadioListTile(
              title: const Text('To Do'),
              subtitle: const Text('Urgent, Important Things.'),
              value: 0,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              title: const Text('To Schedule'),
              subtitle: const Text('Not Urgent, Important Things.'),
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              title: const Text('To Delegate'),
              subtitle: const Text('Urgent, Not Important Things'),
              value: 2,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              title: const Text('To Delete'),
              subtitle: const Text('Not Urgent, Not Important Things.'),
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  widget.onTap(selectedValue, textFieldController.text);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Create',
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
