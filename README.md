# xcode_auto_build_version

This is a snippet of shell code for use in a Run Script Build Phase in an Xcode project that creates/updates a C header file with preprocessor #define values for a build number and build date, both of which are updated every time you build your target.

## Sample build_version.h

```
#define BUILD_VERSION 87
$define BUILD_DATE "10-11-2021"
```

You can then include either of those preprocessor values in your code, which is kinda handy for outputting with help texts on the command line, for instance.

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

