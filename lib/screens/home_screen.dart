import 'package:colab_room/resources/auth_methods.dart';
import 'package:colab_room/utils/colors.dart';
import 'package:colab_room/widgets/custom_buttom.dart'; // Check if this file is named 'button.dart' or 'buttom.dart'
import 'package:colab_room/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),
      
      // LOGIC: If page is 3 (Settings), show Logout Button. Else show Dashboard.
      body: _page == 3 
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // Added padding for better look
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Settings", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Log Out',
                    onPressed: () async {
                      // 1. Call Sign Out
                      await AuthMethods().signOut();
                      
                      // 2. The StreamBuilder in main.dart will automatically handle the navigation 
                      // back to the Login Screen once the user is null.
                    },
                  ),
                ],
              ),
            ),
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'New Meeting',
                    icon: Icons.videocam,
                  ),
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'Join Meeting',
                    icon: Icons.add_box_rounded,
                  ),
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'Schedule',
                    icon: Icons.calendar_today,
                  ),
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'Share Screen',
                    icon: Icons.arrow_upward_rounded,
                  ),
                ],
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Create/Join Meetings with just a click',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        
        // --- FIX IS HERE ---
        // With 4 items, you MUST set this to 'fixed' or the navbar will behave strangely.
        type: BottomNavigationBarType.fixed, 
        // -------------------
        
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}