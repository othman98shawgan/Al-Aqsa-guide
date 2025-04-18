// main.dart
import 'package:alaqsa_visitor_guide/screens/chatbot_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:alaqsa_visitor_guide/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'screens/tours_screen.dart';
import 'screens/highlights_screen.dart';
import 'screens/info_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  // Set preferred orientations for better mobile experience
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Set system UI overlay style for status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(AlAqsaApp());
}

class AlAqsaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Aqsa Mosque Visitor Guide',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primaryColor: const Color(0xFF2C7D56),
        scaffoldBackgroundColor: const Color(0xFFF8F4E3),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF2C7D56),
          secondary: Color(0xFFD4AF37),
          background: Color(0xFFF8F4E3),
        ),
        fontFamily: 'Segoe UI',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF2C7D56),
            fontWeight: FontWeight.bold,
            fontSize: 28, // Explicit size for consistency
          ),
          headlineMedium: TextStyle(
            color: Color(0xFF2C7D56),
            fontWeight: FontWeight.bold,
            fontSize: 24, // Explicit size for consistency
          ),
          titleLarge: TextStyle(
            color: Color(0xFF2C7D56),
            fontWeight: FontWeight.bold,
            fontSize: 20, // Explicit size for consistency
          ),
          bodyLarge: TextStyle(color: Color(0xFF333333), fontSize: 16),
          bodyMedium: TextStyle(color: Color(0xFF333333), fontSize: 14),
        ),
        // Add elevated button theme for consistent button styling
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2C7D56),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ToursScreen(),
    MapScreen(),
    InfoScreen(),
    // SettingsScreen(),
    ChatBotScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Added SafeArea for proper handling of notches and cutouts
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Al-Aqsa Mosque Guide',
            style: TextStyle(
              fontSize: 18, // Smaller text for better fit on small devices
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 2, // Add shadow for depth
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true, // Center the title for better aesthetics
          actions: [
            // Add a help button in the app bar
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                // Show help dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help'),
                      content: const SingleChildScrollView(
                        child: Text(
                            'Welcome to the Al-Aqsa Mosque Visitor Guide. Navigate through the app using the bottom navigation bar.'),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Colors.white.withOpacity(0.7), // Better contrast
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: _selectedIndex,
            selectedFontSize: 12, // Smaller font for better layout on small screens
            unselectedFontSize: 12,
            iconSize: 24, // Consistent icon size
            elevation: 8, // Add elevation for depth
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Tours',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'Info',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'ChatBot',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
