import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  // Sample attendance data
  final List<Map<String, String>> _attendanceRecords = [
    {'date': '2023-10-10', 'status': 'Present', 'remarks': 'On time'},
    {'date': '2023-10-09', 'status': 'Absent', 'remarks': 'No show'},
    {'date': '2023-10-08', 'status': 'Present', 'remarks': 'Late'},
    {'date': '2023-10-07', 'status': 'Present', 'remarks': 'On time'},
    {'date': '2023-10-06', 'status': 'Absent', 'remarks': 'Sick leave'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Records'),
        backgroundColor: Colors.blue.shade800, // Match the app theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Your Attendance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'View your attendance records below.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 20),
            // Attendance Records List
            Expanded(
              child: ListView.builder(
                itemCount: _attendanceRecords.length,
                itemBuilder: (context, index) {
                  final record = _attendanceRecords[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        record['status'] == 'Present'
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: record['status'] == 'Present'
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text('Date: ${record['date']}'),
                      subtitle: Text('Remarks: ${record['remarks']}'),
                      trailing: Text(
                        record['status']!,
                        style: TextStyle(
                          color: record['status'] == 'Present'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Summary
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Present: ${_calculateTotalPresent()}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'Total Absent: ${_calculateTotalAbsent()}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate total present days
  int _calculateTotalPresent() {
    return _attendanceRecords
        .where((record) => record['status'] == 'Present')
        .length;
  }

  // Function to calculate total absent days
  int _calculateTotalAbsent() {
    return _attendanceRecords
        .where((record) => record['status'] == 'Absent')
        .length;
  }
}