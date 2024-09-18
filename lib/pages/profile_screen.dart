import 'package:flutter/material.dart';
import 'package:portfolio/widgets/vivekajee_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDataWithDelay();
  }

  _loadDataWithDelay() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading spinner
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: EdgeInsets.all(
                        screenWidth * 0.02), // 4% of screen width
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const VivekaJeeDetails(),
                  ),
                  const Text(
                    "Professional Summary",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: EdgeInsets.all(
                        screenWidth * 0.02), // 4% of screen width
                    width: screenWidth * 0.9, // 90% of screen width
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      "A Computer Science Engineering UG from Chandigarh University with knowledge of programming languages, Mobile app development, software development, and testing. I'm seeking to utilize my previous experience as well as my broad educational background with excellent analytical, technical, and programming skills to thrive as a software engineer.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const Text(
                    "Areas of Expertise / Key Skills:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: EdgeInsets.all(screenWidth * 0.005),
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                      },
                      border: TableBorder.all(
                          color: Colors.black12), // Black border
                      children: [
                        TableRow(
                          children: [
                            _buildCell('Mobile Application Development'),
                            _buildCell('Web Application Development'),
                          ],
                        ),
                        TableRow(
                          children: [
                            _buildCell('API Design & Management'),
                            _buildCell('Backend Development'),
                          ],
                        ),
                        TableRow(
                          children: [
                            _buildCell('Laravel Development (Backend)'),
                            _buildCell('Version Control (Git)'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Technical Skills:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      "➢ Operating Systems: Linux, Windows\n"
                      "➢ Languages: C, Java, JavaScript, Dart, Kotlin, SQL\n"
                      "➢ Technologies: Native Android/ React Native/ Flutter, GIT, VirtualBox, Firebase\n"
                      "➢ Tools: Android Studio, IntelliJ, VS Code, NetBeans, Xampp, Postman",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const Text(
                    "Achievements",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: EdgeInsets.all(
                        screenWidth * 0.02), // 4% of screen width
                    width: screenWidth * 0.9, // 90% of screen width
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      "➢ 1st runner-up among the 3.5k participants in Rajasthan IT Day <HACK/ATHON> organized by Govt. of Rajasthan in university of Rajasthan.\n"
                      "➢ 1st runner-up among 8k participants in GAME OF CODE'22 - 8 Days Coding Bootcamp organized by Chandigarh University.\n"
                      "➢ Academic Excellence Award for exceptional performance and outstanding progress with gold medal.\n"
                      "➢ Top 10 in E-Suraksha Hackathon 23, Organized by Chandigarh University.\n",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const Text(
                    'Certifications',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    padding: EdgeInsets.all(
                        screenWidth * 0.02), // 4% of screen width
                    width: screenWidth * 0.9, // 90% of screen width
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      "➢ EPAM System Certificate on Test Automation from EPAM University Program.\n"
                      "➢ Java 11 beyond Basic from Infosys Springboard\n"
                      "➢ AWS Cloud Technical Essentials from Coursera\n"
                      "➢ Software Testing Certificate from NPTEL",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  Widget _buildCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
