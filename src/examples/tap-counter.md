### Tap Counter

This example demonstrates how to create a simple tap counter using the GPUI library. The app displays a button, and each time the button is clicked, the counter increments, displaying the updated count on the screen.

### Code Breakdown

#### Importing Required Modules

```rust
use assets::Assets;
use gpui::*;
use settings::Settings;
use theme::{ThemeRegistry, ThemeSettings};
use ui::prelude::*;
use ui::Button;
```

The code imports various modules and traits that are required to create the UI. These include GPUI, UI components like `Button`, theme settings, and assets.

#### Defining the `CountNumber` Struct

```rust
struct CountNumber {
    count: usize,
}
```

The `CountNumber` struct is defined with a single field `count` of type `usize`. This field will hold the current count of button presses.

#### Implementing the `Render` Trait

```rust
impl Render for CountNumber {
    fn render(&mut self, cx: &mut ViewContext<Self>) -> impl IntoElement {
        let button = Button::new("test-id", "click me")
            .style(ui::ButtonStyle::Filled)
            .size(ui::ButtonSize::Large)
            .on_click(cx.listener(
                move |this: &mut CountNumber,
                      _selection: &ClickEvent,
                      _cx: &mut ViewContext<CountNumber>| {
                    this.count += 1;
                },
            ));

        div()
            .flex()
            .flex_col()
            .bg(rgb(0x282c34))
            .text_color(rgb(0xffffff))
            .size_full()
            .justify_center()
            .items_center()
            .text_xl()
            .child(format!("Pressed {}! times", &self.count))
            .child(button)
    }
}
```

- **Render Trait**:
  - The `Render` trait is implemented for the `CountNumber` struct, defining how the UI for this component should be rendered.

- **Button Setup**:
  - A `Button` is created with the label "click me".
  - `style(ui::ButtonStyle::Filled)`: Applies a filled style to the button.
  - `size(ui::ButtonSize::Large)`: Sets the button size to large.
  - `on_click(cx.listener(...))`: Registers an event listener for the button's `on_click` event. When the button is clicked, the count is incremented by 1.

- **UI Layout**:
  - `div().flex().flex_col()`: Creates a `div` element with a Flexbox layout in a column direction.
  - `bg(rgb(0x282c34))`: Sets the background color to a dark grayish blue.
  - `text_color(rgb(0xffffff))`: Sets the text color to white.
  - `size_full()`: Makes the `div` take up the full size of its parent container.
  - `justify_center()`, `items_center()`: Centers the content horizontally and vertically.
  - `text_xl()`: Sets the text size to extra-large.
  - `child(format!("Pressed {}! times", &self.count))`: Displays the current count.
  - `child(button)`: Adds the button as a child element.

#### Main Function

```rust
fn main() {
    App::new().run(|cx: &mut AppContext| {
        let theme_name: String = "One Dark".to_string();

        settings::init(cx);
        theme::init(theme::LoadThemes::All(Box::new(Assets)), cx);

        let theme_registry = ThemeRegistry::global(cx);
        let mut theme_settings = ThemeSettings::get_global(cx).clone();
        theme_settings.active_theme = theme_registry.get(&theme_name).unwrap();
        ThemeSettings::override_global(theme_settings, cx);

        cx.open_window(WindowOptions::default(), |cx| {
            cx.new_view(|_cx| CountNumber { count: 0 })
        })
        .unwrap();
    });
}
```

- **App Initialization**:
  - `App::new()`: Creates a new GPUI application.

- **Theme Setup**:
  - The `One Dark` theme is selected for the application.
  - `settings::init(cx)`: Initializes settings for the application.
  - `theme::init(theme::LoadThemes::All(Box::new(Assets)), cx)`: Loads all available themes using the assets provided.
  - `ThemeRegistry::global(cx)`: Retrieves the global theme registry.
  - `ThemeSettings::get_global(cx).clone()`: Gets the global theme settings and clones them for modification.
  - `theme_settings.active_theme = theme_registry.get(&theme_name).unwrap()`: Sets the active theme to `One Dark`.
  - `ThemeSettings::override_global(theme_settings, cx)`: Overrides the global theme settings with the modified settings.

- **Window Creation**:
  - `cx.open_window(WindowOptions::default(), |cx| {...})`: Opens a new window with default options.
  - `cx.new_view(|_cx| CountNumber { count: 0 })`: Creates a new view with an initial count of 0.

### Summary

This example illustrates how to create a simple counter application using GPUI. The app features a button that increments a count displayed on the screen. The code also demonstrates how to apply themes and set up the application's UI layout and event handling.

---

If you need further details or additional examples, feel free to ask, or make issues on the [GitHub repository](https://github.com/Himasnhu-AT/GPUI-docs-unofficial)
