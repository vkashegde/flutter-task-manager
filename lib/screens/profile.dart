import 'package:flutter/material.dart';
import 'package:task_management/constants/constants.dart';

import 'package:task_management/screens/widgets/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  final String userID;

  const ProfileScreen({this.userID});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _titleTextStyle = TextStyle(
      fontSize: 22, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold);
  var contentTextStyle = TextStyle(
      color: Constants.darkBlue,
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
  }

  bool _isLoading = false;
  String phoneNumber = "";
  String email = "";
  String name;
  String job = '';
  String imageUrl = "";
  String joinedAt = " ";
  bool _isSameUser = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.all(30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Text(name == null ? 'Name here' : name,
                                    style: _titleTextStyle)),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '$job Since joined $joinedAt',
                                style: contentTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Contact Info',
                              style: _titleTextStyle,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: userInfo(title: 'Email:', content: email),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: userInfo(
                                  title: 'Phone number:', content: phoneNumber),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            _isSameUser
                                ? Container()
                                : Divider(
                                    thickness: 1,
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            _isSameUser
                                ? Container()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      _contactBy(
                                        color: Colors.green,
                                        fct: () {},
                                        icon: Icons.call,
                                      ),
                                      _contactBy(
                                          color: Colors.red,
                                          fct: () {},
                                          icon: Icons.mail_outline),
                                      _contactBy(
                                          color: Colors.purple,
                                          fct: () {},
                                          icon: Icons.call_outlined),
                                    ],
                                  ),
                            SizedBox(
                              height: 25,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            !_isSameUser
                                ? Container()
                                : Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        color: Colors.pink.shade700,
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.logout,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Logout',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.26,
                          height: size.width * 0.26,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 8,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl == null
                                      ? 'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'
                                      : imageUrl),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget _contactBy({Color color, Function fct, IconData icon}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 25,
      child: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              icon,
              color: color,
            ),
            onPressed: () {
              fct();
            },
          )),
    );
  }

  Widget userInfo({String title, String content}) {
    return Row(
      children: [
        Text(
          title,
          style: _titleTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            content,
            style: contentTextStyle,
          ),
        ),
      ],
    );
  }
}
