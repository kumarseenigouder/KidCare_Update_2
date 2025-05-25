import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'ParentPortal_Features/DoctorDetailsScreen.dart';
import 'Appointment.dart';
import 'ParentPortal_Features/ParentFeature.dart';
import 'ParentPortal_Features/parent_profile.dart';
import 'ParentPortal_Features/parent_home.dart';

class ParentPortal extends StatelessWidget {
  ParentPortal({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder:
            (context, state, child) => ParentDashboard(
              child: child,
              location: state.uri.toString(), // ✅ Pass location
            ),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomePage()),
          GoRoute(
            path: '/appointments',
            builder: (context, state) => const ParentAppointmentsTab(),
          ),
          GoRoute(
            path: '/features',
            builder: (context, state) => const ParentFeaturesTab(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ParentProfileTab(),
          ),
          GoRoute(
            path: '/doctor-details',
            builder: (context, state) {
              final name =
                  state.uri.queryParameters['name'] ?? 'Unknown Doctor';
              final specialty =
                  state.uri.queryParameters['specialty'] ?? 'Unknown Specialty';
              final image =
                  state.uri.queryParameters['image'] ?? 'assets/doctor.png';

              return DoctorDetailsScreen(
                name: name,
                specialty: specialty,
                image: image,
              );
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Parent Portal',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class ParentDashboard extends StatelessWidget {
  final Widget child;
  final String location; // ✅ Add location here

  const ParentDashboard({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(location), // ✅ Use location
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
            icon: Icon(Icons.extension_outlined),
            selectedIcon: Icon(Icons.extension),
            label: 'Features',
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
    if (location.startsWith('/features')) return 2;
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
        context.go('/features');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }
}
