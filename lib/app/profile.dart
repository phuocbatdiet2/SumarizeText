import 'package:app_bert/app/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of profiles data
    final profiles = [
      {
        'image': 'assets/logo.png',
        'name': 'Võ Hữu Phước',
        'title': 'Sinh viên - Công Nghệ Thông Tin',
        'mssv': '2001190753',
        'email': '2001190753@hufi.edu.vn',
        'khoa': 'Công Nghệ Thông Tin',
        'khoaHoc': '10DH',
      },
      {
        'image': 'assets/logo.png',
        'name': 'Nguyễn Quốc Hoàng Sơn',
        'title': 'Sinh viên - Công Nghệ Thông Tin',
        'mssv': '2001190787',
        'email': '2001190787@hufi.edu.vn',
        'khoa': 'Công Nghệ Thông Tin',
        'khoaHoc': '10DH',
      },
      {
        'image': 'assets/logo.png',
        'name': 'Võ Minh Nhật',
        'title': 'Sinh viên - Công Nghệ Thông Tin',
        'mssv': '2001190189',
        'email': '2001190189@hufi.edu.vn',
        'khoa': 'Công Nghệ Thông Tin',
        'khoaHoc': '10DH',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
             Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Stack(
            children: [
              // Semi-transparent overlay
              Positioned.fill(
                child: Container(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              // Profile Content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(profile['image']!), // Replace with your profile image path
                  ),
                  SizedBox(height: 20),

                  // Name and Title
                  Text(
                    profile['name']!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    profile['title']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Information Section
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('MSSV', profile['mssv']!),
                        Divider(),
                        _buildInfoRow('Email', profile['email']!),
                        Divider(),
                        _buildInfoRow('Khoa', profile['khoa']!),
                        Divider(),
                        _buildInfoRow('Khóa', profile['khoaHoc']!),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  // Helper function to build each info row
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
