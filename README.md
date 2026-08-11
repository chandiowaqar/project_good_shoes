# Good Shoes 👟 - E-Commerce Flutter Application

A fully interactive, multi-screen e-commerce mobile application built with Flutter. This project was developed as the capstone mini-project for the Mobile App Development course under the BBSHRRDB initiative. 

It serves as a comprehensive frontend prototype demonstrating modern mobile UI/UX principles, state management concepts, and strict form validation.

## 🚀 Features

* **Complete User Journey:** Includes Onboarding, Registration, Login, Product Browsing, Cart Management, and a secure Checkout flow.
* **Modern UI/UX Architecture:** 
  * Responsive, full-screen scrollable dashboard.
  * Floating product cards with dynamic image scaling.
  * Signature deep orange accent theme for clear Call-to-Action (CTA) hierarchy.
* **Interactive State:** Fully functional mock state for the Shopping Cart and Favorites system.
* **Robust Form Validation:** Utilizes `GlobalKey<FormState>` and Regular Expressions (Regex) to securely validate 16-digit credit card numbers, MM/YY expiry formats, and user authentication fields.

## 📱 Demo

> **Note to viewer:** Check out the side-by-side video demonstration below showing the live code execution alongside the functional application.

*[Insert link to your side-by-side video or add a GIF here]*

## 🛠️ Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **Design Pattern:** Material Design principles with custom UI components.

## 📂 Project Structure

**Core & Navigation**
* `main.dart`: The primary entry point and configuration for the Flutter application.
* `onboarding.dart`: Initial welcome screens introducing the app's features to new users.
* `dashboard.dart`: The core scrollable storefront featuring category filtering and a responsive product grid.
* `custom_nav_bar.dart`: A modular, reusable bottom navigation widget keeping the UI codebase DRY.
* `custom_drawer.dart`: A reusable side navigation menu for extended app options.

**Authentication & User Management**
* `loginPage.dart` & `register.dart`: User authentication and entry flow with form validation.
* `profile.dart`: User profile interface and account settings.
* `user_data.dart`: Data models and mock backend logic handling user session details.

**Products & Browsing**
* `product_page.dart`: Detailed view of individual items with interactive image galleries and size selection.
* `categories.dart` & `brand_products.dart`: Dedicated screens for browsing specific shoe brands and filtered categories.
* `favorites.dart` & `favorites_data.dart`: UI and state management for tracking the user's saved items.

**Cart & Checkout Flow**
* `cart_page.dart` & `cart_data.dart`: Shopping cart interface and internal state management for order totals.
* `buy_now_page.dart`: Streamlined direct-purchase screen for quick checkouts.
* `checkout.dart`: Secure order management and strictly validated payment processing screen.
* `order_placed.dart`: Final order confirmation and success screen.
## 🧑‍💻 About the Developer

Developed by **Waqar Ali**, a computer science and engineering student at the University of Sindh. This project represents the culmination of my first two months diving into the Flutter and Dart ecosystem. 

* **LinkedIn:** www.linkedin.com/in/chandiowaqar
* **GitHub:** https://github.com/chandiowaqar

## ⚙️ How to Run

1. Clone the repository: `git clone [Your Repository URL]`
2. Navigate to the project directory: `cd good_shoes`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`
