# `div()` Element Documentation

## Overview

The `div()` element in GPUI is a flexible container used to structure and style UI components. It supports a wide range of properties that allow you to define its layout, size, color, borders, and more. The following example demonstrates how to use various properties to customize a `div()` element.

## Example

```rust
div()
    // Flex properties
    .flex()
    .flex_col()             // Stack elements vertically
    .gap_2()                // Add 8px of space between elements
    // Size properties
    .w_96()                 // Set width to 384px
    .p_4()                  // Add 16px of padding on all sides
    // Color properties
    .bg(color.surface)      // Set background color
    .text_color(color.text) // Set text color
    // Border properties
    .rounded_md()           // Add 4px of border radius
    .border_1()             // Add a 1px border
    .border_color(color.border)
    .child("Hello, world!")
```

### Properties

- **Flex Properties:**
  - `.flex()`: Enables Flexbox layout, making the `div` a flex container.
  - `.flex_col()`: Stacks child elements vertically (column direction).
  - `.gap_2()`: Adds 8px (2x the base gap) of space between child elements.

- **Size Properties:**
  - `.w_96()`: Sets the width of the `div` to 384px (96 x 4px).
  - `.p_4()`: Adds 16px (4 x 4px) of padding on all sides.

- **Color Properties:**
  - `.bg(color.surface)`: Sets the background color to `color.surface`.
  - `.text_color(color.text)`: Sets the text color to `color.text`.

- **Border Properties:**
  - `.rounded_md()`: Adds 4px of border radius, making the corners slightly rounded.
  - `.border_1()`: Adds a 1px border around the `div`.
  - `.border_color(color.border)`: Sets the border color to `color.border`.

### InDepth properpties

> TODO

> EXAMPLE:
> lets say, size can be `.p\_3` or `.p\_6` so on...

### Explanation

The `div()` element is a versatile container that can be styled using a variety of properties. In the example above:

- The `div` uses Flexbox layout to stack its children vertically and adds space between them using the `.gap_2()` property.
- The `.w_96()` and `.p_4()` properties define the width and padding of the `div`, respectively, ensuring the element has a defined size and spacing around its content.
- The background and text colors are set using `.bg()` and `.text_color()`, with the colors being referenced from a color scheme or theme.
- The borders are styled with a radius, width, and color, providing a well-defined boundary for the `div`.

This setup is commonly used for creating clean, organized UI components that are responsive and easy to style.

### Use Cases

The `div()` element is ideal for creating containers that hold other elements, such as buttons, text, and images. It can be used to:

- Group related UI components together.
- Create flexible layouts that adapt to different screen sizes.
- Apply consistent styling to multiple elements.

---

If you need further details or additional examples, feel free to ask, or make issues on the [GitHub repository](https://github.com/Himasnhu-AT/GPUI-docs-unofficial)
