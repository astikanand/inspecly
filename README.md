# Inspecly
Inspecly is an app that practically acts as a Co-Pilot for the inspection.
The app takes image of nuts & bolts with paint marks on it to check if the bolts are tightening/missed. It processes the image and gives the output after inspection marking of its alignment.


### Features
- Takes image as input and performs object detection to detect nuts & bolts in image
- On the detected image checks for white paint marks and applies logic to decide alignment
- Saves the original image, and inspection image along with inspection details in the DB.


### APIs
- Check APIs & Documentation for it at [https://github.com/astikanand/inspecly_backend](https://github.com/astikanand/inspecly_backend)


### Prerquisites for Frontend App
- Dart 
- Flutter (Framework for the App)
- Obx (For Observables, and Dynamity)


### Getting started
1. Install Flutter
2. Setup IOS / Android Physical Device or Emulator to run and Test.
3. Run `flutter pub get` to install required dependencies for the project from `pubspec.yaml`
4. Run `flutter pub run build_runner build` to generate some required files
5. Run the app using `flutter run`


### Directory Structure
- lib # All the code files are present here
- app # contains config & modules (2 Modules are home, nuts_bolts)
- Each Module has controller, model, view.
  - Controller: All the core logic
  - Model: DataModel which should be in sync with the model present in Backend Apis
  - View: Contains Screens/Pages

### Time Taken for this Project
- Figuring Tools to Use = 6 hrs
- Learning & Exploring ML Object Detection (Learned From Scratch) = 6 hrs
- Learning & Exploring Image Processing Using OpenCV, MatPlotlib, PIL (Learned From Scratch) = 8 hrs
- Developing Backend APIs using Pyton, FastAPI = 8 hrs
- Developing Frontend for IOS using Dart, Flutter = 8 hrs
- Total = 36 Hours

## Demo Video

https://github.com/user-attachments/assets/9a86891f-4862-43df-8964-93f57fcf6616
