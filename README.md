# DocCam

Simple webcam based document viewer with minimal UI to have a frictionless digital aid for reading and modifying physical documents.

## Key Features

- **Camera Selection** — Choose from available video devices
- **Zoom & Pan** — Mouse wheel or pinch to zoom, drag to pan
- **Flip & Rotate** — Horizontal/vertical flip, 90° rotation increments
- **Presets** — Save/load view states (keys 1-9, Ctrl+1-9 to save)
- **Fullscreen** — Press F to toggle
- **Pause** — Freeze the feed anytime

### Screenshot
![Screenshot](screenshot.jpg)

## Technical Details

- Single HTML file — all CSS/JS inline
- Pure vanilla JavaScript, no dependencies
- LocalStorage for persisting camera and presets
- Dark theme, monospace typography
- Touch support for mobile/tablet

## Running Locally

```bash
./serve.sh 8000
```

Then open http://127.0.0.1:8000 in your browser.
