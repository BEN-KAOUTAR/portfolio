import 'package:flutter/material.dart';
import '../widgets/hover_widget.dart';
import '../widgets/section_header.dart';


class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D0A24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Success ✓',
            style: TextStyle(color: Color(0xFF00FFCC))),
        content: const Text('Message sent successfully!',
            style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK', style: TextStyle(color: Color(0xFF00FFCC))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double w = constraints.maxWidth;
      final bool isMobile = w < 850;
      final double hPad = isMobile ? 24 : (w < 1200 ? 60 : 100);

      return Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
        child: Column(
          children: [
            buildSectionHeader("Get In Touch"),
            isMobile
                ? Column(
                    children: [
                      _buildInfoDetails(),
                      const SizedBox(height: 50),
                      _buildFormCard(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildInfoDetails()),
                      const SizedBox(width: 60),
                      Expanded(child: _buildFormCard()),
                    ],
                  ),
          ],
        ),
      );
    });
  }

  Widget _buildInfoDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let's talk about your next project!",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        const Text(
          "Whether you want to build a mobile application from scratch, discuss a digital development strategy, or are looking for a dedicated intern/developer, reach out anytime.",
          style: TextStyle(color: Colors.white54, fontSize: 15, height: 1.6),
        ),
        const SizedBox(height: 40),
        _buildInfoItem(Icons.phone, "Call Me", "+212 630-170598"),
        const SizedBox(height: 20),
        _buildInfoItem(Icons.email, "Email Me", "benhettouchkaoutar@gmail.com"),
        const SizedBox(height: 20),
        _buildInfoItem(Icons.location_on, "Location",
            "Rue 1010, Tarrast Inezgane, Agadir, Morocco"),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String value) {
    return HoverWidget(
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF0D0A24).withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered
                  ? const Color(0xFF00FFCC)
                  : const Color(0x1F00FFCC),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00FFCC).withValues(alpha: 0.1),
                ),
                child: Icon(icon, color: const Color(0xFF00FFCC), size: 20),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text(value,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0A24).withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x3300FFCC)),
      ),
      child: Column(
        children: [
          _buildTextField(_nameController, "Your Name"),
          const SizedBox(height: 15),
          _buildTextField(_emailController, "Your Email Address"),
          const SizedBox(height: 15),
          _buildTextField(_subjectController, "Subject"),
          const SizedBox(height: 15),
          _buildTextField(_messageController, "Your Message...", maxLines: 5),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00FFCC),
                foregroundColor: const Color(0xFF030014),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('SEND MESSAGE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white30, fontSize: 14),
        fillColor: Colors.black.withValues(alpha: 0.4),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0x3300FFCC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0x3300FFCC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF00FFCC)),
        ),
      ),
    );
  }
}
