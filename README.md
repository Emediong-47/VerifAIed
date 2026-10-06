# VerifAIed

### AI-Aided KYC Verification

**VerifAIed** is a Flutter-based mobile application designed to simplify and improve the **Know Your Customer (KYC)** verification process using Artificial Intelligence and mobile device capabilities.

The application guides users through a structured identity verification process, from providing personal information and selecting an identity document to document scanning, liveness verification, and facial verification.

## ✨ Features

* **Personal Information Collection** – Collects essential user details required for identity verification.
* **Identity Document Verification** – Allows users to select and capture supported identity documents.
* **AI-Powered Document Processing** – Uses machine learning capabilities to analyse and extract information from identity documents.
* **Liveness Detection** – Guides users through facial movements such as looking up, looking down, turning right, turning left, and smiling to help determine whether the verification is being performed by a live person.
* **Face Verification** – Captures and verifies the user's face as part of the identity verification process.
* **Verification Result** – Presents the outcome of the verification process to the user.
* **Personalised User Experience** – Provides a personalised welcome experience after successful verification.
* **Stay Signed In** – Keeps the verified identity on the device so returning users go straight to their welcome page, with a log out option to start the process again.

## 🛠️ Technologies Used

* **Flutter & Dart** – Cross-platform mobile application development.
* **SQLite (sqflite)** – On-device persistence of the verified identity.
* **Google ML Kit** – Machine learning capabilities for mobile-based document and face-related processing.
* **BLoC** – State management and separation of application logic from the user interface.
* **AutoRoute** – Type-safe navigation and route management.
* **Domain-Driven Design (DDD)** – Organises the application around clear domain and business concepts.
* **AI/ML Technologies** – Used to support intelligent identity verification features.

## 🔄 Verification Flow

The application follows a structured KYC verification process:

```text
Welcome
   ↓
Personal Information
   ↓
Select Identity Document
   ↓
Capture/Scan Document
   ↓
Document Verification
   ↓
Liveness Detection
   ↓
Face Verification
   ↓
Verification Result
   ↓
Personalised Welcome
   ↓
Log Out (returns to Welcome)
```

## 🏗️ Architecture

VerifAIed is structured using principles of **Domain-Driven Design (DDD)** to promote separation of concerns, maintainability, scalability, and testability.

The application is organised around key layers such as:

* **Domain** – Contains core business logic and entities.
* **Application** – Handles application-specific logic and state management.
* **Infrastructure** – Handles external services, APIs, the SQLite database, and other implementations.
* **Presentation** – Contains screens, widgets, and user interface components.

## 🎯 Project Goal

The goal of VerifAIed is to demonstrate how **AI and mobile technologies can be integrated into a practical KYC workflow** to make identity verification more structured, accessible, and efficient.

The project serves as a demonstration of integrating Flutter mobile development, AI/ML capabilities, document processing, facial verification, and modern software architecture into a single application.

## 🚀 Getting Started

### Prerequisites

Before running the project, ensure you have:

* Flutter SDK installed
* Dart SDK installed
* Android Studio or another Flutter-compatible IDE
* An Android device or emulator (Android 8.0 / API 26 or later), or an iPhone running iOS 15.5 or later

### Installation

Clone the repository:

```bash
git clone https://github.com/Emediong-47/VerifAIed
```

Navigate into the project:

```bash
cd verifAIed
```

Install the dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## 📱 Project Status

VerifAIed is an ongoing project focused on exploring the practical integration of **Artificial Intelligence into mobile application development**, particularly in identity and KYC verification workflows.

## 👨‍💻 Author

**Emediong Uyobong Eshiet**

Computer Science Student
University of Uyo

---

### VerifAIed

**Verify smarter. Verify with confidence.**
