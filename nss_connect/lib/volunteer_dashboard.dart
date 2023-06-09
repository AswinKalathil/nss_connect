import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {

  static const String id = 'volunteerDashboard';
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildCard('Users', Icons.person, () {
            // Handle users card tap
          }),
          _buildCard('Orders', Icons.shopping_cart, () {
            // Handle orders card tap
          }),
          _buildCard('Products', Icons.shopping_bag, () {
            // Handle products card tap
          }),
          _buildCard('Settings', Icons.settings, () {
            // Handle settings card tap
          }),
        ],
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
