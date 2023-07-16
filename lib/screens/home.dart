import 'package:flutter/material.dart';
import 'package:instagram_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      "Ashiq Abu",
      "Ameen",
      "Sooraj",
      "Akshay",
      "Munnavir",
      "Bilal",
      "Ameer",
      "Ajmal",
      "Muneeb",
      "Amal",
    ];
    // ignore: unused_local_variable
    List<String> filmicons = [
      "https://wallpapercave.com/wp/wp7610895.jpg",
      "https://m.media-amazon.com/images/M/MV5BZjFkMmZkNmYtMDAyNC00OTc5LTliNDgtNGI0MDI4ODIwOGNmXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg",
      "https://upload.wikimedia.org/wikipedia/en/3/36/Home_%282021_film%29.jpg",
      "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2baee529323171.55edda9493f77.jpg",
      "https://nettv4u.com/imagine/12-04-2017/sakhavu-malayalam-movie-posters-and-stills-5.jpg",
      "https://i.pinimg.com/736x/09/28/12/0928129b912122cf98c28eb561fa1359.jpg",
      "https://www.nairtejas.com/wp-content/uploads/2019/12/Virus-Malayalam-film-poster-by-Popkon-702x1024-501x731.jpg",
      "https://wallpapercave.com/wp/wp7610895.jpg",
      "https://i.pinimg.com/originals/75/22/f5/7522f5d215d3c3ef32b4ee778a2a54df.jpg",
      "https://www.nairtejas.com/wp-content/uploads/2019/12/Virus-Malayalam-film-poster-by-Popkon-702x1024-501x731.jpg",
      "https://wallpapercave.com/wp/wp7610895.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx1) {
                      return AlertDialog(
                        title: const Text('Confirmation'),
                        content: const Text('Do you want to logout'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              signout(context);
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(names[index]),
              subtitle: Text('Message $index'),
              leading: index % 2 == 0
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(filmicons[index]),
                    )
                  : ClipRRect(
                      child: Image.network(
                        filmicons[index],
                        fit: BoxFit.contain,
                      ),
                    ),
              trailing: Text('1$index:00 PM'),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: names.length,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    // ignore: non_constant_identifier_names
    final SharedPrefs = await SharedPreferences.getInstance();
    SharedPrefs.clear();
    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const ScreenLogin()),
        (route) => false);
  }
}
