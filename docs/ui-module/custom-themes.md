# Daisy UI: Buildinig Custom Themes

As your project grows, its natural work on branding and customization. In addition to performance and a good user experience, an identity is important. With Daisy UI, you can easily create a custom theme to match the look and feel of your brand progressively.

Once you have settled on your colors and typography for the theme. You can add them in your `global.css` file. Make sure to import libraries in the correct order.

```css
@import "tailwindcss";
@plugin "daisyui";
@plugin "daisyui/theme" {
  name: "mytheme";
  default: true; /* set as default */
  prefersdark: false; /* set as default dark mode (prefers-color-scheme:dark) */
  color-scheme: light; /* color of browser-provided UI */

  --color-base-100: oklch(98% 0.02 240);
  --color-base-200: oklch(95% 0.03 240);
  --color-base-300: oklch(92% 0.04 240);
  --color-base-content: oklch(20% 0.05 240);
  --color-primary: oklch(55% 0.3 240);
  --color-primary-content: oklch(98% 0.01 240);
  --color-secondary: oklch(70% 0.25 200);
  --color-secondary-content: oklch(98% 0.01 200);
  --color-accent: oklch(65% 0.25 160);
  --color-accent-content: oklch(98% 0.01 160);
  --color-neutral: oklch(50% 0.05 240);
  --color-neutral-content: oklch(98% 0.01 240);
  --color-info: oklch(70% 0.2 220);
  --color-info-content: oklch(98% 0.01 220);
  --color-success: oklch(65% 0.25 140);
  --color-success-content: oklch(98% 0.01 140);
  --color-warning: oklch(80% 0.25 80);
  --color-warning-content: oklch(20% 0.05 80);
  --color-error: oklch(65% 0.3 30);
  --color-error-content: oklch(98% 0.01 30);

  /* border radius */
  --radius-selector: 1rem;
  --radius-field: 0.25rem;
  --radius-box: 0.5rem;

  /* base sizes */
  --size-selector: 0.25rem;
  --size-field: 0.25rem;

  /* border size */
  --border: 1px;

  /* effects */
  --depth: 1;
  --noise: 0;
}
```

The best part? You can do this progressively. And Daisy UI enables you to customize it throughly. You can customize

1. Existing themes - Maybe you like a theme and just wanna change it fonts or a specific color. Or maybe just a different hue.

2. Custom components - Use uitlity classes to create your own components with the touch and feel of your own choices.

3. Creating your own custom theme - As we have seen above, it is that easy to implement your own theme.

### References

1. Customizing your components: https://daisyui.com/docs/customize/

2. Creating a custom theme: https://daisyui.com/docs/themes/
