# App Actigraphy

This webapp is an application designed for annotating sleep data. This repository contains the source code and related files for the application.

## Getting Started

The app may be installed through Poetry (recommended for developers). See the instructions for each below. The app will be available at http://localhost:8051.

### Running the App through Poetry

1. Ensure you have [Poetry](https://python-poetry.org/docs/) installed.
2. Clone the repository:
   ```bash
   git clone https://github.com/nathaliaesper/app-actigraphy-test.git
   cd app-actigraphy-test
   ```
3. Install dependencies:
   ```bash
   poetry install
   ```
4. Run the app:
   ```bash
   poetry run actigraphy {DATA_DIR}
   ```

## Developer notes

The Actigraphy app is developed to annotate sleep data, and for this project, we've utilized the Dash framework. It's important to note that Dash apps usually aren't geared towards full-stack applications, but given the project requirements, adopting it was a pragmatic necessity. In this repository, we've implemented a custom Dash architecture to address some typical challenges associated with a full-stack Dash app, particularly through the introduction of a custom callback manager. The organization of the project is structured as follows:

- `app.py` contains the main Dash app, which is responsible for the layout of the app.
- `components/` houses the components utilized by the app. Each component is tasked with its specific layout and logic. Some of the components include file selection, day slider, and graph visualization.
- `core/` contains the core tools of the app, including configurations, utilities, command line interface and the callback manager.
- `core/callback_manager.py` is responsible for registering callbacks for the app. It is also responsible for registering callbacks for the components. This file allows the callbacks to be placed across multiple files by defining a global manager.
- `database/` contains the tools for interacting with the database.
- `io/` contains the tools for loading and saving data.
- `plotting` contains the tools for plotting data.

That being said, the callback architecture has grown complex, especially in the graph component where chains of callbacks can cause the app to slow down.
