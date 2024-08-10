# Theme

This crate provides the theme system for Zed, allowing for a consistent and customizable appearance for the UI components across the application.

## Overview

A theme in Zed is a collection of colors that define the visual style of the application's user interface. Themes are designed to ensure a cohesive look and feel throughout the application, making it visually appealing and easier to use.

### Theme Structure

A theme in Zed is composed of two main parts:

1. **[ThemeFamily]:**
   This contains metadata such as the theme name, author, and specific [ColorScales]. It also includes a collection of related themes.

2. **[Theme]:**
   Each theme within a [ThemeFamily] is a specific color scheme that can be applied to the application's UI. It consists of various color settings used for different UI components.

### Key Components

- **[ThemeColors]:**
  A set of colors used to style the UI. Refer to the [ThemeColors] documentation for more detailed information on how colors are organized and used.

- **[ThemeStyles]:**
  Defines the styling attributes such as window appearance, system colors, status colors, player colors, and syntax theme. These styles dictate how different UI elements appear under a specific theme.

- **[Appearance]:**
  Defines whether the theme is Light or Dark. The appearance setting influences the overall brightness and contrast of the UI.

- **[LoadThemes]:**
  Determines which themes are loaded into the application. You can choose to load just the base theme or all built-in themes.

## Default Themes

Zed provides default themes, such as "Zed Pro Daylight" and "Zed Pro Moonlight," which represent light and dark appearances, respectively. These themes are part of the "Zed Pro" theme family.

### Example of Default Theme:

```rust
fn zed_pro_daylight() -> Theme {
    Theme {
        id: "zed_pro_daylight".to_string(),
        name: "Zed Pro Daylight".into(),
        appearance: Appearance::Light,
        styles: ThemeStyles {
            window_background_appearance: WindowBackgroundAppearance::Opaque,
            system: SystemColors::default(),
            colors: ThemeColors::light(),
            status: StatusColors::light(),
            player: PlayerColors::light(),
            syntax: Arc::new(SyntaxTheme::default()),
            accents: AccentColors::light(),
        },
    }
}
```

### Theme Initialization

To initialize the theme system in Zed, you can load the desired themes using the `init` function:

```rust
pub fn init(themes_to_load: LoadThemes, cx: &mut AppContext) {
    let (assets, load_user_themes) = match themes_to_load {
        LoadThemes::JustBase => (Box::new(()) as Box<dyn AssetSource>, false),
        LoadThemes::All(assets) => (assets, true),
    };
    ThemeRegistry::set_global(assets, cx);

    if load_user_themes {
        ThemeRegistry::global(cx).load_bundled_themes();
    }

    ThemeSettings::register(cx);
    FontFamilyCache::init_global(cx);
}
```

## Custom Themes

Developers can create custom themes by defining new [ThemeFamily] and [Theme] structs. These themes can be added to the theme registry and used within the application to provide a unique visual experience.

---

If you need further details or additional examples, feel free to ask, or make issues on the [GitHub repository](https://github.com/Himasnhu-AT/GPUI-docs-unofficial)
