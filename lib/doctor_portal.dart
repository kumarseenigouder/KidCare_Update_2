import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorPortal extends StatelessWidget {
  DoctorPortal({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder:
            (context, state, child) => DashboardScreen(
              child: child,
              location:
                  state.uri.toString(), // ✅ Pass current route location here
            ),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomeTab()),
          GoRoute(
            path: '/appointments',
            builder: (context, state) => const AppointmentsTab(),
          ),
          GoRoute(
            path: '/patients',
            builder: (context, state) => const PatientsTab(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileTab(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Doctor Portal',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final Widget child;
  final String location; // ✅ Add location parameter

  const DashboardScreen({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(location),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Patients',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/appointments')) return 1;
    if (location.startsWith('/patients')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/appointments');
        break;
      case 2:
        context.go('/patients');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }
}

// Tab Widgets
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Home Tab'));
}

class AppointmentsTab extends StatelessWidget {
  const AppointmentsTab({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Appointments Tab'));
}

class PatientsTab extends StatelessWidget {
  const PatientsTab({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Patients Tab'));
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Profile Tab'));
}
