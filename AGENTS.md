# AGENTS.md

## Cursor Cloud specific instructions

### Project Overview

Selvania Launcher (CraftLaunch) is an Electron-based Minecraft game launcher. It is a desktop GUI application, not a web app or backend service.

### Development Commands

- `npm start` — Runs the Electron app in dev mode (`NODE_ENV=dev`), skipping the auto-updater window and using local `./data/` for app data.
- `npm run dev` — Same as `npm start` but wrapped in `nodemon` for live-reload on JS/HTML/CSS changes, and opens DevTools automatically (`DEV_TOOL=open`).
- `npm run build` — Obfuscates code and packages with electron-builder (requires `GH_TOKEN`). Not needed for development.

### Important Caveats

- **No linter or test suite**: This project has no ESLint, Prettier, or automated test framework configured. There are no test scripts or test files.
- **Remote config server**: On startup the app fetches config from `http://launcher.luuxis.fr/launcher/config-launcher/config.json`. In environments without access to this server, the app will show an ENOTFOUND error dialog and exit when dismissed. To develop without network access to this server, temporarily mock the `GetConfig()` method in `src/assets/js/utils/config.js` to return `{ online: false, maintenance: false, title: "Selvania Launcher", url: "http://localhost", rss: "" }`.
- **Display required**: The app needs a display server (X11/Xvfb). The cloud VM already has Xvfb running on `:1`. Ensure `DISPLAY=:1` is set when running Electron commands.
- **D-Bus/GPU warnings**: Harmless `bus.cc` and GPU errors appear in the console when running in headless mode — these can be safely ignored.
- **Node.js version**: CI uses Node.js 18.x. Use `nvm use 18` to activate the correct version.
- **No Docker needed**: This is a pure Electron app with no container or docker-compose setup.
