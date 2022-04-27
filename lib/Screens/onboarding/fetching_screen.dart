import 'package:flutter/material.dart';

class FetchingScreen extends StatefulWidget {
  FetchingScreen({Key? key}) : super(key: key);

  @override
  State<FetchingScreen> createState() => _FetchingScreenState();
}

class _FetchingScreenState extends State<FetchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //child: FloatingActionButton(onPressed: _navigateToFolderScreen),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD6B392)),
                  strokeWidth: 4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Fetching videos from the storage',
                style: TextStyle(fontSize: 17, color: Color(0xFFD6B392)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
