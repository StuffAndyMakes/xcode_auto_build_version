# Xcode: Automatically Update a Build Number and Date in a C Header File on Build

This is a snippet of shell code for use in a Run Script Build Phase in an Xcode project that creates/updates a C header file with preprocessor #define values for a build number and build date, both of which are updated every time you build your target.

Simply add the `build_version.h` file to your project in the Project Navigator, then add `#include "build_version.h"` to your C code to use the define values. Like this, maybe:

`printf("My Command Line App (Build %d, %s)\n", BUILD_VERSION, BUILD_DATE);`

## Sample build_version.h

```
#define BUILD_VERSION 87
$define BUILD_DATE "10-11-2021"
```

You can then use either of those preprocessor values in your code, which is kinda handy for outputting with help texts on the command line, for instance.

## Note
The above code isn't meant to be in a script (it could, of course, then you could run that script), so much as it is meant to be pasted into the "Run Script" phase in your target's Build Phases section of your Xcode project.

# How To Use

- Select your project (the top-most entry, usually) in the file explorer in the left side of the Xcode window.
- Select your build target under "Targets" in the editor area of the Xcode window.
- Select the "Build Phases" tab.
- Click the little "+" button in the upper-right corner of the editor window, just above the "> Dependencies (X items)" section.
- Select "New Run Script Phase" from the fly-out menu.
- The new Run Script entry will be at the bottom of the phases list. Drag it up to be the 2nd in the list, underneath Dependencies.
- Copy the shell code above and paste it into the edit field with the line numbers in it, just below the "Shell" field.
- Speaking of Shell field... I change the value of that field to "/bin/zsh" in my projects, since that's now the default shell in macOS.
- Build your project once to create the `build_version.h` file if it does not already exist.
- Add the `build_version.h` file to your project's source files (it should be sitting next your `main.c` file and the rest of your source files).
- Finally, use one or both of the defines in your code, like the example up near the top of this doc.

## Change it for your own needs

You can change the name of the header file simply by changing the filename on this line:

`HFN=$SRCROOT/$PROJECT_NAME/build_version.h`

...maybe to something like:

`HFN=$SRCROOT/$PROJECT_NAME/latest_build_version.h`

If you want the header file to sit in the folder with your source code, don't mess with the `$SRCROOT` or `$PROJECT_NAME` values on that line. Or, feel free to mess with the entire path, as long as it is referenced by the `$HFN` variable in the rest of the script code and, if you want to use those defined prrprocessor values in your code, include the file in your source file. 

For the `BUILD_DATE` value, if you want something fancier for a date/time, other than dd/mm/yyyy, `man date` at the command line to see your date/time formatting options.

Feel free to use this or don't. :)
