import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    int selectedValue = 1;
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
            Text(
              'What to do?',
              style: TextStyle(fontSize: 32),
            ),
            TextField(),
            Text(
              'how important it is??',
              style: TextStyle(fontSize: 32),
            ),
            RadioListTile(
              title: Text('To Do'),
              subtitle: Text('Urgent, Important Things.'),
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
              title: Text('To Schedule'),
              subtitle: Text('Not Urgent, Important Things.'),
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
              title: Text('To Delegate'),
              subtitle: Text('Urgent, Not Important Things'),
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile(
              title: Text('To Delete'),
              subtitle: Text('Not Urgent, Not Important Things.'),
              value: 4,
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
                onPressed: () {},
                child: Text(
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
