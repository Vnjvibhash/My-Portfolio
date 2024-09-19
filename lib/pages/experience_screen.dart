import 'package:flutter/material.dart';
import 'package:portfolio/widgets/education_item.dart';
import 'package:portfolio/widgets/experience_item.dart';
import 'package:portfolio/widgets/vivekajee_details.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDataWithDelay();
  }

  _loadDataWithDelay() async {
    await Future.delayed(const Duration(seconds: 1));
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
                    "Professional Experience",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const ExperienceItem(
                    title: 'Android Developer Intern',
                    company: 'Web Digital Mantra IT Service Pvt Ltd',
                    period: 'June 2022 - August 2022',
                    description:
                        '➢ Developed Android apps in Java, covering full development lifecycle\n'
                        '➢ Collaborated with cross-functional teams to define project requirements.\n'
                        '➢ Implemented Payment gateway such as PayU Money & Razor Pay etc.\n'
                        '➢ Proficient in troubleshooting and debugging. And worked on various projects. \n'
                        '➢ Integrated RESTful APIs. And Conducted code reviews, optimizing for 20% faster loading',
                  ),
                  const ExperienceItem(
                    title: 'Junior Softerware Engineer',
                    company: 'Connectwings Infotech Pvt Ltd',
                    period: 'October 2020 - August 2021',
                    description:
                        '➢ Worked on Native Android apps as well as Website development using Laravel framework.\n'
                        '➢ Used Git for version control for Previous project optimization for the next version of app.\n'
                        '➢ Worked on various Payment gateway such as Paytm, PayU Money & Razor Pay etc.\n'
                        '➢ Implemented google maps and Geo-location and Gmail & Facebook based Login using Firebase Authentication.',
                  ),
                  const Text(
                    'Education',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const EducationItem(
                    degree: 'B.E. in Computer Science & Engineering',
                    institution: 'Chandigarh University, Punjab',
                    period: '2021 - 2024',
                    details:
                        'Specialized in Mobile App & Backend Development.\n'
                        'Completed various projects and internships related to software development.',
                  ),
                  const EducationItem(
                    degree: 'Diploma in Computer Science & Engineering',
                    institution:
                        'Hindustan Electroncs Academy Politechnic, Bangalore',
                    period: '2021 - 2024',
                    details: 'Specialized in Softeware Development\n'
                        'Completed various projects and internships related to software development.',
                  ),
                ],
              ),
            ),
    );
  }
}
