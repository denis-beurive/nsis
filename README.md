# Introduction to Nullsoft Scriptable Install System (NSIS)

## Preparation

Find the path to the NSIS compiler (using PowerShell):

```
Get-Childitem –Path 'C:\Program Files (x86)\NSIS' -Include  makensisw.exe -File -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName 
```

> Result: `C:\Program Files (x86)\NSIS\makensisw.exe`
>
> You should add "`C:\Program Files (x86)\NSIS`" to the `PATH` environment variable.

## Resources

The application used for this tutorial is given here:

* the [source code](applications/nsis_app.c) - compiled using [MinGW](https://www.mingw-w64.org/).
* the [executable](applications/nsis_app.exe) (for Windows 11 amd64).

## Examples

* [basic example](installer-1)

## Defender submission

	Submission ID: bc9a5e35-09b1-46d6-8b43-800cffc29abb
	Status: Submitted
	Submitted by: denis.beurive@gmail.com
	Submitted: Aug 27, 2024 7:52:50 PM
	User Opinion: Incorrect detection

