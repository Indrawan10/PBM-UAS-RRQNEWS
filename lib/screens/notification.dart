import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data notifikasi
    List<String> notifications = [
      "Notifikasi 1",
      "Notifikasi 2",
      "Notifikasi 3",
      "Notifikasi 4",
      "Notifikasi 5",
      "Notifikasi 6",
      "Notifikasi 7",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          DateTime now = DateTime.now();
          String formattedDate = "${now.day}-${now.month}-${now.year}";
          return InkWell(
            onTap: () {
              // Aksi yang dijalankan saat notifikasi diklik
              print('Notifikasi ${index + 1} diklik');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                leading: SizedBox(
                  width: 48.0,
                  height: 5,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.bell_circle,
                      size: 30.0,
                      color: Color.fromARGB(255, 161, 161, 161),
                    ),
                  ),
                ),
                title: Text(
                  'Notification ${index + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      'This is the description of the notification.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      ' $formattedDate',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
