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
      'title': 'Scientific Calculator',
      'emoji': '🧮',
      'logo': 'assets/calculatrice_logo.png',
      'images': [
        'assets/calculatrice_1.jpg',
        'assets/calculatrice_2.jpg',
      ],
      'desc':
          'A native Android scientific calculator app inspired by Casio designs, featuring advanced calculations, implicit multiplication, and a persistent history.',
      'longDesc':
          'A modern, native Android scientific calculator that replicates the professional features and aesthetic of Casio calculators. Built using Kotlin and XML layouts, it supports arithmetic operations, trigonometric and logarithmic functions, algebraic powers, and constant values. It features memory storage, implicit multiplication handling, and persistent calculation history using Gson and SharedPreferences.',
      'features': [
        'Comprehensive functions: Trigonometrics (sin, cos, tan, inverses in degrees), logarithms (log, ln), exponents, algebraic powers, absolute values, factorials, and constants (π, e).',
        'Casio-inspired design: Responsive layouts in portrait and landscape with styled, color-coded buttons (cyan functions, dark blue numbers, gold borders, orange delete buttons).',
        'Implicit multiplication: Naturally parses and evaluates math expressions like "2π" or "5sin(30)" without typing explicit multiplication symbols.',
        'Memory management: Built-in STO, RCL, M+, and M- commands to easily store and reuse intermediate results.',
        'Persistent calculation history: View and manage the last 50 calculations, saved and restored across sessions via SharedPreferences and Gson.',
        'Adaptive layouts: Custom XML grids that auto-adjust dynamically to fit smartphones and tablets in both portrait and landscape orientations.'
      ],
      'tag': 'Kotlin',
      'color': 0xFF5CAFD8,
      'tech': ['Kotlin', 'Android SDK', 'SharedPreferences', 'Gson', 'XML Layouts'],
      'apk': 'calculatrice.apk',
      'github': 'https://github.com/BEN-KAOUTAR/calculatrice',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'CourtKeeper (Tennis)',
      'emoji': '🎾',
      'logo': 'assets/courtkeeper_logo.png',
      'images': [
        'assets/courtkeeper_2.png',
        'assets/courtkeeper_1.png',
        'assets/courtkeeper_3.png',
      ],
      'desc':
          'An intelligent Android app dedicated to automatic tennis score management, strictly respecting official rules: Points, Games, Sets, Deuce, Advantage, and Tie-break. Saves full match history.',
      'longDesc':
          'CourtKeeper is a modern, native Android application designed to track and manage tennis matches in real-time. It automates all score tracking, handles complex Deuce/Advantage states, and manages sets and tie-breaks. It also supports local match history preservation using Gson serialization and SharedPreferences.',
      'features': [
        'Automatic score calculation following official tennis rules (0, 15, 30, 40).',
        'Complete management of Deuce (tie) and Advantage (AD) states.',
        'Automatic Game tracking (win at 6 with a 2-game margin, or tie-break at 7-6/7-5).',
        'Automatic Set tracking (match won in best of 3 sets).',
        'Dynamic and secure customization of player names via styled dialog boxes.',
        'Automatic current match state persistence to resume after any interruption.',
        'Comprehensive history of played matches with date, scores, and winner details (RecyclerView).',
        'Smooth visual effects and animations (pulse effect on score changes, item transitions).',
        'Dark, futuristic theme optimized for perfect readability on the court.'
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
      'title': 'Galerie Touristique',
      'emoji': '🌍',
      'logo': 'assets/galerie_logo.png',
      'images': [
        'assets/galerie_1.png',
        'assets/galerie_2.png',
        'assets/galerie_3.png',
        'assets/galerie_4.png',
        'assets/galerie_5.png',
        'assets/galerie_6.png',
        'assets/galerie_7.png',
        'assets/galerie_8.png',
        'assets/galerie_9.png',
      ],
      'desc':
          'An Android guide and itinerary planner that displays destinations, hotel selections, real-time cost estimations, and integrates Gemini AI travel tips.',
      'longDesc':
          'Galerie Touristique is a native Android guide app designed for travellers. It serves as an interactive planner allowing users to organize visits, estimate hotel costs in real-time, view weather/ideal visiting times, and get curated AI recommendations (via Gemini) for local hidden gems.',
      'features': [
        'AI Assistance (Gemini): Exclusive tips, best visiting times, and local hidden gems generated for each destination.',
        'Recent improvements: Complete theme bug fixes (invisible text), modern Pill Indicator rendering (green/gray), and resource cleanup.',
        'Interactive booking system with real-time total price calculation (hotels, guides, and travelers).',
        'Home screen with dynamic carousel (Top Picks), animated indicators, and a complete city list.',
        'Secure authentication with local preference storage and full profile management.',
        'Manage active, pending, or cancelled trips in My Visits with easy modification.',
        'Quick actions: Call/SMS support, content sharing, and geolocation on Google Maps.'
      ],
      'tag': 'Kotlin',
      'color': 0xFF2196F3,
      'tech': ['Kotlin', 'ViewPager2', 'Glide', 'ViewBinding', 'SharedPreferences'],
      'apk': 'galerie_touristique.apk',
      'github': 'https://github.com/BEN-KAOUTAR/galerietouristique',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'Academic Pro',
      'emoji': '🎓',
      'logo': 'assets/academic_pro_logo.png',
      'images': [
        'assets/academic_pro_1.png',
        'assets/academic_pro_2.png',
        'assets/academic_pro_3.png',
        'assets/academic_pro_4.png',
        'assets/academic_pro_5.png',
        'assets/academic_pro_6.png',
        'assets/academic_pro_7.png',
        'assets/academic_pro_8.png',
        'assets/academic_pro_9.png',
      ],
      'desc':
          'A mobile and web academic management app dedicated to Digital Hubs. Centralizes grades, attendance, and timetables — fully offline.',
      'longDesc':
          'Academic Pro is a comprehensive cross-platform academic management system built with Flutter, designed to centralize and digitize all administrative and educational workflows within vocational training centers in Morocco. It replaces scattered Excel sheets and paper forms with a single unified workspace that works completely offline using a local SQLite database.\n\nThe system supports three distinct user roles — Educational Director, Trainer, and Student — where the Director acts as the administrator responsible for creating and managing all accounts, schedules, validation logs, exam scheduling, messaging, and real-time alerts.',
      'features': [
        'Three distinct profiles: Educational Director, Trainer, and Student.',
        'Trainer and Student account creation managed exclusively by the Educational Director.',
        'Comprehensive management of grades, attendance, timetables, and exams.',
        '100% offline functionality powered by a local SQLite database.',
        'Automated generation and printing of PDF documents (transcripts, schedules).',
        'Interactive dashboard with charts, integrated instant messaging, and real-time notifications.'
      ],
      'tag': 'Flutter',
      'color': 0xFFEC407A,
      'tech': ['Flutter', 'Dart', 'SQLite', 'Provider'],
      'apk': 'academic_pro.apk',
      'github': '',
      'web': 'https://ben-kaoutar.github.io/my_flutter_project/',
      'status': 'done',
    },
    {
      'title': 'Schoolline (iKenas)',
      'emoji': '🏫',
      'logo': 'assets/schoolline_logo.png',
      'images': [
        'assets/schoolline_1.jpeg',
        'assets/schoolline_2.jpeg',
        'assets/schoolline_3.jpeg',
        'assets/schoolline_4.jpeg',
        'assets/schoolline_5.jpeg',
        'assets/schoolline_6.jpeg',
        'assets/schoolline_7.jpeg',
        'assets/schoolline_8.jpeg',
        'assets/schoolline_9.jpeg',
        'assets/schoolline_10.jpeg',
        'assets/schoolline_11.jpeg',
        'assets/schoolline_12.jpeg',
        'assets/schoolline_13.jpeg',
        'assets/schoolline_14.jpeg',
        'assets/schoolline_15.jpeg',
        'assets/schoolline_16.jpeg',
        'assets/schoolline_17.png',
        'assets/schoolline_18.png',
        'assets/schoolline_19.jpeg',
        'assets/schoolline_20.jpeg',
        'assets/schoolline_21.jpeg',
        'assets/schoolline_22.jpeg',
        'assets/schoolline_23.jpeg',
        'assets/schoolline_24.jpeg',
        'assets/schoolline_25.jpeg',
        'assets/schoolline_26.jpeg',
        'assets/schoolline_27.jpeg',
        'assets/schoolline_28.jpeg',
      ],
      'desc':
          'A cross-platform school management app developed during my internship at iKenas, centralizing student data, grades, attendance, and teacher–parent communication.',
      'longDesc':
          'Schoolline is a multi-platform mobile school management application developed during my internship at iKenas. Designed to modernize school administrations, it centralizes all communications between the administration, teachers, and parents within one platform.\n\nThe app uses an offline caching system for uninterrupted data access, secure JWT token authentication, and Firebase Cloud Messaging for instant push notifications. It adopts a clean MVVM architecture with the Repository Pattern, using BLoC and Provider for state management. The backend is a Node.js + Express.js REST API backed by MongoDB Atlas and Mongoose, with bcrypt for password encryption and Swagger for API documentation.',
      'features': [
        'Multi-role access: Administrator, Teacher, and Parent accounts.',
        'Real-time academic performance tracking: grades per subject, evolution charts, and class ranking.',
        'Attendance module with justified/unjustified absence counts and a monthly calendar view.',
        'Monthly school fee payment tracking with per-month status indicators.',
        'In-app messaging system with direct and group conversation support.',
        'Notification center with categorized alerts: Exams, Grades, Homework, and Events.',
        'Teacher dashboard with class management, grade entry, and a statistics leaderboard.',
        'Offline data access via local secure storage cache.',
        'Secure HTTPS/TLS communications with JWT authentication and bcrypt password hashing.',
        'Real-time push notifications via Firebase Cloud Messaging (FCM).'
      ],
      'tag': 'Flutter',
      'color': 0xFF9C27B0,
      'tech': ['Flutter', 'Node.js', 'MongoDB', 'BLoC', 'Provider', 'Firebase'],
      'apk': '',
      'github': '',
      'web': '',
      'status': 'done',
    },
    {
      'title': 'AmanNet (PFE)',
      'emoji': '🛡️',
      'logo': 'assets/amannet_logo.png',
      'images': [
        'assets/amannet_1.png',
        'assets/amannet_2.png',
        'assets/amannet_3.png',
        'assets/amannet_4.png',
        'assets/amannet_5.png',
        'assets/amannet_6.png',
        'assets/amannet_7.png',
        'assets/amannet_8.png',
        'assets/amannet_9.png',
        'assets/amannet_10.png',
        'assets/amannet_11.png',
        'assets/amannet_12.png',
        'assets/amannet_13.png',
        'assets/amannet_14.png',
        'assets/amannet_15.png',
        'assets/amannet_16.png',
        'assets/amannet_17.png',
        'assets/amannet_18.png',
        'assets/amannet_19.png',
        'assets/amannet_20.png',
        'assets/amannet_21.png',
        'assets/amannet_22.png',
        'assets/amannet_23.png',
        'assets/amannet_24.png',
        'assets/amannet_25.png',
      ],
      'desc':
          'A smart residential community management ecosystem with role-based access control, incident reporting, and real-time tenant-syndic communication.',
      'longDesc':
          'AmanNet is an intelligent residential management platform developed as my end-of-study graduation project (PFE). It connects residents, property managers (syndic), and guards. The mobile application allows residents to manage access via dynamic QR codes, request visitor entries, view utility charges, and log incidents. A comprehensive web panel lets property managers oversee the community, manage payments, publish announcements, and process emergency SOS alerts.\n\nThe system utilizes a Flutter mobile client built with Clean Architecture and the BLoC pattern. The backend runs on Node.js/Express with TypeScript, storing data on MongoDB Atlas, while Socket.IO handles real-time chats and Firebase manages push alerts.',
      'features': [
        'Dynamic QR Codes: Instant, secure visitor entry authorization and resident access control.',
        'Property Management Web Panel: Property managers manage residents, track dues, and publish community news.',
        'Real-Time Messaging & Notifications: Live tenant-to-manager chat via Socket.IO and push alerts via Firebase (FCM).',
        'Incident & Payment System: Log neighborhood maintenance reports and monitor monthly fee balances.',
        'Emergency SOS Alert: Quick emergency trigger notifying nearby guards and the syndic immediately.',
        'Secure Role-Based Access: Dedicated portals for Managers (Web), Residents (Mobile), and Guards.'
      ],
      'tag': 'Flutter',
      'color': 0xFF00796B,
      'tech': ['Flutter', 'Node.js', 'MongoDB', 'BLoC', 'Socket.IO', 'Firebase'],
      'apk': 'amannet.apk',
      'github': '',
      'web': 'https://hiba13434085.github.io/amanNet-web/',
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
                mainAxisExtent: 380,
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
                                    child: project['logo'] != null && (project['logo'] as String).isNotEmpty
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: accentColor.withValues(alpha: 0.3),
                                                  blurRadius: 15,
                                                  spreadRadius: 2,
                                                )
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(16),
                                              child: Image.asset(
                                                project['logo'] as String,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Text(
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
                                  Text(
                                    project['desc'] as String,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12.5,
                                        height: 1.6),
                                  ),
                                  const SizedBox(height: 12),
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
                                  const Spacer(),
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
                                      if (!isComingSoon && (project['apk'] as String).isNotEmpty && ((project['web'] as String).isNotEmpty || (project['github'] as String).isNotEmpty))
                                        const SizedBox(width: 8),
                                      if (!isComingSoon && (project['web'] as String).isNotEmpty)
                                        _buildLinkBtn(
                                          icon: Icons.language,
                                          label: 'Site Web',
                                          url: project['web'] as String,
                                          color: accentColor,
                                          isFa: false,
                                        ),
                                      if (!isComingSoon && (project['web'] as String).isNotEmpty && (project['github'] as String).isNotEmpty)
                                        const SizedBox(width: 8),
                                      if (!isComingSoon && (project['github'] as String).isNotEmpty)
                                        _buildLinkBtn(
                                          icon: FontAwesomeIcons.github,
                                          label: 'GitHub',
                                          url: project['github'] as String,
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
                    top: 12,
                    right: 12,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70, size: 24),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  // Main Content
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 52, 28, 28),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 600;
                        final double contentHeight = constraints.maxHeight - 20;

                        if (isMobile) {
                          // On mobile: image on top, scrollable details below
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (hasImages)
                                SizedBox(
                                  height: 240,
                                  child: _ImageCarousel(images: imagesList, accentColor: accentColor),
                                )
                              else
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: accentColor.withValues(alpha: 0.05),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: accentColor.withValues(alpha: 0.15)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      project['emoji'] as String,
                                      style: const TextStyle(fontSize: 80),
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 14),
                              Expanded(
                                child: _buildDetailsPane(context, project, accentColor, isComingSoon, isMobile),
                              ),
                            ],
                          );
                        } else {
                          // On desktop: side-by-side layout
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: contentHeight,
                                  child: hasImages
                                      ? _ImageCarousel(images: imagesList, accentColor: accentColor)
                                      : Container(
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
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                flex: 6,
                                child: SizedBox(
                                  height: contentHeight,
                                  child: _buildDetailsPane(context, project, accentColor, isComingSoon, isMobile),
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

  // carousel is now handled by _ImageCarousel StatefulWidget below

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
                if ((project['title'] as String).contains('AmanNet')) ...[
                  const SizedBox(height: 20),
                  const Text(
                    'Demo Accounts (For Testing)',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Web Panel (Syndic/Admin Access):',
                          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '• Email: syndic@amanet.com\n• Password: Syndic@123\n(Access via the "Site Web" link)',
                          style: TextStyle(color: Colors.white54, fontSize: 11.5, height: 1.5),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Mobile Application (Resident):',
                          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '• Resident: ahmed@amanet.com (A101) | fatima@amanet.com (A102)\n• Password: Ahmed@123 | Fatima@123\n(Access via the downloaded APK)',
                          style: TextStyle(color: Colors.white54, fontSize: 11.5, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
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

// ── Standalone image carousel widget (fixes mouse_tracker assertion) ─────────
class _ImageCarousel extends StatefulWidget {
  final List<String> images;
  final Color accentColor;
  const _ImageCarousel({required this.images, required this.accentColor});

  @override
  State<_ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<_ImageCarousel> {
  late final PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(_onPageChange);
  }

  void _onPageChange() {
    if (_controller.hasClients) {
      final int page = _controller.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() => _currentPage = page);
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onPageChange);
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_controller.hasClients) {
      _controller.animateToPage(
        (_currentPage + 1) % widget.images.length,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prev() {
    if (_controller.hasClients) {
      _controller.animateToPage(
        (_currentPage - 1 + widget.images.length) % widget.images.length,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color accent = widget.accentColor;
    final bool manyImages = widget.images.length >= 15;

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: const Color(0xFF030014),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: _next,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: widget.images.length,
                      itemBuilder: (context, index) => Image.asset(
                        widget.images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Left arrow
                  Positioned(
                    left: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Material(
                        color: Colors.black.withValues(alpha: 0.4),
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: _prev,
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Right arrow
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Material(
                        color: Colors.black.withValues(alpha: 0.4),
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: _next,
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (!manyImages)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (index) {
              final bool isSelected = _currentPage == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 7,
                width: isSelected ? 20 : 7,
                decoration: BoxDecoration(
                  color: isSelected ? accent : accent.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  '${_currentPage + 1} / ${widget.images.length}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (_currentPage + 1) / widget.images.length,
                      backgroundColor: accent.withValues(alpha: 0.15),
                      valueColor: AlwaysStoppedAnimation<Color>(accent),
                      minHeight: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
