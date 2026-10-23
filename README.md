# SSW3307 Lab

A new Flutter project.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (Dart 3.13+)
- Android Studio / Xcode (for mobile emulators/simulators) or Google Chrome / Edge (for web)

---

## 1. Clone the Project

```bash
git clone https://github.com/xiaotiangou3/SSW3401-Lab.git
cd SSW3401-Lab
```

Install dependencies:

```bash
flutter pub get
```

---

## 2. Run on Emulators / Simulators

1. Check available emulators and devices:
   ```bash
   flutter devices
   flutter emulators
   ```

2. Launch an emulator (if not already opened):
   ```bash
   flutter emulators --launch <emulator_id>
   ```

3. Run the app:
   ```bash
   flutter run -t lib/<LAB_FOLDER_NAME>/main.dart
   ```
   *(Or specify the target device directly: `flutter run -d <device_id>`)*

---

## 3. Run in Web Browsers

Run the app in Google Chrome:

```bash
flutter run -d chrome -t lib/<LAB_FOLDER_NAME>/main.dart
```

Or in Microsoft Edge:

```bash
flutter run -d edge -t lib/<LAB_FOLDER_NAME>/main.dart
```

