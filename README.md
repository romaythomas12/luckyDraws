# Lucky Draw

This project is an iOS lottery draw app built using **SwiftUI** and **Swift 6**, with a simple functionality of allowing users to view lottery draws, generate tickets, and validate them. The app follows the **MVVM (Model-View-ViewModel)** architecture and is designed with a focus on accessibility, testing, and clean development practices. It includes features like data caching and adheres to the **Conventional Commits** standard for commit messages.


<img width="374" alt="Screenshot 2024-09-09 at 21 20 57" src="https://github.com/user-attachments/assets/6e5e1cd4-ac17-444a-9d2d-c73fc7d4841e">

<img width="391" alt="Screenshot 2024-09-09 at 22 14 49" src="https://github.com/user-attachments/assets/9c84f007-da11-4bee-859a-894e06342c8d">


---

## Key Technologies Used

### 1. Swift 6

The app is built using **Swift 6**, leveraging the following new features:

- **Concurrency with `Sendable`:** Swift 6 extensively leverages the `Sendable` protocol to ensure thread safety when handling concurrency. Services like `LotteryServiceDataProvider` conform to `Sendable` to safely handle asynchronous tasks.
  
- **Protocols & Generics:** A highly generic service architecture (`Drawable`, `Storeable`, etc.) is used in order to easily allow swapping of remote, local, or mock services. This modularity simplifies unit testing and future feature expansion.

### 2. SwiftUI

- The app's UI is built entirely using **SwiftUI**. 
- SwiftUI’s built-in animations help deliver smooth transitions between views and enhance user experience.
  
### 3. Unit Testing (Swift Testing Framework)

The project uses **Swift Testing Framework**, which offers a more modern and efficient way to write unit tests compared to XCTest.
- The app has test coverage (63%), including tests for key components like `LotteryServiceDataProvider`, `TicketGenerator`, and `TicketValidator`, ensuring that business logic functions correctly.

### 4. Accessibility

The app is designed with accessibility in mind, utilising key SwiftUI features:

- **VoiceOver:** Key UI elements are labelled using `.accessibilityLabel` and `.accessibilityHint`, ensuring full compatibility with VoiceOver.
- **Grouped Elements:** Accessibility modifiers are used to group related UI elements, making it easier for users to navigate the interface using screen readers.
- **Text Size & Dynamic Type:** The app supports Dynamic Type, allowing users to scale the font size according to their accessibility settings.

### 5. Commit Standards (Conventional Commits)

The project adheres to the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standard, ensuring a well-organized commit history that follows a structured format.

Example Commit Messages:
- `feat: add lottery draw feature`
- `fix: resolve draw detail view layout issue`
- `test: add unit tests for LotteryServiceDataProvider`
- `docs: update README with SwiftUI and caching info`

This makes it easier to automate tasks like generating changelogs and managing versioning.

## Architecture: MVVM

The app is structured using the **Model-View-ViewModel (MVVM)** architecture to maintain a clean separation between UI components and business logic.

- **Model:** Data structures like `LotteryDraw`, `LotteryTicket`
- **View:** SwiftUI views (`DrawsView`, `DrawDetailView`, `MyTicketsView`) that declare how the app should look, reacting to changes in ViewModel state.
- **ViewModel:** Components like `LotteryViewModel` and `MyTicketsViewModel` are responsible for managing app logic and exposing data to the views. They handle state changes, business logic, and communication between the Model and View.

### Key Service Components

- **LotteryServiceDataProvider:**
    - The core service that loads lottery draw data, managing requests from remote APIs, local cache, and mock data sources.
    - Uses `async/await` for concurrency, with a fallback mechanism to the local cache in case of a remote failure.

- **LotteryDrawSorter:**
    - A utility that ensures lottery numbers and bonus balls are sorted before being displayed, providing a consistent user experience.

- **TicketGenerator:**
    - Generates random lottery tickets, simulating a real-world lottery system where users can select their own numbers or randomly generate them.

- **TicketValidator:**
    - Responsible for validating tickets against the drawn numbers, determining how many numbers and bonus balls match, and updating the results accordingly.

---

## Caching Strategy

The app uses **UserDefaults** for data caching to store lottery draw results locally. Used for simplicity and to save development time. It works well for small amounts of data but may not be ideal for more complex caching needs.

### Potential Improvements:

- **Realm.io or Core Data:** For more robust and scalable caching, **Realm.io** or **Core Data** would be more suitable, especially if the app scales to store larger datasets or needs advanced querying capabilities.

---

## Future Improvements

### 1. Localization

- **String Catalogs:** Swift’s **String Catalogs** would be used for localization in future iterations. This system offers an efficient way to manage multiple languages, centralizing translatable strings.

### 2. Comprehensive Testing

- While the app has good unit test coverage, further testing could include **UI integration tests** and additional **accessibility validations** to ensure a consistent experience across various screen sizes and user settings.

---

## How to Run the App

### Prerequisites:

- Xcode 16 (Beta) 
- Swift 6
- iOS 16 or later (simulator or device)
- CocoaPods (optional, if future dependencies are added)

### Steps:

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/romaythomas12/luckyDraws.git
    ```

2. **Build the App:**
    - Open the `.xcworkspace` file in Xcode.
    - Select a target (simulator or device).
    - Press **Cmd + R** to build and run the app.

3. **Running Tests:**

    The app includes unit tests to ensure key services function as expected. To run the tests:
    - Press **Cmd + U** to execute all tests.

---
