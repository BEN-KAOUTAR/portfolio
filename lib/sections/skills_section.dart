import 'package:flutter/material.dart';
import '../widgets/hover_widget.dart';


class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skillCategories = [
    {
      'title': 'Mobile Dev',
      'icon': Icons.phone_android,
      'skills': ['Flutter & Dart', 'Android SDK & Kotlin', 'Cross-Platform Logic', 'State Management'],
    },
    {
      'title': 'Web Dev',
      'icon': Icons.code,
      'skills': ['HTML5 & CSS3', 'Vanilla JavaScript', 'Bootstrap ', 'PHP Integration'],
    },
    {
      'title': 'Backend & Cloud',
      'icon': Icons.cloud_outlined,
      'skills': ['Firebase Services', 'MySQL Databases', 'SQLite Storage', 'REST API Integration'],
    },
    {
      'title': 'Tools & Methods',
      'icon': Icons.build_circle_outlined,
      'skills': ['Git & GitHub', 'Figma UI/UX Designs', 'Canva Layouts', 'Agile Methodologies'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double w = constraints.maxWidth;
      final bool isMobile = w < 850;
      final double hPad = isMobile ? 24 : (w < 1200 ? 60 : 100);
      final int cols = w < 650 ? 1 : (w < 1100 ? 2 : 4);

      return Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
        child: Column(
          children: [
            buildSectionHeader("My Skills"),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                mainAxisExtent: 280, // Sleeker fixed height
              ),
              itemCount: _skillCategories.length,
              itemBuilder: (context, index) {
                final category = _skillCategories[index];
                return HoverWidget(
                  builder: (isHovered) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D0A24).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isHovered
                              ? const Color(0xFF00FFCC)
                              : const Color(0xFF00FFCC).withOpacity(0.15),
                          width: isHovered ? 1.5 : 1,
                        ),
                        boxShadow: isHovered
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF00FFCC).withOpacity(0.2),
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 10),
                                )
                              ]
                            : [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                )
                              ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Icon and Title
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00FFCC).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFF00FFCC).withOpacity(0.3),
                                  ),
                                ),
                                child: Icon(
                                  category['icon'] as IconData,
                                  size: 26,
                                  color: const Color(0xFF00FFCC),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  category['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Divider(color: Colors.white.withOpacity(0.1), thickness: 1),
                          const SizedBox(height: 16),
                          // Skills List
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: (category['skills'] as List<String>)
                                  .map((skill) => Row(
                                        children: [
                                          const Icon(
                                            Icons.check_circle,
                                            color: Color(0xFF00FFCC),
                                            size: 16,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              skill,
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.85),
                                                fontSize: 14,
                                                height: 1.4,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
