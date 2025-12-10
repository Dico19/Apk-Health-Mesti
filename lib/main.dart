import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root aplikasi dengan dukungan Light & Dark mode
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  final Color _seedColor = Colors.teal;

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ),
      fontFamily: 'Roboto',
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.dark,
      ),
      fontFamily: 'Roboto',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Online',
      debugShowCheckedModeBanner: false,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: _themeMode,
      home: MainPage(
        themeMode: _themeMode,
        onThemeModeChanged: (mode) {
          setState(() {
            _themeMode = mode;
          });
        },
      ),
    );
  }
}

/// Halaman dengan BottomNavigation + Navigation Drawer
class MainPage extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const MainPage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // 5 halaman, sesuai dengan 5 menu di bottom bar
  final List<Widget> _pages = const [
    HomePage(),
    DoctorsPage(),
    AppointmentPage(),
    MedicalRecordPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Online'), centerTitle: true),
      drawer: AppDrawer(
        currentIndex: _currentIndex,
        isDarkMode: widget.themeMode == ThemeMode.dark,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          Navigator.pop(context); // tutup drawer
        },
        onToggleDarkMode: (isDark) {
          widget.onThemeModeChanged(isDark ? ThemeMode.dark : ThemeMode.light);
        },
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.medical_information_outlined),
            selectedIcon: Icon(Icons.medical_information),
            label: 'Dokter',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Jadwal',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Rekam',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil', // paling kanan
          ),
        ],
      ),
    );
  }
}

/// =====================
/// NAVIGATION DRAWER
/// =====================
class AppDrawer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool isDarkMode;
  final ValueChanged<bool> onToggleDarkMode;

  const AppDrawer({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Health Online',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Kesehatan dalam genggamanmu',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              selected: currentIndex == 0,
              onTap: () => onDestinationSelected(0),
            ),
            ListTile(
              leading: const Icon(Icons.medical_information),
              title: const Text('Dokter'),
              selected: currentIndex == 1,
              onTap: () => onDestinationSelected(1),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Jadwal Konsultasi'),
              selected: currentIndex == 2,
              onTap: () => onDestinationSelected(2),
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Rekam Medis'),
              selected: currentIndex == 3,
              onTap: () => onDestinationSelected(3),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              selected: currentIndex == 4,
              onTap: () => onDestinationSelected(4),
            ),

            const Spacer(),

            SwitchListTile(
              title: const Text('Dark Mode'),
              secondary: const Icon(Icons.dark_mode_outlined),
              value: isDarkMode,
              onChanged: onToggleDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}

/// =====================
/// HALAMAN BERANDA
/// =====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Selamat datang,', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          const Text(
            'Mesti Indriyani 👋',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Kartu info kesehatan singkat
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.favorite, size: 40, color: colorScheme.primary),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ringkasan Kesehatan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tekanan darah normal, langkah harian tercapai, dan jadwal tidur cukup. Pertahankan ya!',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            'Layanan Cepat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  icon: Icons.chat_bubble_outline,
                  label: 'Chat Dokter',
                  onTap: () {
                    final state = context
                        .findAncestorStateOfType<_MainPageState>();
                    state?.setState(() {
                      state._currentIndex = 1;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionButton(
                  icon: Icons.videocam_outlined,
                  label: 'Video Call',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Fitur video call sedang dalam pengembangan.',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            'Tips Kesehatan Hari Ini',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const HealthTipCard(
            title: 'Minum Air Putih',
            description:
                'Pastikan minum 6–8 gelas air per hari untuk menjaga hidrasi dan fungsi organ tubuh.',
          ),
          const HealthTipCard(
            title: 'Istirahat Cukup',
            description:
                'Tidur 7–8 jam setiap malam dapat membantu menjaga imunitas dan kesehatan mental.',
          ),
        ],
      ),
    );
  }
}

/// Tombol layanan cepat
class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colorScheme.primaryContainer.withOpacity(0.6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: colorScheme.onPrimaryContainer),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Kartu tips kesehatan
class HealthTipCard extends StatelessWidget {
  final String title;
  final String description;

  const HealthTipCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.lightbulb_outline),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}

/// =====================
/// HALAMAN DOKTER
/// =====================
class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      Doctor(
        name: 'dr. Andi Pratama',
        specialty: 'Dokter Umum',
        rating: 4.8,
        experienceYear: 5,
        imagePath: 'assets/dokter1.jpg',
      ),
      Doctor(
        name: 'dr. Siti Rahma, Sp.PD',
        specialty: 'Spesialis Penyakit Dalam',
        rating: 4.9,
        experienceYear: 8,
        imagePath: 'assets/dokter3.jpg',
      ),
      Doctor(
        name: 'dr. Budi Santoso, Sp.A',
        specialty: 'Spesialis Anak',
        rating: 4.7,
        experienceYear: 6,
        imagePath: 'assets/dokter2.jpeg',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCard(
          doctor: doctor,
          onTapBook: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Booking konsultasi dengan ${doctor.name}'),
              ),
            );
          },
        );
      },
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final int experienceYear;
  final String imagePath;

  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.experienceYear,
    required this.imagePath,
  });
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onTapBook;

  const DoctorCard({super.key, required this.doctor, required this.onTapBook});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: colorScheme.primaryContainer,
              backgroundImage: AssetImage(doctor.imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(doctor.specialty, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('${doctor.rating}'),
                      const SizedBox(width: 8),
                      Text('• ${doctor.experienceYear}+ thn'),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: onTapBook, child: const Text('Booking')),
          ],
        ),
      ),
    );
  }
}

/// =====================
/// HALAMAN JADWAL KONSULTASI
/// =====================
class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = [
      Appointment(
        doctorName: 'dr. Andi Pratama',
        date: '10 Des 2025',
        time: '09:00',
        type: 'Chat',
      ),
      Appointment(
        doctorName: 'dr. Siti Rahma, Sp.PD',
        date: '12 Des 2025',
        time: '19:30',
        type: 'Video Call',
      ),
    ];

    if (appointments.isEmpty) {
      return const Center(child: Text('Belum ada jadwal konsultasi.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final item = appointments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(item.doctorName),
            subtitle: Text('${item.date} • ${item.time} • ${item.type}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Detail konsultasi dengan ${item.doctorName} pada ${item.date} ${item.time}',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Appointment {
  final String doctorName;
  final String date;
  final String time;
  final String type;

  Appointment({
    required this.doctorName,
    required this.date,
    required this.time,
    required this.type,
  });
}

/// =====================
/// HALAMAN REKAM MEDIS (TAB 4)
/// =====================
class MedicalRecordPage extends StatelessWidget {
  const MedicalRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final records = [
      MedicalRecord(
        date: '01 Nov 2025',
        doctorName: 'dr. Andi Pratama',
        diagnosis: 'Pemeriksaan umum, hasil normal.',
      ),
      MedicalRecord(
        date: '15 Okt 2025',
        doctorName: 'dr. Siti Rahma, Sp.PD',
        diagnosis: 'Gastritis ringan, diberi obat lambung.',
      ),
      MedicalRecord(
        date: '20 Sep 2025',
        doctorName: 'dr. Budi Santoso, Sp.A',
        diagnosis: 'Kontrol imunisasi rutin.',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final item = records[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(item.date),
            subtitle: Text('${item.doctorName}\n${item.diagnosis}'),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

class MedicalRecord {
  final String date;
  final String doctorName;
  final String diagnosis;

  MedicalRecord({
    required this.date,
    required this.doctorName,
    required this.diagnosis,
  });
}

/// =====================
/// HALAMAN PROFIL (TAB 5)
/// =====================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: colorScheme.primaryContainer,
            backgroundImage: const AssetImage('assets/profile.jpg'),
          ),
          const SizedBox(height: 12),
          const Text(
            'Pasien Sehat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('pasiensehat@example.com'),
          const SizedBox(height: 24),

          ListTile(
            leading: const Icon(Icons.badge_outlined),
            title: const Text('No. Rekam Medis'),
            subtitle: const Text('RM-2025-001'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Pengaturan Akun'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: const Text('Privasi & Keamanan'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Berhasil logout (dummy).')),
              );
            },
          ),
        ],
      ),
    );
  }
}
