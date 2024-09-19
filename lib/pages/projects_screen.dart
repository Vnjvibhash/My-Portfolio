import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<Project> projects = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  void _loadProjects()  async {
    await Future.delayed(const Duration(seconds: 1));
    final ref = FirebaseDatabase.instance.ref('projects');
    ref.onValue.listen((DatabaseEvent event) {
      final dataSnapshot = event.snapshot;

      if (dataSnapshot.exists) {
        var data = dataSnapshot.value as List<dynamic>;
        setState(() {
          projects = data.map((item) => Project.fromMap(item)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }).onError((error) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 60),
            child: Text(
              'My Projects',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : projects.isEmpty
                ? const Center(
              child: Text('No projects available'),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectCard(
                  project: projects[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
