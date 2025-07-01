import 'package:flutter/material.dart';

class ThreadInput extends StatelessWidget {
  const ThreadInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 16),
        height: MediaQuery.of(context).size.height - 150,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 36),
                ),
                SizedBox(width: 8),
                Text(
                  "New Thread",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(hintText: "What's on your mind?"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print('post');
              },
              child: Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}
