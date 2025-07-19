import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/widgets/image_carousel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  // Method to launch the project URL
  Future<void> _launchURL(String url) async {
    await EasyLauncher.url(url: url);
  }

  @override
  Widget build(BuildContext context) {
    // Obtain screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    // Define a threshold below which the layout changes (e.g., 600 pixels)
    final isSmallScreen = screenWidth < 600;

    // Adjust font and icon sizes based on the screen size
    final titleFontSize = isSmallScreen ? 16.0 : 20.0;
    final descriptionFontSize = isSmallScreen ? 14.0 : 16.0;
    final tagFontSize = isSmallScreen ? 12.0 : 14.0;
    final ratingItemSize = isSmallScreen ? 20.0 : 25.0;

    return GestureDetector(
      onTap: () {
        if (project.url.isNotEmpty) {
          _launchURL(project.url);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No URL available for this project."),
            ),
          );
        }
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCarousel(images: project.images),
              const SizedBox(height: 10),
              // Use a different layout for small screens
              isSmallScreen
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: project.tech.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.tag,
                                size: 16, color: Colors.blue),
                            const SizedBox(width: 5),
                            Text(
                              tag,
                              style: TextStyle(
                                fontSize: tagFontSize,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )
                  : Row(
                children: [
                  Flexible(
                    child: Text(
                      project.name,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: project.tech.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.tag,
                                size: 16, color: Colors.blue),
                            const SizedBox(width: 5),
                            Text(
                              tag,
                              style: TextStyle(
                                fontSize: tagFontSize,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Date: ${project.date}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              // Justify the description text
              Text(
                project.description,
                style: TextStyle(fontSize: descriptionFontSize),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBarIndicator(
                    rating: project.rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: ratingItemSize,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    project.rating.toString(),
                    style: TextStyle(fontSize: descriptionFontSize),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
