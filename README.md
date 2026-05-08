# 💄 Blush n Bliss — Beauty Salon Booking App

> A modern, elegant, and fully functional Android mobile application for booking beauty and grooming salon appointments — built with Flutter and powered by Firebase.

---

## 📖 Table of Contents

- [About the Project](#about-the-project)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [App Architecture](#app-architecture)
- [Modules Overview](#modules-overview)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
- [Firebase Setup](#firebase-setup)
- [Project Structure](#project-structure)
- [Testing](#testing)
- [Security](#security)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## 📱 About the Project

**Blush n Bliss** is a feature-rich Android mobile application designed to modernize and simplify the salon appointment booking experience. Developed using **Flutter** — Google's powerful cross-platform UI framework — and backed by **Firebase** as a real-time cloud database and authentication provider, Blush n Bliss offers a smooth, intuitive, and reliable digital platform for both salon customers and service providers.

The application eliminates the traditional hassle of calling a salon, waiting on hold, and manually scheduling appointments. Instead, it empowers customers to browse available services, check real-time time slot availability, book appointments, and complete payments — all from their Android smartphones within minutes.

Blush n Bliss is not just a booking app; it is a complete beauty service management ecosystem that bridges the gap between customers seeking quality beauty treatments and salons looking to offer a more professional, organized, and tech-driven experience.

Whether you are looking for a fresh haircut, a relaxing facial, a manicure, or a full grooming package, Blush n Bliss has you covered with a clean, elegant, and easy-to-use interface that makes booking your next salon visit a delightful experience.

---

## ❗ Problem Statement

The traditional beauty salon industry still heavily relies on manual, phone-based appointment scheduling. This outdated approach creates multiple pain points for both customers and salon owners:

- **Long waiting times** due to walk-in customers and no prior slot management
- **Double bookings** and scheduling conflicts caused by manual record keeping
- **Missed appointments** because of no automated reminders or confirmations
- **Limited accessibility** as customers can only book during salon business hours
- **No transparency** on service prices, availability, or staff details before visiting
- **Inefficient payment handling** with no digital payment options available
- **Poor customer experience** due to lack of a personalized booking history or profile

Blush n Bliss directly addresses all of these problems by providing a centralized, digital, and automated appointment management system that benefits both the customer and the salon owner equally.

---

## 🎯 Objectives

The core objectives of the Blush n Bliss application are:

1. To provide customers with a convenient, 24/7 accessible platform for booking beauty appointments
2. To eliminate manual scheduling errors and double bookings through real-time slot management
3. To offer a secure and seamless user authentication system using Firebase Auth
4. To integrate a reliable payment processing system supporting multiple payment methods
5. To maintain a complete digital record of all user bookings and transaction history
6. To deliver a visually appealing, gender-neutral, and highly usable mobile interface
7. To demonstrate best practices in mobile application development using Flutter and Firebase
8. To serve as a practical software engineering project covering the full development lifecycle

---

## ✨ Features

### 👤 User Authentication
- Secure user registration with email, phone number, and password
- Login with email and password using Firebase Authentication
- Password validation with strength enforcement
- Show and hide password toggle functionality
- Forgot password and account recovery flow
- Persistent login session management

### 🛎️ Service Browsing
- Browse a complete catalog of beauty and grooming services
- View detailed service descriptions and pricing
- Filter and search services by category
- View estimated duration for each service

### 📅 Appointment Booking
- Interactive date picker with calendar view
- Real-time time slot availability checking
- Prevention of double bookings on already occupied slots
- Booking summary screen before final confirmation
- Ability to select multiple services in a single booking
- Instant booking confirmation with unique booking ID

### 💳 Payment Processing
- Support for card payments (credit/debit)
- Cash on arrival option for offline customers
- Secure card detail entry with validation
- Real-time order total calculation
- Payment confirmation and digital receipt generation

### 📋 Booking Management
- View all upcoming and past appointments
- Booking status tracking (Pending, Confirmed, Completed, Cancelled)
- Cancel bookings with real-time slot release
- Rebook previous appointments with ease

### 👤 User Profile
- View and edit personal information
- Update phone number and display name
- Change account password securely
- View complete booking history tied to the account

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Mobile Framework** | Flutter 3.x |
| **Programming Language** | Dart |
| **IDE** | Android Studio |
| **Target Platform** | Android |
| **Backend & Database** | Firebase Firestore |
| **Authentication** | Firebase Authentication |
| **Real-time Data Sync** | Firebase Realtime Database |
| **State Management** | setState / Provider |
| **Version Control** | Git & GitHub |
| **UI Components** | Material Design 3 |

---

## 🏗️ App Architecture

Blush n Bliss follows a structured and scalable architectural pattern suited for Flutter applications:

```
Presentation Layer  →  Screens & Widgets (Flutter UI)
Business Logic      →  Controllers & State Management
Data Layer          →  Firebase Firestore & Auth Services
```

The app uses a **service-based architecture** where:
- All Firebase interactions are handled through dedicated service classes
- UI screens are kept clean and only handle rendering logic
- Business rules and data transformations are separated into controller classes
- Models represent clean data structures for User, Booking, Service, and Payment entities

---

## 📦 Modules Overview

### 1. 🔐 Authentication Module
Handles all aspects of user identity and access. Built on top of Firebase Authentication, this module manages user registration, login, session persistence, and password recovery. Email validation, password strength checks, and error handling are all implemented at both the UI and service levels.

### 2. 🛍️ Services Module
Displays the complete catalog of beauty treatments and grooming services available at the salon. Each service entry contains the service name, category, duration, description, and pricing. Data is fetched in real time from Firebase Firestore ensuring the service list is always up to date.

### 3. 📅 Booking Module
The core module of the application. Allows authenticated users to select a desired service, choose a date from the interactive calendar, and pick from available time slots. The system checks Firebase in real time to prevent slot conflicts. Upon confirmation, a booking record is created in Firestore and the selected slot is marked as unavailable for other users.

### 4. 💰 Payment Module
Processes customer payments for confirmed bookings. Supports card-based digital payments with full input validation (card number, expiry date, CVV, cardholder name) as well as a cash on arrival alternative. Successful payments trigger a booking status update in Firestore and display a confirmation receipt to the user.

### 5. 📋 My Bookings Module
A dedicated section within the user profile that displays the full appointment history. Bookings are organized by status and date, allowing users to quickly identify upcoming versus past appointments. Cancellation functionality is available for future bookings, which automatically releases the slot back into the available pool.

### 6. 👤 Profile Module
Manages all user account information. Users can update their display name, phone number, and password from this screen. The profile also serves as a central hub from which users can navigate to their booking history and access account settings including logout.

---

## 🚀 Getting Started

### Prerequisites

Before running this project, ensure you have the following installed:

- Flutter SDK (version 3.0 or above)
- Android Studio (latest stable version)
- Dart SDK (comes bundled with Flutter)
- An Android device or emulator running Android 6.0 (API level 23) or above
- A Firebase project (see Firebase Setup section)
- Git

### Installation Steps

**Step 1 — Clone the repository:**
```bash
git clone https://github.com/alizay21/BlushNBliss.git
cd BlushNBliss
```

**Step 2 — Install Flutter dependencies:**
```bash
flutter pub get
```

**Step 3 — Set up Firebase (see section below)**

**Step 4 — Run the app on a connected device or emulator:**
```bash
flutter run
```

**Step 5 — To build a release APK:**
```bash
flutter build apk --release
```

---

## 🔥 Firebase Setup

> ⚠️ The `google-services.json` and `firebase_options.dart` files are excluded from this repository for security reasons. You must set up your own Firebase project to run the app.

**Step 1** — Go to [Firebase Console](https://console.firebase.google.com/) and create a new project named `BlushNBliss`

**Step 2** — Register an Android app with package name: `com.example.blushnbliss`

**Step 3** — Download the `google-services.json` file and place it at:
```
android/app/google-services.json
```

**Step 4** — Enable the following Firebase services in your project:
- Firebase Authentication (Email/Password provider)
- Cloud Firestore Database
- Firebase Realtime Database (optional)

**Step 5** — Run FlutterFire CLI to generate `firebase_options.dart`:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

**Step 6** — The generated `firebase_options.dart` will be placed automatically in `lib/`

---

## 📁 Project Structure

```
BlushNBliss/
├── android/                    # Android native files
│   └── app/
│       └── src/
├── lib/                        # Main Flutter source code
│   ├── main.dart               # App entry point
│   ├── firebase_options.dart   # Firebase config (gitignored)
│   ├── models/                 # Data models
│   │   ├── user_model.dart
│   │   ├── booking_model.dart
│   │   ├── service_model.dart
│   │   └── payment_model.dart
│   ├── screens/                # UI Screens
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── register_screen.dart
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   ├── booking/
│   │   │   ├── booking_screen.dart
│   │   │   └── booking_summary_screen.dart
│   │   ├── payment/
│   │   │   └── payment_screen.dart
│   │   └── profile/
│   │       └── profile_screen.dart
│   ├── services/               # Firebase service classes
│   │   ├── auth_service.dart
│   │   ├── booking_service.dart
│   │   └── payment_service.dart
│   └── widgets/                # Reusable UI components
├── assets/                     # Images and fonts
├── test/                       # Unit and widget tests
├── pubspec.yaml                # Flutter dependencies
├── .gitignore                  # Git ignore rules
└── README.md                   # This file
```

---

## 🧪 Testing

This project includes a comprehensive manual testing suite covering three levels of testing as part of the Software Quality Engineering (SQE) process:

### Unit Testing
Tests individual functions and input validations in isolation across all modules including email format validation, password strength checks, phone number validation, date selection logic, and card number verification.

### Component Testing
Tests individual UI components and screen elements to verify they render and behave correctly, including form fields, buttons, dropdowns, date pickers, time slot grids, and navigation elements.

### Integration Testing
Tests end-to-end user flows across multiple connected modules, including the complete journey from Registration through Login, Booking, and Payment, as well as session persistence, booking cancellation, and slot conflict handling.

> Refer to the SQE Test Cases document for the complete list of 50+ manual test cases with steps, expected results, and pass/fail status fields.

---

## 🔒 Security

The following security measures are implemented in Blush n Bliss:

- **Firebase credentials** (`google-services.json`, `firebase_options.dart`) are excluded from the repository via `.gitignore`
- **Keystore and signing files** (`*.jks`, `*.keystore`) are never committed to version control
- **Environment variables** and API keys are stored outside the codebase
- **Firebase Authentication** handles all password hashing and user credential storage securely
- **Firestore Security Rules** should be configured to restrict read/write access to authenticated users only
- All sensitive user data is stored securely on Firebase servers with encryption at rest

---

## 🚀 Future Enhancements

The following features are planned for future versions of Blush n Bliss:

- Push notifications for appointment reminders and confirmations
- Staff selection — choose your preferred beautician
- Ratings and reviews system for completed appointments
- Loyalty points and rewards program for repeat customers
- Admin dashboard for salon owners to manage bookings and staff
- Multi-salon support for salon chains and franchises
- In-app chat support between customers and salon staff
- Google and Facebook social login integration
- iOS platform support using Flutter's cross-platform capability
- Dark mode support

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome. Feel free to check the issues page if you want to contribute.

1. Fork the project
2. Create your feature branch: `git checkout -b feature/AmazingFeature`
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`
4. Push to the branch: `git push origin feature/AmazingFeature`
5. Open a Pull Request

---

## 📄 License

This project is developed for academic and educational purposes as part of a Software Quality Engineering course project.

---

## 📬 Contact

**Developer:** Alizay  
**GitHub:** [@alizay21](https://github.com/alizay21)  
**Repository:** [https://github.com/alizay21/BlushNBliss](https://github.com/alizay21/BlushNBliss)

---

<div align="center">
  Made with ❤️ using Flutter & Firebase
  <br/>
  <b>Blush n Bliss</b> — Beauty at your fingertips 💄
</div>
