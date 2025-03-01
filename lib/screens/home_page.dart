import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/screens/profile_page.dart';
import 'package:project/screens/profile_page_zubair.dart';
import '../utils/app_colors.dart';
import 'attandance_page.dart';
import 'bus_schedule_page.dart';
import 'fee_payment_page.dart';
import 'feedback_page.dart';
import 'live_location_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> announcements = [
    'New bus schedule update available',
    'Fee payment deadline approaching',
    'Holiday notice for next week',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAnnouncementsCarousel(),
                  SizedBox(height: 24),
                  _buildWeatherWidget(),
                  SizedBox(height: 24),
                  _buildQuickLinksSection(),
                  SizedBox(height: 24),
                  _buildRecentActivities(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'SuperiorWay Transport',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        titlePadding: EdgeInsets.only(left: 16, bottom: 16),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/home_superiorway_logo.png',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Handle notifications
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Handle settings
          },
        ),
      ],
    );
  }

  Widget _buildAnnouncementsCarousel() {
    return Container(
      height: 100,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 100.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: announcements.map((announcement) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      announcement,
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWeatherWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[300]!, Colors.blue[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.wb_sunny, color: Colors.white, size: 40),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '28°C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sunny - Perfect for Travel',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildQuickLink(
              context,
              Icons.directions_bus,
              'Bus Schedule',
              AppColors.primary,
              BusSchedulePage(),
            ),
            _buildQuickLink(
              context,
              Icons.attach_money,
              'Fee Payment',
              AppColors.accent,
              FeePaymentScreen(),
            ),
            _buildQuickLink(
              context,
              Icons.calendar_today,
              'Attendance',
              AppColors.primary,
              AttendancePage(),
            ),
            _buildQuickLink(
              context,
              Icons.person,
              'Profile',
              AppColors.accent,
              null,
              onTap: () => _showProfileSelection(context),
            ),
            _buildQuickLink(
              context,
              Icons.location_on,
              'Live Tracking',
              AppColors.primary,
              LiveLocationPage(),
            ),
            _buildQuickLink(
              context,
              Icons.feedback,
              'Feedback',
              AppColors.accent,
              FeedbackScreen(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickLink(
      BuildContext context,
      IconData icon,
      String title,
      Color color,
      Widget? page, {
        Function()? onTap,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap ?? () {
            if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 32, color: color),
                ),
                SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activities',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: Icon(Icons.history, color: AppColors.primary),
                ),
                title: Text('Bus Route ${index + 1} Completed'),
                subtitle: Text('2 hours ago'),
                trailing: Icon(Icons.chevron_right),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Routes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  void _showProfileSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text('Select Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: Icon(Icons.person, color: AppColors.primary),
                ),
                title: Text('Hifza Khalid'),
                subtitle: Text('Student ID: 12345'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: Icon(Icons.person, color: AppColors.primary),
                ),
                title: Text('Hafiz Muhammad Zubair'),
                subtitle: Text('Student ID: 67890'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePageZubair()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}