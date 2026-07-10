import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  bool _isLoading = false;
  String? _nameError;
  String? _emailError;
  String? _subjectError;
  String? _messageError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    setState(() {
      _nameError = _nameController.text.trim().isEmpty ? 'Name is required' : null;
      
      final email = _emailController.text.trim();
      if (email.isEmpty) {
        _emailError = 'Email is required';
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        _emailError = 'Enter a valid email address';
      } else {
        _emailError = null;
      }
      
      _subjectError = _subjectController.text.trim().isEmpty ? 'Subject is required' : null;
      _messageError = _messageController.text.trim().isEmpty ? 'Message is required' : null;
    });
    
    return _nameError == null && _emailError == null && _subjectError == null && _messageError == null;
  }

  Future<void> _sendMessage() async {
    if (!_validateForm()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://formspree.io/f/meebyozk'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'subject': _subjectController.text.trim(),
          'message': _messageController.text.trim(),
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
        
        if (mounted) {
          _showFeedbackDialog(
            title: 'Success ✓',
            message: 'Your message has been sent successfully!',
            isSuccess: true,
          );
        }
      } else {
        if (mounted) {
          _showFeedbackDialog(
            title: 'Error ⚠',
            message: 'Failed to send message. Please try again later.',
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        _showFeedbackDialog(
          title: 'Connection Error ⚠',
          message: 'Please check your internet connection and try again.',
          isSuccess: false,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showFeedbackDialog({
    required String title,
    required String message,
    required bool isSuccess,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D0A24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title,
            style: TextStyle(color: isSuccess ? const Color(0xFF00FFCC) : Colors.redAccent)),
        content: Text(message,
            style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('OK', style: TextStyle(color: isSuccess ? const Color(0xFF00FFCC) : Colors.redAccent)),
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
        _buildInfoItem(Icons.email, "Email Me", "kaoutarbenhettouch12@gmail.com"),
        const SizedBox(height: 20),
        _buildInfoItem(Icons.location_on, "Location",
            "Rue Molay ali chrif, Tarrast Inezgane, Morocco"),
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
          _buildTextField(_nameController, "Your Name", errorText: _nameError),
          const SizedBox(height: 15),
          _buildTextField(_emailController, "Your Email Address", errorText: _emailError),
          const SizedBox(height: 15),
          _buildTextField(_subjectController, "Subject", errorText: _subjectError),
          const SizedBox(height: 15),
          _buildTextField(_messageController, "Your Message...", maxLines: 5, errorText: _messageError),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00FFCC),
                foregroundColor: const Color(0xFF030014),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Color(0xFF030014),
                        strokeWidth: 2.5,
                      ),
                    )
                  : const Text('SEND MESSAGE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {int maxLines = 1, String? errorText}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white30, fontSize: 14),
        fillColor: Colors.black.withValues(alpha: 0.4),
        filled: true,
        errorText: errorText,
        errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorText != null ? Colors.redAccent : const Color(0x3300FFCC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorText != null ? Colors.redAccent : const Color(0x3300FFCC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorText != null ? Colors.redAccent : const Color(0xFF00FFCC)),
        ),
      ),
    );
  }
}
