# soulee
Task From Soulee
## Features

- ✅ **User Feed Display**: Posts are fetched from Firebase Firestore in real-time.
- ✅ **Like/Comment Feature**:  
  - Like button updates the like count instantly.  
  - Comment section is currently a placeholder.
- ✅ **Post Detail Navigation**: Tapping a post navigates to a detailed view page.
- ✅ **Add New Post**: A Floating Action Button (FAB) opens a dummy post form Page .

## Places That Can Be Improved

-  **Navigation**: Currently uses basic `Navigator.push`. Consider migrating to `go_router` for cleaner, declarative, and URL-based routing.
-  **Firebase Functions Usage**: Explore Firebase Cloud Functions for tasks like automating notifications, handling likes/comments logic, or validating data server-side.
- **Security Rules**: Improve Firestore security rules to ensure only authenticated users can read/write specific data.
- **Validation & Error Handling**: Enhance input validation and display error messages gracefully across forms and network actions.
- **Dependency Injection**: For better scalability and testability, use a DI framework like `get_it` or integrate with `Riverpod` for service injection in production.

## How to Install

Follow the steps below to run this Flutter project locally:

### 1. Clone the repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```
### 2. Install dependencies
```bash 
flutter pub get
```
### 3. Run the app

``` bash 
flutter run

```
## Install Apk 
[Download](https://drive.google.com/file/d/1B8_248MIK1cAwtyyLmBZLVN5B6srIZP7/view?usp=sharing)


# Discussion 
There are few small adjustment needed to be complete this. Due to shortage of time i am over looking those. but in a more production based application these are important. The focus of to build a good base of the project so that i can be build upon later in a more production level environment

Make with <3 by Saif
 
