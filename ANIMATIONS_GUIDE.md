# Quick Reference: Animation Components

## Visual Guide

### 1. Cursor Tracking Animation
**What**: Orange glow that follows your cursor
**Where**: Entire page background
**Trigger**: Mouse movement
**Effect**: Smooth, continuous animation

```
🖱️ Cursor Position
    ↓
CursorTrackingBackground (Updates 60x per second)
    ↓
_CursorTrackingPainter (Draws dual-layer glow)
```

---

### 2. Hero Section Animations
**What**: Hero container and content fade in and scale up
**Duration**: 1.2 seconds
**Trigger**: Page load
**Order**:
1. Hero scales from 92% → 100%
2. Text slides up from 22px down
3. Image card scales in after 300ms

```
Animation Timeline:
0ms ──── 600ms ──── 900ms ──── 1200ms
│         │         │         │
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
Scale    Fade     Slide    Complete
```

---

### 3. Hero Image Animations
**What**: Image floats and tilts continuously
**Patterns**:
- **Tilt**: ±0.015 radians (subtle 3D effect)
- **Float**: ±8 pixels vertical
- **Duration**: 1.5 seconds (repeats)
- **Easing**: Sine waves (smooth, natural)

---

### 4. Background System
**Layers** (front to back):
1. **Cursor Glow** (interactive, follows mouse)
2. **Enhanced Texture** (static, decorative circles)
3. **Gradient** (base, creates depth)

---

## Using Animation Helpers

### ScaleAnimation
```dart
ScaleAnimation(
  delay: Duration(milliseconds: 300),
  child: MyWidget(),
)
```
- Bouncy scale-in (elastic easing)
- Perfect for: Cards, buttons, emphasis

### SlideAnimation
```dart
SlideAnimation(
  delay: Duration(milliseconds: 500),
  direction: Axis.vertical, // or Axis.horizontal
  child: MyWidget(),
)
```
- Slide + fade (simultaneous)
- Perfect for: Text, CTAs, notifications

### PulseAnimation
```dart
PulseAnimation(
  child: MyWidget(),
)
```
- Continuous pulse (1.0 → 1.05)
- Perfect for: Stats, metrics, important elements

### RotationAnimation
```dart
RotationAnimation(
  duration: Duration(milliseconds: 3000),
  child: MyWidget(),
)
```
- Smooth 360° rotation
- Perfect for: Loaders, decorative elements

---

## Color Palette Used

| Color | Hex | Usage |
|-------|-----|-------|
| Primary Orange | `#F97316` | CTA, highlights, cursor glow |
| Secondary Orange | `#FF6B35` | Accent circles, secondary glows |
| Tertiary Orange | `#FF8C42` | Background accents |
| Navy Blue | `#0E1B2C` | Text, professional tone |
| Light Cream | `#FFEDD5` | Background gradients |

---

## Performance Tips

✅ **Good**:
- Use animation helpers for new effects
- Keep durations in 600-1200ms range
- Combine animations (scale + fade together)

❌ **Avoid**:
- Long animation durations (>2 seconds)
- Too many simultaneous animations
- Animating large images without proper optimization

---

## Testing the Animations

### To see cursor tracking:
1. Run: `flutter run -d chrome`
2. Move mouse across the page
3. See orange glow follow your cursor

### To see hero animations:
1. Run the app
2. Watch hero section animate on page load
3. See image card float and tilt continuously

### To adjust animation timing:
Edit these values in the state classes:
```dart
Duration(milliseconds: 1200) // Change this number
```

---

## Responsive Behavior

| Device | Cursor Tracking | Animations | Status |
|--------|-----------------|-----------|--------|
| Desktop | ✅ Full | ✅ All active | Optimal |
| Tablet | ✅ Touch | ✅ All active | Good |
| Mobile | ⚠️ Limited | ✅ All active | Works |
| Slow Network | ✅ | ⚠️ May skip | Graceful |

---

## Browser Compatibility

- ✅ Chrome/Edge (best performance)
- ✅ Firefox (full support)
- ✅ Safari (full support)
- ⚠️ Mobile browsers (cursor tracking limited)

---

## Debug Mode

View animation details:
```dart
// Add to main.dart temporarily
debugPrintBeginFrameBanner = true;
debugPrintEndFrameBanner = true;
```

This shows FPS and animation performance in console.

---

## File Structure

```
lib/main.dart
├── ShubhamDigitalMarketingApp
├── LandingPage (StatefulWidget - cursor tracking)
├── EnhancedBackgroundTexture
├── CursorTrackingBackground
├── HeroSection
│   └── _HeroImageCard (with float + tilt)
├── ScaleAnimation (helper)
├── SlideAnimation (helper)
├── PulseAnimation (helper)
└── RotationAnimation (helper)
```

---

## Quick Customization

### Change cursor glow color:
```dart
// In _CursorTrackingPainter
paint.color = Color(0xFFYOURCOLOR).withOpacity(0.1);
```

### Change animation speed:
```dart
// In animation state classes
duration: Duration(milliseconds: 600) // Lower = faster
```

### Disable animations:
```dart
// Wrap any animated widget with this
if (kDebugMode) return child; // Shows without animation
```

---

## Support

For issues or questions:
1. Check if animation is in correct state class
2. Verify animation controller is disposed
3. Ensure animations run within widget lifetime
4. Check browser DevTools for performance metrics

Enjoy your enhanced UI! 🎨✨
