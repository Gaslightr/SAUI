# SAUI
### Simple Ass UI - A basic UI made in Synapse Drawing Library, created by Gaslighter.

Documentation:
- Types:
  - [Header](https://github.com/Gaslightr/SAUI/blob/main/README.md#header---creates-an-uninteractive-piece-of-text-at-the-top-of-the-screen)
  - [Button](https://github.com/Gaslightr/SAUI/blob/main/README.md#button---creates-a-button-with-a-function-that-executes-upon-the-numpadfive-button-being-clicked)
  - [Toggle](https://github.com/Gaslightr/SAUI/blob/main/README.md#toggle---creates-a-toggle-that-will-turn-on-and-off-when-you-press-numpadfive)
  - Slider

### Header - Creates an uninteractive piece of text at the top of the screen
Usage:
```lua
ui:CreateHeader(name)
```
- name - the contents of the header


### Button - Creates a button with a function that executes upon the NumpadFive button being clicked.
Usage:
```lua
ui:CreateButton(name, callback)
```
- name - the name of the button
- callback - the function that is executed upon the NumpadFive button being clicked.


### Toggle - Creates a toggle that will turn on and off when you press NumpadFive
Usage:
```lua
ui:CreateToggle(name, state, callback)
```
- name - the name of the toggle
- state - if the toggle is on or off
- callback - the function that is executed upon the toggle being toggled


### Slider - Creates a slider that can be incremented or decreased with the press of NumpadFour or NumpadSix
Usage:
```lua
ui:CreateButton(name, min, max, current, callback)
```
- name - the name of the slider
- min - the lowest the slider can go
- max - the highest the slider can go
- current - the amount that the slider is at
- callback - the function that is executed when the slider is incremented or decreased
