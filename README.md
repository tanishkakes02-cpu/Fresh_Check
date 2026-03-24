# FreshCheck

**FreshCheck** - Never let anything expire again! 

A beautiful Flutter mobile app that helps you track expiration dates of your items (food, medicine, cosmetics, documents, etc.) with an intuitive dark UI and smart filtering system.

## Features

- 🌟 **Animated Splash Screen** - Smooth fade-in animation on app launch
- 📦 **Item Management** - Add, view, and delete items with ease
- 🏷️ **Multiple Categories** - Organize items by Food, Medicine, Document, Cosmetics, Dairy, and Other
- 📊 **Summary Cards** - Quick overview of expired, expiring soon, and safe items
- 🔘 **Smart Filtering** - Filter items by status: All, Expired, This Week, Safe
- 🎨 **Dark Theme** - Modern dark UI with cyan accents for a pleasant viewing experience
- 📅 **Date Picker** - Easy date selection for expiry dates
- 🚨 **Status Indicators** - Color-coded status (Red for expired, Orange for 3+ days, Yellow for 7+ days, Green for safe)
- ⚡ **Real-time Updates** - Instant UI updates when items are added or deleted

## Project Structure

```
freshcheck/
├── lib/
│   └── main.dart           # Main app file with all screens and logic
├── pubspec.yaml            # Project dependencies and metadata
├── analysis_options.yaml   # Dart linter configuration
├── .gitignore              # Git ignore rules
└── README.md               # This file
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. Clone or navigate to the project directory:
   ```bash
   cd freshcheck
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Building for Release

**Android:**
```bash
flutter build apk
flutter build appbundle
```

**iOS:**
```bash
flutter build ios
```

**Web:**
```bash
flutter build web
```

## Screens

### 1. Splash Screen
- Animated fade-in effect
- 3-second delay before navigating to home
- FreshCheck branding with icon and tagline

### 2. Home Screen
- **Top AppBar** - Shows app title and total item count
- **Summary Cards** - Display counts for Expired, Expiring Soon, and Safe items
- **Filter Chips** - Quick filter by All, Expired, This Week, and Safe
- **Item List** - Scrollable list with status indicators and delete option
- **Floating Action Button** - Opens bottom sheet to add new items

### 3. Add Item Bottom Sheet
- Item name input field
- Category dropdown (Food, Medicine, Document, Cosmetics, Dairy, Other)
- Date picker for expiry date
- Add button to confirm

## Item Model

Each item stores:
- `name` - Item name (e.g., "Milk")
- `expiryDate` - DateTime of expiration
- `category` - Category type (Food, Medicine, etc.)

### Computed Properties

- `daysLeft` - Days remaining until expiration
- `statusColor` - Color based on expiration status
- `statusText` - Human-readable status text
- `icon` - Icon based on category

## Code Highlights

### Item Status Logic
```dart
Color get statusColor {
  if (daysLeft < 0) return Colors.red;
  if (daysLeft <= 3) return Colors.orange;
  if (daysLeft <= 7) return Colors.yellow;
  return Colors.green;
}
```

### Filtering Items
```dart
List<Item> get filteredItems {
  List<Item> sorted = [...items]..sort((a, b) => a.daysLeft.compareTo(b.daysLeft));
  switch (selectedFilter) {
    case 'Expired': return sorted.where((i) => i.daysLeft < 0).toList();
    case 'This Week': return sorted.where((i) => i.daysLeft >= 0 && i.daysLeft <= 7).toList();
    case 'Safe': return sorted.where((i) => i.daysLeft > 7).toList();
    default: return sorted;
  }
}
```

## Customization

### Theme Colors
- Primary Dark: `#1A1A2E`
- Card Background: `#2A2A3E`
- Accent: `Colors.cyanAccent`

To change colors, edit the color values in `lib/main.dart`:
```dart
backgroundColor: Color(0xFF1A1A2E)  // Main background
backgroundColor: Color(0xFF2A2A3E)  // Card background
```

### Adding More Categories
Edit the `categories` list in `_HomeScreenState`:
```dart
final List<String> categories = ['Food', 'Medicine', 'Document', 'Cosmetics', 'Dairy', 'Other', 'NewCategory'];
```

Then add the icon mapping in the `Item` class:
```dart
case 'NewCategory': return Icons.your_icon;
```

## Dependencies

- **flutter** - UI framework
- **cupertino_icons** - iOS-style icons

## Future Enhancements

- Local database persistence (using `sqflite` or `hive`)
- Push notifications for expiring items
- Export/import items as CSV
- Multi-language support
- Cloud sync functionality
- Item photos/barcodes
- Item templates for quick addition
- Categories customization
- Dark/Light theme toggle

## License

This project is open source and available under the MIT License.

## Support

For issues, feature requests, or contributions, feel free to open an issue or submit a pull request.

---

**Happy tracking! Never let anything expire again! 🎉**
