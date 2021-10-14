import 'package:flutter/material.dart';

import 'action_button.dart';
import 'profile_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileThemeOptions currentTheme = ProfileThemeOptions.light;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: currentTheme == ProfileThemeOptions.light
          ? ProfileTheme.profileThemeLight()
          : ProfileTheme.profileThemeDark(),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  if (currentTheme == ProfileThemeOptions.light) {
                    currentTheme = ProfileThemeOptions.dark;
                  } else {
                    currentTheme = ProfileThemeOptions.light;
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      child: Image.network(
                        'https://github.com/ptyagicodecamp/educative_flutter/raw/profile_1/assets/profile.jpg?raw=true',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Ella',
                            style: const TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionButton(
                            icon: Icons.call,
                            title: 'Call',
                            onPressed: () {},
                          ),
                          ActionButton(
                            icon: Icons.message,
                            title: 'text',
                            onPressed: () {},
                          ),
                          ActionButton(
                            icon: Icons.video_call,
                            title: 'Video',
                            onPressed: () {},
                          ),
                          ActionButton(
                            icon: Icons.directions,
                            title: 'Directions',
                            onPressed: () {},
                          ),
                          ActionButton(
                            icon: Icons.attach_money,
                            title: 'Pay',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text('670 000 000'),
                      subtitle: Text('mobile'),
                      trailing: IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text('630 000 000'),
                      subtitle: Text('mobile'),
                      trailing: IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {},
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("priyanka@priyanka.com"),
                      subtitle: Text("work"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
