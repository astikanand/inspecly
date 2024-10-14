import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspecly/app/modules/home/controllers/home_controller.dart';


class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white10, Colors.deepPurpleAccent.withOpacity(0.5)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              )
            ),
            title: const Text("Inspecly", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
            centerTitle: true,  
            backgroundColor: Colors.deepPurpleAccent,
            elevation: 5, 
            shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
            shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical( bottom: Radius.circular(15))),
          ),


          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text("Co-pilot for your next nuts-bolts inspection", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    Image.asset(
                      "assets/images/home_page.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    const Text("Upload the Image and let the action begin.", style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Squared Elevated button for "Pick from Gallery"
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => homeController.pickImage(ImageSource.gallery),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, // More vertical space for icon and text
                                  horizontal: 25.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Square corners
                                ),
                                elevation: 5, // Elevation for shadow
                              ),
                              child: const Column(
                                children: [
                                  Icon(Icons.photo, size: 40), // Icon
                                  SizedBox(height: 8), // Space between icon and text
                                  Text('Pick from Gallery', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('OR'),
                        ),
                        // Squared Elevated button for "Take from Camera"
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => homeController.pickImage(ImageSource.camera),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 25.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Square corners
                                ),
                                elevation: 5, // Elevation for shadow
                              ),
                              child: const Column(
                                children: [
                                  Icon(Icons.camera_alt, size: 40), // Icon
                                  SizedBox(height: 8), // Space between icon and text
                                  Text('Take from Camera', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),

      
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Inspections',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation bar tap
        },
      ),
    );
  }
}
