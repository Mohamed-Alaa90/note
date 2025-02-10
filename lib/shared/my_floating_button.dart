import 'package:flutter/material.dart';

class MyFloatingButton extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("New Note"),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.clear();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // تنفيذ حفظ الملاحظة هنا
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
