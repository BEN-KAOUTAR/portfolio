import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/hover_widget.dart';
import '../widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  // ── Project Data ─────────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> _projects = [
    {
      'title': 'CalculateIce',
      'emoji': '🧊',
      'logo': '',
      'images': <String>[],
      'desc':
          'An intelligent ice calculation app that helps businesses and users determine the exact quantity of ice needed based on various parameters. Streamlines ordering and reduces waste.',
      'longDesc':
          'An intelligent ice calculation app designed to help businesses, event planners, and individual users determine the precise amount of ice required. It calculates quantities based on event duration, ambient temperature, guest count, and specific beverage types to streamline ordering and reduce waste.',
      'features': [
        'Intelligent consumption models based on temperature.',
        'Custom parameters for event duration and guest counts.',
        'Calculations tailored for different beverage types.',
        'Clean, user-friendly interface to quickly output estimates.'
      ],
      'tag': 'Flutter',
      'color': 0xFF00D2FF,
      'tech': ['Flutter', 'Dart', 'Material 3'],
      'apk': '',
      'github': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'coming_soon',
    },
    {
      'title': 'CourtKeeper (Tennis)',
      'emoji': '🎾',
      'logo': 'assets/courtkeeper_logo.png',
      'images': [
        'assets/courtkeeper_1.png',
        'assets/courtkeeper_2.png',
        'assets/courtkeeper_3.png',
      ],
      'desc':
          'An intelligent Android app dedicated to automatic tennis score management, strictly respecting official rules: Points, Games, Sets, Deuce, Advantage, and Tie-break. Saves full match history.',
      'longDesc':
          'CourtKeeper is a modern, native Android application designed to track and manage tennis matches in real-time. It automates all score tracking, handles complex Deuce/Advantage states, and manages sets and tie-breaks. It also supports local match history preservation using Gson serialization and SharedPreferences.',
      'features': [
        'Calcul automatique des scores selon les règles officielles du Tennis (0, 15, 30, 40).',
        'Gestion complète du Deuce (Égalité) et de l\'Avantage (AV).',
        'Gestion automatique des Games (victoire à 6 avec 2 de différence, ou tie-break à 7-6/7-5).',
        'Gestion automatique des Sets (match gagné au meilleur des 3 sets).',
        'Personnalisation dynamique et sécurisée des noms des joueurs via des boîtes de dialogue stylisées.',
        'Persistance automatique du match en cours pour reprendre après interruption.',
        'Historique complet des matchs joués avec détails de date, scores et vainqueur (RecyclerView).',
        'Effets visuels et animations fluides (effet pulse sur changement de score, transition d\'éléments).',
        'Thème sombre et futuriste optimisé pour une lisibilité parfaite sur le terrain.'
      ],
      'tag': 'Kotlin',
      'color': 0xFF4CAF50,
      'tech': ['Kotlin', 'Android SDK', 'SharedPreferences', 'RecyclerView', 'Gson'],
      'apk': 'courtkeeper.apk',
      'github': 'https://github.com/BEN-KAOUTAR/courtkeeper',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'Touristique Agadir',
      'emoji': '🏖️',
      'logo': '',
      'images': <String>[],
      'desc':
          'A tourism app for visitors to Agadir, Morocco. Features interactive maps, local attraction guides, ratings, category filtering, and offline-ready content for an immersive travel experience.',
      'longDesc':
          'A tourist exploration application tailored for Agadir, Morocco. It offers maps, local attraction guides, rating metrics, filtering options, and offline functionalities to ensure an optimal travel companion experience.',
      'features': [
        'Interactive Google Maps navigation.',
        'Offline-capable tourist destination profiles.',
        'Category-based sorting and filtering (Beaches, Restaurants, Historical Sites).',
        'User review and rating aggregation.'
      ],
      'tag': 'Kotlin',
      'color': 0xFFFF9800,
      'tech': ['Kotlin', 'Google Maps', 'Firebase', 'Material 3'],
      'apk': '',
      'github': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'Academic Platform',
      'emoji': '🎓',
      'logo': '',
      'images': <String>[],
      'desc':
          'A responsive academic management web platform for students and professors. Includes course scheduling, grade tracking, announcements, and a clean dashboard interface.',
      'longDesc':
          'A web-based university academic portal built for students and faculty members. It facilitates academic organization by featuring course schedules, marks tracking, announcement boards, and role-based portals.',
      'features': [
        'Professor and Student portal customization.',
        'Dynamic course scheduling and timetable visualization.',
        'Real-time grades recording and GPA computation.',
        'Global announcements board for campus updates.'
      ],
      'tag': 'Web',
      'color': 0xFF9C27B0,
      'tech': ['HTML', 'CSS', 'JavaScript', 'PHP'],
      'apk': '',
      'github': 'https://github.com/BEN-KAOUTAR',
      'web': 'https://github.com/BEN-KAOUTAR',
      'status': 'done',
    },
    {
      'title': 'iKenas',
      'emoji': '🏠',
      'logo': '',
      'images': <String>[],
      'desc':
          'A smart home services app connecting users with professional cleaning and household service providers. Features booking, real-time availability, and service history tracking.',
      'longDesc':
          'A mobile service platform connecting users with local home services and maintenance professionals. Features online booking, real-time provider schedules, notification alerts, and booking history.',
      'features': [
        'Seamless booking workflow for home cleaning and repairs.',
        'Interactive provider ratings and availability lists.',
        'Real-time appointment tracking and booking history.',
        'Secure billing integrations.'
      ],
      'tag': 'Flutter',
      'color': 0xFFE91E63,
      'tech': ['Flutter', 'Dart', 'Firebase', 'Provider'],
      'apk': '',
      'github': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'Amannet (PFE)',
      'emoji': '🔐',
      'logo': '',
      'images': <String>[],
      'desc':
          'End-of-study project — A comprehensive trust and security platform. Implements advanced authentication, role-based access control, and secure data management for enterprise use.',
      'longDesc':
          'An end-of-study project (PFE) consisting of a high-security and data integrity platform. It employs state-of-the-art encryption algorithms, role-based authorization rules, and enterprise-grade data management pipelines.',
      'features': [
        'Secure user authentication and verification processes.',
        'Role-Based Access Control (RBAC) permission configuration.',
        'Cryptographically secured data tables.',
        'Comprehensive audit logs for system operations.'
      ],
      'tag': 'Flutter',
      'color': 0xFF00FFCC,
      'tech': ['Flutter', 'Dart', 'Firebase', 'Kotlin', 'REST API'],
      'apk': '',
      'github': 'https://github.com/BEN-KAOUTAR',
      'web': '',
      'status': 'done',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double w = constraints.maxWidth;
      final bool isMobile = w < 850;
      final double hPad = isMobile ? 24 : (w < 1200 ? 60 : 100);
      final int cols = w < 650 ? 1 : (w < 1050 ? 2 : 3);

      return Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
        child: Column(
          children: [
            buildSectionHeader("My Projects"),
            const SizedBox(height: 50),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 28,
                mainAxisSpacing: 28,
                mainAxisExtent: 460,
              ),
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                final accentColor = Color(project['color'] as int);
                final isComingSoon = project['status'] == 'coming_soon';

                return HoverWidget(
                  builder: (isHovered) {
                    return GestureDetector(
                      onTap: () => _showProjectDetailDialog(context, project),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D0A24).withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isHovered
                              ? accentColor
                              : accentColor.withValues(alpha: 0.25),
                          width: isHovered ? 1.5 : 1,
                        ),
                        boxShadow: isHovered
                            ? [
                                BoxShadow(
                                  color: accentColor.withValues(alpha: 0.25),
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Banner ──────────────────────────────────────
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 145,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  accentColor.withValues(alpha: isHovered ? 0.25 : 0.1),
                                  accentColor.withValues(alpha: isHovered ? 0.05 : 0.02),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: AnimatedScale(
                                    scale: isHovered ? 1.15 : 1.0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOutBack,
                                    child: Text(
                                      project['emoji'] as String,
                                      style: const TextStyle(fontSize: 60),
                                    ),
                                  ),
                                ),
                                // Tag badge
                                Positioned(
                                  top: 14,
                                  right: 14,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: accentColor.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: accentColor, width: 1),
                                    ),
                                    child: Text(
                                      project['tag'] as String,
                                      style: TextStyle(
                                        color: accentColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // Coming Soon badge
                                if (isComingSoon)
                                  Positioned(
                                    top: 14,
                                    left: 14,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.orange, width: 1),
                                      ),
                                      child: const Text(
                                        'Coming Soon',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          // ── Content ──────────────────────────────────────
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project['title'] as String,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: Text(
                                      project['desc'] as String,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 12.5,
                                          height: 1.6),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Tech chips
                                  Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children:
                                        (project['tech'] as List<String>)
                                            .map((tech) => Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: accentColor.withValues(alpha: 0.08),
                                                    borderRadius:
                                                        BorderRadius.circular(6),
                                                    border: Border.all(
                                                        color: accentColor.withValues(alpha: 0.3)),
                                                  ),
                                                  child: Text(tech,
                                                      style: TextStyle(
                                                          color: accentColor.withValues(alpha: 0.8),
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600)),
                                                ))
                                            .toList(),
                                  ),
                                  const SizedBox(height: 14),
                                  // ── Action buttons ──────────────────────
                                  Row(
                                    children: [
                                      if (!isComingSoon && (project['apk'] as String).isNotEmpty)
                                        _buildLinkBtn(
                                          icon: FontAwesomeIcons.googlePlay,
                                          label: 'APK',
                                          url: project['apk'] as String,
                                          color: accentColor,
                                        ),
                                      if (!isComingSoon && (project['apk'] as String).isNotEmpty)
                                        const SizedBox(width: 10),
                                      if (!isComingSoon && (project['web'] as String).isNotEmpty)
                                        _buildLinkBtn(
                                          icon: Icons.language,
                                          label: 'Live',
                                          url: project['web'] as String,
                                          color: accentColor,
                                          isFa: false,
                                        ),
                                      if (!isComingSoon)
                                        _buildLinkBtn(
                                          icon: FontAwesomeIcons.github,
                                          label: 'GitHub',
                                          url: 'https://github.com/BEN-KAOUTAR',
                                          color: accentColor,
                                        ),
                                      if (isComingSoon)
                                        Text(
                                          'In development...',
                                          style: TextStyle(
                                            color: Colors.orange.withValues(alpha: 0.7),
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildLinkBtn({
    required dynamic icon,
    required String label,
    required String url,
    required Color color,
    bool isFa = true,
  }) {
    return HoverWidget(
      builder: (isHovered) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse(url)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isHovered ? color.withValues(alpha: 0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isHovered ? color : color.withValues(alpha: 0.4),
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.3),
                        blurRadius: 10,
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isFa
                    ? FaIcon(icon, size: 11, color: color)
                    : Icon(icon as IconData, size: 13, color: color),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Detailed Project Dialog ──────────────────────────────────────────────────
  void _showProjectDetailDialog(BuildContext context, Map<String, dynamic> project) {
    final accentColor = Color(project['color'] as int);
    final isComingSoon = project['status'] == 'coming_soon';
    final hasImages = project['images'] != null && (project['images'] as List).isNotEmpty;
    final imagesList = hasImages ? List<String>.from(project['images'] as List) : <String>[];

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 900,
                maxHeight: 700,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF0D0A24).withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: accentColor.withValues(alpha: 0.4), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.15),
                    blurRadius: 30,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Close Button
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70, size: 24),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(28),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 750;
                        final double contentHeight = constraints.maxHeight - 20;

                        final widgetList = [
                          // Left Section (Images or Logo)
                          if (hasImages)
                            _buildImageCarousel(imagesList, accentColor)
                          else
                            Container(
                              height: isMobile ? 220 : 350,
                              decoration: BoxDecoration(
                                color: accentColor.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: accentColor.withValues(alpha: 0.15)),
                              ),
                              child: Center(
                                child: Text(
                                  project['emoji'] as String,
                                  style: const TextStyle(fontSize: 90),
                                ),
                              ),
                            ),
                          
                          if (isMobile) const SizedBox(height: 20),

                          // Right Section (Details)
                          _buildDetailsPane(context, project, accentColor, isComingSoon, isMobile),
                        ];

                        if (isMobile) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widgetList,
                            ),
                          );
                        } else {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: contentHeight,
                                  child: widgetList[0],
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                flex: 6,
                                child: SizedBox(
                                  height: contentHeight,
                                  child: widgetList[1],
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageCarousel(List<String> images, Color accentColor) {
    final PageController controller = PageController();
    return StatefulBuilder(
      builder: (context, setState) {
        int currentPage = 0;
        
        // Use post-frame callback to safely handle page changes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.addListener(() {
            if (controller.hasClients) {
              final int page = controller.page?.round() ?? 0;
              if (page != currentPage) {
                setState(() {
                  currentPage = page;
                });
              }
            }
          });
        });

        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: const Color(0xFF030014),
                  child: PageView.builder(
                    controller: controller,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                final bool isSelected = currentPage == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: isSelected ? 24 : 8,
                  decoration: BoxDecoration(
                    color: isSelected ? accentColor : accentColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailsPane(
    BuildContext context,
    Map<String, dynamic> project,
    Color accentColor,
    bool isComingSoon,
    bool isMobile,
  ) {
    final List<String> features = List<String>.from(project['features'] as List);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & Logo Row
        Row(
          children: [
            if ((project['logo'] as String).isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    project['logo'] as String,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Text(
                project['emoji'] as String,
                style: const TextStyle(fontSize: 28),
              ),
            if ((project['logo'] as String).isEmpty) const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['title'] as String,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    project['tag'] as String,
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const Divider(color: Color(0x1F00FFCC), height: 1),
        const SizedBox(height: 16),
        // Description & Features Scrollable Area
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Project',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                const SizedBox(height: 6),
                Text(
                  project['longDesc'] as String,
                  style: const TextStyle(color: Colors.white54, fontSize: 13, height: 1.6),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Key Features',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                ...features.map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check_circle_outline_rounded, color: accentColor, size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: const TextStyle(color: Colors.white54, fontSize: 12.5, height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
                const Text(
                  'Technologies',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: (project['tech'] as List<String>)
                      .map((tech) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: accentColor.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: accentColor.withValues(alpha: 0.3)),
                            ),
                            child: Text(
                              tech,
                              style: TextStyle(
                                color: accentColor.withValues(alpha: 0.9),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        // Action buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!isComingSoon && (project['apk'] as String).isNotEmpty) ...[
              _buildDialogLinkBtn(
                icon: FontAwesomeIcons.android,
                label: 'Download APK',
                url: (project['apk'] as String).startsWith('http')
                    ? project['apk'] as String
                    : Uri.base.resolve(project['apk'] as String).toString(),
                color: accentColor,
              ),
              const SizedBox(width: 12),
            ],
            if (!isComingSoon && (project['github'] as String).isNotEmpty) ...[
              _buildDialogLinkBtn(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                url: project['github'] as String,
                color: accentColor,
              ),
            ],
            if (isComingSoon)
              Text(
                'Coming soon...',
                style: TextStyle(
                  color: Colors.orange.withValues(alpha: 0.7),
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildDialogLinkBtn({
    required dynamic icon,
    required String label,
    required String url,
    required Color color,
  }) {
    return HoverWidget(
      builder: (isHovered) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse(url)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isHovered ? color.withValues(alpha: 0.25) : color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isHovered ? color : color.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(icon, size: 14, color: color),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
