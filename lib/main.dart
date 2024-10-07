import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variable to toggle between dark and light mode
  bool isDarkMode = false;

  //function to toggle between dark and light mode
  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      //set dark theme as default
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        onThemeChanged: toggleTheme,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  HomeScreen({required this.onThemeChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //position of the current screen
  int _selectedIndex = 0;

  //list of all the screens of the bottom navigation bar
  static List<Widget> _screens = <Widget>[
    const HomePage(),
    const ProfilePage(),
    const CartPage(),
    const OrdersPage(),
    const SettingsPage(),
  ];

//function to change the position of the current screen
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bottom Navigation Bar'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.amber[400],
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.amber[400],
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.amber[400],
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.amber[400],
              ),
              label: 'Orders'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.amber[400],
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}

//lets create the bottomNavigation bar screens
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen'));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Screen'));
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Cart Screen'));
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Orders Screen'));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //lets create a switch tile to toggle between the light and dark mode
    return Center(
      child: SwitchListTile(
        title: const Text('Dark Mode'),
        //set the theme to dark if the app is in dark mode
        value: Theme.of(context).brightness == Brightness.dark,
        onChanged: (value) {
          final appState = context.findAncestorStateOfType<_MyAppState>();
          appState?.toggleTheme(value);
        },
      ),
    );
  }
}
