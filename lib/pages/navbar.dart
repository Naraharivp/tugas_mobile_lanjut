import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  void handleNavigation(BuildContext context, int index) {
    onTap(index);

    switch (index) {
      case 0:
        // Menggunakan pushReplacementNamed untuk halaman dashboard
        if (Navigator.canPop(context)) {
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
        break;

      case 1:
        // Menggunakan pushNamed untuk halaman account
        Navigator.pushNamed(context, '/account');
        break;

      case 2:
        // Dialog logout
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Apakah Anda yakin ingin keluar?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup dialog
                    // Menggunakan pushNamedAndRemoveUntil untuk logout
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                  child: const Text('Ya'),
                ),
              ],
            );
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => handleNavigation(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Akun',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
      // Tambahan properti untuk styling (opsional)
      selectedItemColor: Colors.blue, // Warna item yang dipilih
      unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
      showUnselectedLabels: true, // Menampilkan label untuk item yang tidak dipilih
      type: BottomNavigationBarType.fixed, // Tipe navigasi fixed
    );
  }
}