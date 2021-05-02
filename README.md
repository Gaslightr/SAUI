# SAUI
### Simple Ass UI - A basic UI made in Synapse Drawing Library, created by Gaslighter.

Documentation:
- Types:
  - [Header](https://github.com/Gaslightr/SAUI/blob/main/README.md#header---creates-an-uninteractive-piece-of-text-at-the-top-of-the-screen)
  - [Button](https://github.com/Gaslightr/SAUI/blob/main/README.md#button---creates-a-button-with-a-function-that-executes-upon-the-numpadfive-button-being-clicked)
  - Toggle
  - Slider

### Header - Creates an uninteractive piece of text at the top of the screen
Usage:
```lua
ui:CreateHeader(name)
```
name - the contents of the header


### Button - Creates a button with a function that executes upon the NumpadFive button being clicked.
Usage:
```lua
ui:CreateButton(name, callback)
```
name - the name of the button
callback - the function that is executed upon the NumpadFive button being clicked.


### Toggle - Creates a button with a function that executes upon the NumpadFive button being clicked.
Usage:
```lua
ui:CreateButton(name, state, callback)
```
name - the name of the button
state - if the button is on or off
callback - the function that is executed upon the NumpadFive button being clicked.
