# A VIPER Architecture Sample (SwiftUI)

This sample project demonstrates VIPER architecture applied to SwiftUI, for learning and exploration purposes. It’s meant to illustrate modular, testable, and scalable design in iOS apps.

## 📱 Features

- Loads a list of movies from a local JSON file.
- Displays movie titles in a scrollable list.
- Navigates to a detailed view when a movie is selected.

## 🧱 Architecture

This app is built using the **VIPER** design pattern, which separates concerns across:

- **View** – SwiftUI views that handle UI.
- **Interactor** – Handles business logic and data fetching.
- **Presenter** – Processes data from the Interactor and prepares it for display.
- **Entity** – Basic data models (e.g., `Movie`).
- **Router** – Handles navigation and routing logic.

