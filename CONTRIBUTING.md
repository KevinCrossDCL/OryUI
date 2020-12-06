# How to contribute to OryUI

Thank you for showing an interest and taking the time to contribute!

## Reporting issues/bugs

* Before reporting an issue/bug please ensure it hasn't already been reported by searching on GitHub under [Issues](https://github.com/KevinCrossDCL/OryUI/issues)
* If it hasn't already been reported then [open a new issue](https://github.com/KevinCrossDCL/OryUI/issues/new). Be sure to include a title and clear description, as much relevant information as possible, and if necessary a code sample demonstrating the problem.

## Submitting changes

* Open a new GitHub [pull request](https://github.com/KevinCrossDCL/OryUI/pull/new/master) with a clear list of what you've done as well as including the relevant issue number if applicable.

## Coding conventions

  * All component names are prefixed with OryUI
  * All function names are prefixed with OryUI
  * All function parameter names are prefixed with oryUI
  * All type names are prefixed typeOryUI
  * Global, local and parameter variable names are all lower camel case (except component names)
  * `#` is used at the end of each float/decimal variable name i.e. `var1# = 0.1`, not `var1 = 0.1`
  * `$` is used at the end of each string variable name i.e. `var2$ = "Hello"`, not `var2 = "Hello"`
  * Spaces are added after each comma in function parameters i.e. `FunctionName(1, 2, 3)`, not `FunctionName(1,2,3)`
  * Spaces are also added around all operators i.e. `x = x + y`, not `x=x+y`
  * Indents are tabbed and the width of a single indent is 4 spaces.
  * New widgets should follow the same/similar style as the others. A OryUITemplate.agc file has been provided as a starting point.
  * Function names in a single widget file should be sorted in alphabetical order.
  
## Icons

Icons added for a new/existing widget should, if possible, be taken from [Material-UI icons](https://material.io/resources/icons/?style=baseline).

For consistency please take the icon from their repository from the relevant 48dp/2x folders and convert them to white images i.e.: material-design-icons/png/_**group**_/_**name**_/materialicons/48dp/2x/*.png.

New icons should be named Icon-*.png and placed in the media/OryUIMedia folder. The LoadImage() call needs to be added to OryUIMedia.agc file and a line of code for it added to the OryUIReturnIconID() function in OryUI.agc.