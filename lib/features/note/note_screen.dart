import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/core/database/database_helper.dart';
import '../../core/supabase/supabase_service.dart';
import '../../shared/my_floating_button.dart';
import '../login/login_screen.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SqlDb sqlDb = SqlDb();
    Future<List<Map>> readData() async {
      List<Map> response = await sqlDb.readData("SELECT * FROM 'notes'");
      return response;
    }

    final SupabaseService supaBaseService = SupabaseService();
    return Scaffold(
      floatingActionButton: MyFloatingButton(),
      appBar: AppBar(
        actions: [
          SignOutButton(supaBaseService: supaBaseService),
        ],
        title: Row(
          children: [
            const Text("Notes"),
            const SizedBox(width: 5),
            SvgPicture.asset(
              "assets/clipboard.svg",
              height: 30,
              width: 30,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: readData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("${snapshot.data![index]['note']}"),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
    required this.supaBaseService,
  });

  final SupabaseService supaBaseService;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.exit_to_app),
      onPressed: () {
        supaBaseService.signOut();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }
}
