# GPUI Documentation - UnOfficial

Welcome to the GPUI documentation! This document serves as a comprehensive guide to understanding and using GPUI, a hybrid immediate and retained mode, GPU-accelerated UI framework for Rust. GPUI is still under active development as part of the Zed code editor, and it's currently not available on crates.io.

## Getting Started

To start using GPUI, ensure you're on macOS and have the latest stable version of Rust. Add GPUI to your project by including the following in your `Cargo.toml`:

```toml
gpui = { git = "https://github.com/zed-industries/zed" }
```

### Creating Your First App

Everything in GPUI starts with an `App`. You can create an app using `App::new()` and kick it off by passing a callback to `App::run()`. Inside this callback, you can open a new window using `AppContext::open_window()` and register your first root view.

For a complete example, visit [gpui.rs](https://www.gpui.rs/).

## The Big Picture

GPUI is organized into three primary components, or "registers":

### 1. **State Management with Models**

When your application needs to store state that is shared between different parts, GPUI's models are your go-to solution. Models are managed by GPUI and are accessible through a smart pointer similar to `Rc`. Learn more in the `app::model_context` module.

### 2. **High-Level UI with Views**

Views in GPUI serve as the starting point for all UI elements. A view is essentially a model that implements the `Render` trait. At the beginning of each frame, GPUI invokes the render method on the root view of the window. Views construct a tree of elements, style them using a Tailwind-style API, and hand them over to GPUI for rendering.

For a versatile rendering tool, check out the `div` element.

### 3. **Low-Level UI with Elements**

Elements are the fundamental building blocks of UI in GPUI. They offer an imperative API that gives you maximum control and flexibility. Elements dictate how they and their child elements are rendered, making them ideal for implementing custom layouts, efficient views into large lists, or specialized components like code editors.

Refer to the `element` module for more details.

### Contexts in GPUI

GPUI heavily relies on context parameters (usually named `cx`). Contexts provide access to the application's state and services, and there are several types of contexts available:

- **`AppContext`**: The root context, providing access to the global application state.
- **`WindowContext`**: Manages the state of a window and dereferences to `AppContext`.
- **`ModelContext<T>`**: Accesses and updates specific models and dereferences to `AppContext`.
- **`ViewContext<V>`**: Accesses and updates views and dereferences to `WindowContext`.
- **`AsyncAppContext` and `AsyncWindowContext`**: Asynchronous contexts with a static lifetime, allowing interaction with `Model`s and `View`s across `await` points.
- **`TestAppContext` and `TestVisualContext`**: Testing contexts that provide additional features for simulating platform inputs.

For more information, see the dedicated [Contexts documentation](contexts.md).

## Additional Features

### Actions

Actions are custom-defined structs for converting keystrokes into logical operations within your UI. They are ideal for implementing keyboard shortcuts. For example, defining an action:

```rust
mod menu {
    #[gpui::action]
    struct MoveUp;
}
```

You can then bind these actions to keys in your UI using `on_action`. For more information, refer to the `action` module.

### Platform Services

GPUI provides various platform services, such as quitting the app or opening a URL, accessible via the `app::AppContext`.

### Asynchronous Execution

GPUI includes an async executor integrated with the platform's event loop. Check out the `executor` module for further details.

### Testing

GPUI's `[gpui::test]` macro makes writing tests easier by simulating common platform inputs. Testing contexts (`TestAppContext` and `TestVisualContext`) provide additional features tailored for testing GPUI applications.

## Key Dispatch

GPUI emphasizes keyboard-first interactivity. You can bind actions to keys by declaring a key context using `key_context` and mapping keys to actions in a keymap:

```json
{
  "context": "menu",
  "bindings": {
    "up": "menu::MoveUp",
    "down": "menu::MoveDown"
  }
}
```

See the [Key Dispatch documentation](key_dispatch.md) for more details.

## Learning More

Currently, the best resources for learning GPUI are the Zed source code, fireside hack events, and the Zed Discord community. The team is actively working on improving the documentation, creating more examples, and publishing guides on the [Zed blog](https://zed.dev/blog).
