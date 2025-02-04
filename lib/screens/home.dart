import 'package:flutter/material.dart';
import 'package:note/core/database/database_helper.dart';

import '../core/supabase/supabase_service.dart';
import '../widget/custom_button.dart';
import 'login_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final SupabaseService supabaseService = SupabaseService();
    final SqlDb sqlDb = SqlDb();

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Text("Hello"),
            Spacer(),
            CustomButton(
              onPressed: () {
                supabaseService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              name: "signOut",
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                int response = await sqlDb.insertData("sql");
              },
              child: Text("insert Data"),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("read Data"),
            ),
          ],
        ),
      ),
    );
  }
}
