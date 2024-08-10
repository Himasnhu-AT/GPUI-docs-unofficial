### Hello World

This example demonstrates how to create a simple GPUI application that displays a "Hello, World!" message inside a styled window. The application uses GPUI's components to define the UI layout, styling, and behavior.

### Code Breakdown

#### Importing GPUI

```rust
use gpui::*;
```

The GPUI crate is imported, which provides all the necessary functions, traits, and types needed to build the UI.

#### Defining the `HelloWorld` Struct

```rust
struct HelloWorld {
    text: SharedString,
}
```

The `HelloWorld` struct is defined with a single field `text` of type `SharedString`. This field will hold the text that will be displayed in the UI.

#### Implementing the `Render` Trait

```rust
impl Render for HelloWorld {
    fn render(&mut self, _cx: &mut ViewContext<Self>) -> impl IntoElement {
        div()
            .flex()
            .bg(rgb(0x2e7d32))
            .size(Length::Definite(Pixels(300.0).into()))
            .justify_center()
            .items_center()
            .shadow_lg()
            .border_1()
            .border_color(rgb(0x0000ff))
            .text_xl()
            .text_color(rgb(0xffffff))
            .child(format!("Hello, {}!", &self.text))
    }
}
```

- The `Render` trait is implemented for `HelloWorld`, which defines how the UI for this component should be rendered.
- The `render` method is responsible for creating and returning a UI element, in this case, a `div`.
- **Styling**:
  - `flex()`: Enables Flexbox layout for the div.
  - `bg(rgb(0x2e7d32))`: Sets the background color to a greenish tone.
  - `size(Length::Definite(Pixels(300.0).into()))`: Defines the size of the element as 300x300 pixels.
  - `justify_center()`, `items_center()`: Centers the content horizontally and vertically.
  - `shadow_lg()`: Adds a large shadow to the element.
  - `border_1()`: Sets a 1-pixel border.
  - `border_color(rgb(0x0000ff))`: Sets the border color to blue.
  - `text_xl()`: Sets the text size to extra-large.
  - `text_color(rgb(0xffffff))`: Sets the text color to white.
- **Content**:
  - `child(format!("Hello, {}!", &self.text))`: Adds a child element containing the formatted text "Hello, World!".

#### Main Function

```rust
fn main() {
    App::new().run(|cx: &mut AppContext| {
        let bounds = Bounds::centered(None, size(px(300.0), px(300.0)), cx);
        cx.open_window(
            WindowOptions {
                window_bounds: Some(WindowBounds::Windowed(bounds)),
                ..Default::default()
            },
            |cx| {
                cx.new_view(|_cx| HelloWorld {
                    text: "World".into(),
                })
            },
        )
        .unwrap();
    });
}
```

- **Creating the App**: `App::new()` initializes a new GPUI application.
- **Running the App**: `run` takes a callback function where the app's windows and views are defined.
- **Setting Window Bounds**:
  - `Bounds::centered(None, size(px(300.0), px(300.0)), cx)`: Centers the window on the screen with a size of 300x300 pixels.
- **Opening a Window**:
  - `cx.open_window(...)`: Opens a new window with the specified options.
  - **Window Options**:
    - `window_bounds`: Defines the position and size of the window.
    - `Default::default()`: Uses default settings for other window options.
- **Creating the View**:
  - `cx.new_view(...)`: Creates a new view that displays the `HelloWorld` struct with the text "World".

### Summary

This example demonstrates how to use GPUI to create a simple "Hello, World!" application with custom styling and layout. The code sets up a window with specific dimensions and styles a `div` element to display a greeting message centered in the window.

---

If you need further details or additional examples, feel free to ask, or make issues on the [GitHub repository](https://github.com/Himasnhu-AT/GPUI-docs-unofficial)
