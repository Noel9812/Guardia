# Guardia - Women’s Safety App

**Guardia** is a Flutter-based mobile application designed to enhance women’s safety by incorporating real-time monitoring features. The app detects emergencies through fall detection, loud noise detection, and triggers automated responses like video/audio recording, location sharing, and AI-generated incident reports with emergency contacts. The primary goal is to provide quick and effective assistance during potentially dangerous situations.

## Project Overview

**Guardia** uses a combination of sensors, local storage, and background services to ensure the app continues monitoring for emergencies even when not in active use. With the integration of an AI model for incident report generation, users get a comprehensive summary of the event based on recorded data. Additionally, features like Geo-fencing, offline emergency mode, and threat detection make the app robust in safeguarding users.

## Features

### 1. **Real-time Location Sharing with Geo-fencing**
- The app provides real-time location sharing, allowing users to keep their trusted contacts updated on their location.
- **Geo-fencing** enables setting a virtual perimeter for the user, and the app sends an alert if the user moves outside the defined boundary.

### 2. **Panic Gesture Activation**
- Guardia allows users to trigger emergency mode using a simple panic gesture.
- This feature enables discreet activation in situations where interacting with the phone might not be possible.

### 3. **Incident Documentation Mode**
- Once an emergency is triggered, the app automatically captures and stores incident-related evidence.
- Guardia records audio and video every 30 seconds and secures the data in local encrypted storage.

### 4. **Offline Emergency Mode**
- The app is capable of functioning in offline mode. If there’s no internet connection, the app will still monitor the user’s environment, store data, and send SMS alerts when necessary.
- All collected data is stored securely on the device and is transmitted as soon as connectivity is restored.

### 5. **Threat Detection**
- **Guardia** monitors for external threats such as sudden loud noises or irregular movements.
- When a threat is detected, the app activates emergency mode, notifying the user’s emergency contacts and documenting the situation.

### 6. **Video Evidence Generation**
- In addition to audio recordings, Guardia captures video evidence at regular intervals once an emergency is triggered.
- The videos are securely stored locally and encrypted to prevent unauthorized access.

### 7. **Map and Emergency Services**
- The app integrates a mapping feature to show nearby emergency services like hospitals, police stations, and safe spaces.
- This feature enables users to quickly navigate to a safe place in times of emergency.

### 8. **Fall Detection**
- The app monitors the phone’s accelerometer to detect rapid changes in movement that may indicate a fall.
- If a fall is detected, Guardia triggers an emergency response that includes:
  - Sending an SMS alert to pre-configured emergency contacts, including the user's real-time location.
  - Initiating audio and video recording at 30-second intervals to document any incident.
  - Continues monitoring without user intervention, allowing help to be summoned without the user needing to take action.

### 9. **Noise Detection**
- Guardia listens for loud, sudden noises such as screams or crashes, which may indicate an emergency.
- When the noise level surpasses a pre-defined threshold, the app activates emergency mode:
  - Sends an SMS to emergency contacts with the user’s location.
  - Begins recording audio and video to capture the surroundings during the noise event.
  - Works in the background, ensuring the app can detect sounds even when minimized or the phone is locked.

### 10. **Location Tracking**
- The app captures the user’s current location when an emergency is triggered and includes the GPS coordinates in the SMS alert.
- Location data is continuously updated at 30-second intervals during the emergency, ensuring responders can accurately track the user’s movements.
- Guardia ensures that location data is stored securely on the device using encrypted local storage to protect the user’s privacy.

### 11. **Emergency Mode**
- When either fall detection or noise detection is triggered, Guardia enters **Emergency Mode**. This mode activates:
  - Continuous location tracking, audio, and video recording every 30 seconds to document the situation.
  - All media files (audio and video) are stored securely on the device, encrypted using **Flutter Secure Storage**.
  - SMS alerts are automatically sent to emergency contacts, providing updates on the user's situation without the need for interaction.

### 12. **SMS Alerts**
- Guardia sends automated SMS alerts to pre-configured emergency contacts in case of a detected fall or loud noise.
  - The SMS includes the user’s real-time location and a message indicating an emergency.
  - The app sends periodic location updates via SMS as long as Emergency Mode is active.
- This feature ensures that help can be summoned quickly, even if the user is incapacitated or unable to use their phone.

### 13. **Tiny Llama Model for Incident Report Generation**
- **Guardia** uses an **AI-powered Tiny Llama model** that has been optimized using **Intel’s OpenVINO toolkit** to generate incident reports based on captured data (audio, video, and location).
- This AI model processes the data collected during an emergency and automatically generates a detailed incident report that summarizes the key events. The generated report helps responders and emergency contacts better understand the context of the situation.
- The Tiny Llama model is lightweight, making it suitable for mobile devices without consuming too many resources.
- The AI runs locally on the device, ensuring that no sensitive data is sent to the cloud, thus preserving the user’s privacy.

### 14. **Background Services**
- Guardia runs critical services in the background to ensure uninterrupted monitoring of the user’s environment:
  - Fall detection and noise detection continue even when the app is not in use or when the phone is locked.
  - The app utilizes Android’s **Foreground Service** to maintain background activity.
  - The app also resumes monitoring after device reboots to ensure continuous protection.

### 15. **Local Storage Security**
- All data (audio, video, and location information) is stored securely on the device, encrypted using **Flutter Secure Storage**.
- No cloud storage is used in the initial implementation to protect the user’s privacy and ensure data remains under the user’s control.
- Only the user can access this data, ensuring that sensitive information such as location or media is protected from unauthorized access.


- ![Starting](https://github.com/user-attachments/assets/5ff5bfe1-f1fe-495a-a777-934890b07c18)
![about](https://github.com/user-attachments/assets/456f74ac-dfc2-468a-a131-99bf186967ae)
- ![home](https://github.com/user-attachments/assets/6a9b61bc-bdc3-4449-b3e6-7bddd022ff4a)

## Technology Stack

- **Flutter**: The cross-platform mobile app framework for building the UI and app logic.
- **Dart**: Programming language used for building the app’s core functionalities.
- **Sensors Plus**: Used to access the phone's accelerometer data for detecting falls.
- **Microphone**: Captures audio for noise detection and during emergency mode.
- **Flutter Sound**: Handles audio recording during noise detection and emergency mode.
- **Geolocator**: Provides real-time location tracking for sharing the user’s position during an emergency.
- **Flutter SMS**: Sends SMS alerts to emergency contacts with critical information, such as the user’s location.
- **Path Provider**: Used for accessing and storing files such as video and audio securely on the device.
- **Flutter Secure Storage**: Ensures that all sensitive data, including media and location logs, is stored securely with encryption.
- **Tiny Llama Model**: AI model used for generating detailed incident reports based on the data collected during emergencies.
- **OpenVINO**: Optimizes the Tiny Llama model for running efficiently on mobile devices, ensuring fast and accurate report generation.
- **Background Fetch**: Keeps the app running in the background to ensure continuous monitoring for fall and noise detection.

---

This README now includes a detailed explanation of the Guardia project and its features.
This project is developed as part of Intel Gen-AI HAckathon by our team Pixelates.
