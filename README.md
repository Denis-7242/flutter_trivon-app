## 🎯 Flutter & Dart Quiz Challenge

Beautiful, modern, and responsive quiz app built with Flutter. Soft dark theme, elegant gradients, delightful micro-interactions, and a smooth 15s per-question timer for an engaging learning experience.

<div align="center">

  <!-- Badges -->
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" />
  <img alt="Dart" src="https://img.shields.io/badge/Dart-2.x-0175C2?logo=dart&logoColor=white" />
  <img alt="Platform" src="https://img.shields.io/badge/Platforms-Android%20|%20iOS%20|%20Web-6B73FF" />
  <img alt="PRs" src="https://img.shields.io/badge/PRs-welcome-brightgreen" />

</div>

---

### ✨ Highlights
- **Softer dark theme**: Deep background, gentle accent colors, and high-contrast text.
- **Lovely UI components**: Rounded cards with subtle gradients, borders, and soft shadows.
- **Answer feedback**: Clear visual states for correct/incorrect selections.
- **Active timer (15s)**: Auto-advances when time runs out, pauses on selection, resets on next question.
- **Smooth transitions**: Page fades and scale transitions for navigation.
- **Accessible typography**: Balanced sizes and weights for readability.

---

### 🖼️ Screens
- **Start Screen**: Play CTA, quiz metadata, and intro.
- **Quiz Screen**: Category, question, answers, top progress, and per-question timer.
- **Results Screen**: Final score, percentage, performance message, and actions.

---

### 🧠 Features (What was implemented)
- **Color System** (`lib/colors.dart`)
  - Soft, muted palette: deep background, purple-blue accents, teal/coral feedback.
  - Secondary text color for hierarchy and reduced brightness.

- **Global Theme** (`lib/main.dart`)
  - Dark theme with modern typography, improved button themes, and outlined styles.

- **Start Screen** (`lib/screens/start_screen.dart`)
  - Clean hero icon, stacked title, quiz count, and smooth transition to the quiz.

- **Quiz Screen** (`lib/screens/quiz_screen.dart`)
  - Question card with gradient surface, border, and depth shadow.
  - Enhanced answer rows with letter chips, improved spacing, and clear feedback icons.
  - Top progress bar for overall progression.
  - ⏱️ **15-second countdown timer per question**:
    - Starts on load and on each question change.
    - Pauses when an answer is selected; resumes for the next question.
    - Auto-advances on timeout; finishes to results at the end.

- **Result Screen** (`lib/screens/result_screen.dart`)
  - Gradient score card, performance message, and primary actions (Home/Retake).

- **Data Model** (`lib/models/question_model.dart`)
  - `Question` model with category, text, options, and correct index + sample data.

---

### 🗂️ Project Structure
```
lib/
  colors.dart                # Centralized color palette
  main.dart                  # App root, theme, MaterialApp
  models/
    question_model.dart      # Question model + sample data
  screens/
    start_screen.dart        # Landing with Play CTA
    quiz_screen.dart         # Core quiz flow + 15s timer
    result_screen.dart       # Score summary and actions
  widgets/
    answer_button.dart       # Styled answer row widget
    icon_container.dart      # Decorative icon container
```

---

### 🚀 Getting Started

#### 1) Prerequisites
- Flutter SDK installed (`flutter --version`)
- Device/emulator set up (Android/iOS) or a web browser for web

#### 2) Install dependencies
```bash
flutter pub get
```

#### 3) Run the app
```bash
# Android / iOS
flutter run

# Web
flutter run -d chrome
```

#### 4) Build (optional)
```bash
# Android APK
flutter build apk --release

# Web release
flutter build web --release
```

---

### 🧪 Tips for Testing
- Select an answer and watch the UI feedback change instantly.
- Wait 15 seconds without answering to see auto-advance behavior.
- Use Previous / Skip to confirm timer resets appropriately.
- Finish the quiz to see the final score and percentage.

---

### 🙌 Author
- **Denis** — [GitHub: Denis-7242](https://github.com/Denis-7242)

If this project helped you, consider starring the repo!

---

### 📄 Notes
- Built with Flutter and Dart using a soft, accessible dark theme.
- Designed with maintainable components and a simple model-driven flow.

---

### ❤️ Footer
made with love ❤️ by Denis
