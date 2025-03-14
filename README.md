# Flutter Developer Assignment

## 📌 Objective
This Flutter application allows users to view a paginated list of users fetched from an API, add new users with offline support, and navigate to a movie listing screen. The movie list also supports pagination and navigation to a detailed movie screen.

---

## 🎯 Features

### 1️⃣ User List Screen
- Fetches and displays a **paginated list** of users from the API:  
  **GET** `https://reqres.in/api/users?page={page}`
- Displays first name, last name, and avatar image.
- Implements **infinite scroll** pagination.
- Clicking on a user navigates to the **Movie List Screen**.

### 2️⃣ Add User Functionality
- Floating action button (**FAB**) to add a new user.
- User creation screen allows input for **name** and **job**.
- **Online Mode**: Immediately posts user data to the API:  
  **POST** `https://reqres.in/api/users`  
  **Request JSON:**
  ```json
  {
    "name": "morpheus",
    "job": "leader"
  }
  ```
- **Offline Mode**: Saves data locally using **Drift (SQLite) or Hive**.
- Uses **WorkManager** to sync offline data once the device regains internet connectivity.
- Updates the local database with the newly assigned **user ID** after syncing.

### 3️⃣ Movie List Screen
- Navigates from User List Screen to fetch **trending movies**.
- Uses API:
  **GET** `https://api.themoviedb.org/3/trending/movie/day?language=en-US&page={page}&api_key=YOUR_API_KEY`
- Displays each movie's **poster image, title, and release date**.
- Implements **infinite scroll** pagination.
- Clicking on a movie navigates to the **Movie Detail Screen**.

### 4️⃣ Movie Detail Screen
- Fetches movie details using API:
  **GET** `https://api.themoviedb.org/3/movie/{movie_id}?api_key=YOUR_API_KEY`
- Displays **movie title, description, release date, and poster image**.
- Uses `http://image.tmdb.org/t/p/w185/{poster_path}` to load movie images.

---

## ⚙️ Technical Stack
- **State Management:** Provider, Riverpod, Bloc, or Cubit
- **Dependency Injection:** get_it or Riverpod
- **Networking:** Dio or http
- **Local Storage:** Drift (SQLite) or Hive
- **Offline Handling:** WorkManager plugin for background sync
- **Pagination:** Infinite Scroll or PagedListView
- **Asynchronous Data Handling:** Streams, Riverpod, or Bloc
- **Image Loading:** CachedNetworkImage

---

## 🚀 Setup Instructions
### Prerequisites
- Flutter installed ([Installation Guide](https://flutter.dev/docs/get-started/install))
- TMDB API Key ([Get API Key](https://www.themoviedb.org/settings/api))

### Steps to Run the Project
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/flutter-assignment.git
   cd flutter-assignment
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Add your **TMDB API Key** in the relevant API requests.
4. Run the app:
   ```sh
   flutter run
   ```

---

## 📂 Project Structure
```
lib/
│── core/
│   ├── common/
│   ├── network/
│   ├── database/
│── features/
│   ├── users/
│   │   ├── data/
│   │   ├── presentation/
│   ├── movies/
│   │   ├── data/
│   │   ├── presentation/
│── main.dart
```

---

## 📜 Assumptions & Considerations
- **Offline Handling:** Uses WorkManager for syncing data when the device regains internet connectivity.
- **Performance Optimization:** Uses caching for images with `CachedNetworkImage`.
- **Best Practices:** Implements clean architecture and follows Flutter development standards.

---

## 🏆 Evaluation Criteria
- ✅ Correctness and completeness of implemented features.
- ✅ Adherence to best practices and architectural patterns.
- ✅ Code quality, readability, and documentation.
- ✅ Handling of edge cases and error scenarios.
- ✅ User experience and UI design considerations.

---

## 📩 Submission
- 📎 **GitHub Repository:** https://github.com/vineeshjohnson/machine_task
- 📜 **Include this README.md** in the repository.
- 📧 Contact for further clarifications.

**Happy Coding! 🚀**

