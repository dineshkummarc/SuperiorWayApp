import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              color: Colors.blue[900],
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Hifza Khalid",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "SU92-BSSEM-F22-202",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const Text(
                    "Faculty of Computer Science and IT - GCL",
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      profileInfoCard("Under Graduate", "Career"),
                      const SizedBox(height: 20),
                      profileInfoCard("BS Software Engineering", "Program"),
                      const SizedBox(height: 20),
                      profileInfoCard("6th", "Current Semester"),
                    ],
                  ),
                ],
              ),
            ),

            // Tabs Section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.blue[900],
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.blue[900],
                      tabs: const [
                        Tab(text: "ABOUT"),
                        Tab(text: "BIO DATA"),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        children: [
                          aboutSection(),
                          SingleChildScrollView(
                            child: bioDataSection(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileInfoCard(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget aboutSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactInfo(Icons.email, "Email", "su92-bssem-f22-202@superior.edu.pk"),
          contactInfo(Icons.phone, "Phone", "+92-"),
          contactInfo(Icons.person, "Emergency Contact", "-"),
          contactInfo(Icons.home, "Present Address", "PHOOL NAGAR PATTOKI"),
        ],
      ),
    );
  }

  Widget bioDataSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personal Details
          Text(
            "Personal Detail",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 10),
          ...personalDetails(),

          const SizedBox(height: 20),

          // Family Details
          Text(
            "Family Detail",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          const SizedBox(height: 10),
          ...familyDetails(),
        ],
      ),
    );
  }

  List<Widget> personalDetails() {
    return [
      detailRow(Icons.calendar_today, "Date of Birth", "-"),
      detailRow(Icons.female, "Gender", "Female"),
      detailRow(Icons.credit_card, "CNIC", "000000-00000000-0"),
      detailRow(Icons.location_city, "Domicile", "-"),
      detailRow(Icons.flag, "Nationality", "Pakistan"),
      detailRow(Icons.book, "Religion", "-"),
      detailRow(Icons.bloodtype, "Blood Group", "-"),
    ];
  }

  List<Widget> familyDetails() {
    return [
      detailRow(Icons.person, "Father Name", "KHALID NAWAZ"),
      detailRow(Icons.credit_card, "Father CNIC", "-"),
      detailRow(Icons.person, "Guardian Name", "-"),
      detailRow(Icons.credit_card, "Guardian CNIC", "-"),
      detailRow(Icons.family_restroom, "Marital Status", "-"),
    ];
  }

  Widget contactInfo(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[900]),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[900], size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title: $value",
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}