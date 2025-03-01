import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  // Controllers for text fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  // Dropdown value for feedback type
  String _feedbackType = 'Suggestion';

  // List of feedback types
  final List<String> _feedbackTypes = ['Suggestion', 'Issue'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        backgroundColor: Colors.blue.shade800, // Match the app theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'We value your feedback!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please share your suggestions or report any issues.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 20),
              // Name Field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 16),
              // Email Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 16),
              // Feedback Type Dropdown
              DropdownButtonFormField<String>(
                value: _feedbackType,
                items: _feedbackTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _feedbackType = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Feedback Type',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
              ),
              SizedBox(height: 16),
              // Feedback Field
              TextField(
                controller: _feedbackController,
                maxLines: 5, // Allow multiple lines for feedback
                decoration: InputDecoration(
                  labelText: 'Your Feedback',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 20),
              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _submitFeedback();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade800, // Match the app theme
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Submit Feedback',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle feedback submission
  void _submitFeedback() {
    // Get values from controllers
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String feedback = _feedbackController.text.trim();

    // Basic validation
    if (name.isEmpty || email.isEmpty || feedback.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Simulate feedback submission (you can replace this with an API call)
    if (kDebugMode) {
      print('Feedback Submitted:');
    }
    if (kDebugMode) {
      print('Name: $name');
    }
    if (kDebugMode) {
      print('Email: $email');
    }
    if (kDebugMode) {
      print('Type: $_feedbackType');
    }
    if (kDebugMode) {
      print('Feedback: $feedback');
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thank you for your feedback!'),
        backgroundColor: Colors.green,
      ),
    );

    // Clear the form
    _nameController.clear();
    _emailController.clear();
    _feedbackController.clear();
    setState(() {
      _feedbackType = 'Suggestion'; // Reset dropdown
    });
  }
}