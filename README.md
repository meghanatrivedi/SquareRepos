# Square GitHub Repositories (SwiftUI)

## Overview
This project displays a scrollable list of GitHub repositories for the
**Square** organisation using the GitHub public API.

## Architecture
- **SwiftUI + MVVM**
- Clear separation between View, ViewModel, and Networking
- Async/Await for networking
- Dependency injection for testability

## Features
- Loading, success, and error states
- Retry on failure
- Clean and simple UI
- Unit tests for ViewModel

## Libraries
- No third-party libraries were used.
  - URLSession and Swift concurrency are sufficient for this task.
  - Avoiding dependencies keeps the project lightweight and transparent.

## Possible Improvements
- Pagination support
- Repository detail screen
- Caching responses
- UI tests
- Pull-to-refresh

## Notes
The implementation prioritises readability, testability, and robustness
over visual complexity, in line with the exercise’s focus on code quality.

