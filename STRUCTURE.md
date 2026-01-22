# Project Structure

```
lib/
├── main.dart                          # Entry point (KEEP ORIGINAL AS BACKUP)
├── main_new.dart                      # New refactored entry point
│
├── config/
│   └── theme.dart                     # Theme configuration & app colors
│
├── widgets/
│   ├── header.dart                    # Header/Navigation component
│   ├── smooth_physics_cursor.dart     # Mouse cursor tracker widget
│   ├── animations.dart                # Reusable animation widgets
│   └── common_widgets.dart            # Badge, Social icons, Text fields
│
├── sections/
│   ├── hero_section.dart              # Hero banner with particles
│   ├── features_section.dart          # Features showcase
│   ├── stats_section.dart             # Stats row component
│   ├── services_section.dart          # Services grid
│   ├── process_section.dart           # 4-step process
│   ├── cta_section.dart               # Call-to-action
│   └── footer.dart                    # Footer component
│
├── animations/
│   └── animations.dart                # All animation classes
│       ├── AnimatedScaleOnHover
│       ├── ScaleAnimation
│       ├── SlideAnimation
│       ├── PulseAnimation
│       └── RotationAnimation
│
└── utils/
    ├── background_painter.dart        # Background texture painter
    ├── constants.dart                 # App-wide constants
    └── helpers.dart                   # Helper functions
```

## To Use the New Structure:

1. Rename current `lib/main.dart` to `lib/main_backup.dart`
2. Rename `lib/main_new.dart` to `lib/main.dart`
3. Test the app to ensure everything works

## Benefits of This Structure:

✅ **Organized & Maintainable** - Each component in its own file
✅ **Reusable** - Easy to import widgets across the app
✅ **Scalable** - Easy to add new sections or features
✅ **Team-Friendly** - Clear file hierarchy for collaboration
✅ **Performance** - Lazy loading of sections
✅ **Testing** - Easy to unit test individual components

## Missing Sections to Complete:

- `sections/stats_section.dart`
- `sections/services_section.dart`
- `sections/process_section.dart`
- `sections/cta_section.dart`
- `sections/footer.dart`
- `utils/constants.dart`
- `utils/helpers.dart`
