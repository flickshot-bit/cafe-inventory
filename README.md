# Cafe Inventory App (SwiftUI + Firebase)

A production-style iOS application built using SwiftUI and Firebase Firestore to help café managers efficiently track and manage inventory.

This app replaces manual tracking with a structured, scalable, and intelligent system that supports full CRUD operations and proactive decision-making through smart insights.

---

## 🚀 Overview

The application allows users to:

* Add new inventory items
* View all items in a structured list
* Edit existing entries
* Delete items no longer needed
* Get intelligent stock insights (low stock / out-of-stock alerts)

The goal was to design a simple yet practical system that mirrors real-world usage while maintaining clean architecture and scalability.

---

## 🧩 Features

### 1. Full CRUD Functionality

* Create: Add items with name, quantity, supplier
* Read: Display inventory in real-time
* Update: Edit item details via sheet-based UI
* Delete: Remove items with immediate UI updates

---

### 2. Firebase Integration

* Integrated Firebase Firestore for persistent storage
* Each item is stored as a document in the `items` collection
* Data persists across sessions and devices
* Structured data model ensures consistency and scalability

---

### 3. Smart Insights (AI Feature)

Implemented a lightweight intelligent system that analyzes inventory levels and provides actionable insights:

* Detects low stock conditions
* Identifies out-of-stock items
* Provides proactive restocking suggestions

This feature improves usability by surfacing important information without requiring manual checks.

---

### 4. MVVM Architecture

The app follows a clean separation of concerns:

* **View (SwiftUI)** → UI rendering
* **ViewModel** → business logic & state management
* **Service Layer** → Firebase communication

This structure improves maintainability, testability, and scalability.

---

### 5. Error Handling

Basic safeguards were implemented to ensure a stable user experience:

* Prevents empty item names
* Validates numeric input for quantity
* Displays user-friendly error messages
* Handles Firebase operation failures gracefully

---

## 🛠 Tech Stack

* SwiftUI
* Firebase Firestore
* Combine
* MVVM Architecture

---

## ⚙️ Setup Instructions

1. Clone the repository
2. Open the project in Xcode
3. Add your own `GoogleService-Info.plist`
4. Ensure Firebase is configured correctly
5. Build and run on simulator or device (iOS 16+)

---

## 🧠 Challenges & Solutions

### 1. Asynchronous State Management

**Challenge:**
Handling UI updates alongside Firebase async operations caused inconsistencies.

**Solution:**

* Used `DispatchQueue.main.async` to ensure UI updates happen on the main thread
* Applied optimistic UI updates for better responsiveness

---

### 2. Data Consistency Between UI and Firebase

**Challenge:**
Ensuring UI reflects backend state accurately after operations like delete/update.

**Solution:**

* Implemented ID-based updates and deletions
* Synced local state with Firebase responses

---

### 3. Input Validation

**Challenge:**
User inputs could lead to crashes or invalid states.

**Solution:**

* Added guards for empty fields
* Enforced numeric validation for quantity

---

### 4. Feature Prioritization vs Stability

**Challenge:**
Balancing additional features with app stability.

**Solution:**

* Focused on delivering stable CRUD + Firebase integration
* Ensured smooth UX before adding enhancements

---

## 📈 Possible Improvements

* Real-time Firestore listeners (live sync)
* Search and filter functionality
* Supplier analytics and tracking
* Advanced AI (predictive demand using historical data)
* Firebase Authentication

---

## 👨‍💻 Author

Aditya Kumar

---

## 📌 Note

The `GoogleService-Info.plist` file is not included for security reasons.
Please add your own Firebase configuration file to run the project.
