# Cafe Inventory App (SwiftUI + Firebase)

An iOS application built using SwiftUI and Firebase Firestore to help café managers efficiently manage inventory. The app replaces manual tracking with a structured, scalable system and includes intelligent insights for better decision-making.

---

## 🚀 Overview

This application allows users to:

* Add inventory items
* View all items in one place
* Edit existing records
* Delete items
* Get smart insights on stock levels

The app is designed to be simple, responsive, and practical for real-world usage.

---

## 🧩 Features

### 1. Full CRUD Functionality

* Create: Add items with name, quantity, and supplier
* Read: Display items in a list
* Update: Edit items via a sheet-based UI
* Delete: Remove items instantly from UI and database

---

### 2. Firebase Integration

* Integrated Firebase Firestore for data persistence
* Each item is stored as a document in the `items` collection
* Data remains available across sessions
* Designed for scalability

---

### 3. Smart Insights (AI Feature)

Implemented a lightweight intelligent feature that analyzes inventory data:

* Detects low stock items
* Identifies out-of-stock items
* Provides restocking suggestions

---

### 4. MVVM Architecture

The app follows a clean architecture pattern:

* **View (SwiftUI)** → UI layer
* **ViewModel** → Business logic & state management
* **Service Layer** → Firebase operations

---

### 5. Error Handling

* Prevents empty item inputs
* Validates numeric quantity input
* Displays user-friendly error messages
* Handles Firebase failures gracefully

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
4. Configure Firebase
5. Run the app (iOS 16+)

---

## ⚖️ Engineering Decisions & Challenges (App)

### 1. Asynchronous Data Handling

**Problem:** Firebase operations caused delayed UI updates

**Solution:**

* Used `DispatchQueue.main.async`
* Applied optimistic UI updates

---

### 2. Data Consistency

**Problem:** UI and backend could go out of sync

**Solution:**

* Used unique IDs
* Synced local state after operations

---

### 3. Input Validation

**Problem:** Invalid input could break the app

**Solution:**

* Added validation checks
* Ensured safe data conversion

---

### 4. Stability vs Complexity

**Problem:** More features → more instability

**Decision:**
Focused on stable CRUD + Firebase instead of over-engineering

---

## 🔍 Job URL Extraction Challenge (Task 2)

### Problem

Most job platforms (LinkedIn, Naukri, Indeed) block scraping due to:

* Anti-bot systems
* JavaScript rendering
* Authentication requirements

---

### Initial Attempts

* Used basic HTTP requests
* Tried static HTML parsing

**Result:**

* Blocked requests
* Empty or incomplete data

---

### Approach

A backend-based scraping solution was explored using Python and Scrapling.

* Used headless browser-based fetching
* Applied flexible selectors
* Tested across multiple platforms

---

### Challenges Faced

* LinkedIn requires login and blocks bots
* Naukri detects automated requests
* Dynamic content made static scraping unreliable

---

### Final Solution

Implemented a hybrid approach:

1. Attempt backend scraping
2. If scraping fails → allow manual input
3. Use extracted data for insights

---

### What Is Possible vs Not Practical

#### ✔ Possible

* Scraping less protected sites
* Extracting structured data (JSON-LD)
* Backend scraping with headless browsers

---

#### ⚠️ Limited

* Indeed and partially protected platforms

---

#### ❌ Not Practical

* Reliable LinkedIn scraping without authentication
* Fully automated scraping across all platforms
* Pure iOS-side scraping

---

### Engineering Decision

Instead of building a fragile scraping system, a hybrid approach was chosen to ensure:

* Reliability
* Better user experience
* Real-world applicability

---

### Future Improvements

* Playwright integration
* Proxy rotation
* Structured data extraction

---

## 🚀 Job Scraper (Multi-Site Smart Scraper)

A Python-based scraping system designed to extract structured job data from various job platforms.

---

### Features

* Extract job data from URL
* Smart site detection (Indeed, Naukri, Generic)
* Multi-strategy scraping:

  * JSON-LD
  * CSS selectors
  * Fallback parsing
* Clean structured output

---

### Extracted Data

* Job Title
* Job Description
* Skills
* Salary

---

### Tech Stack (Scraper)

* Python
* Scrapling
* Playwright
* JSON parsing
* Regex

---

### Installation

```bash
python3 -m venv venv
source venv/bin/activate
pip install "scrapling[fetchers]"
playwright install
```

---

## 📌 Note

The `GoogleService-Info.plist` file is not included for security reasons.
Please add your own Firebase configuration file to run the project.

---

## 👨‍💻 Author

Aditya Kumar
