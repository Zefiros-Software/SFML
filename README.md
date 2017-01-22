# SFML
To use [SFML](https://github.com/bkaradzic/SFML) in [ZPM](http://zpm.zefiros.eu), just use:

# [ZPM](http://zpm.zefiros.eu) Installation
In `.package.json`
```json
"requires": [
		{
			"name": "Zefiros-Software/SFML",
			"version": "@head"
		}
]
```

In `premake5.lua`
```lua
zpm.uses "Zefiros-Software/SFML"
```

# Status
Type        | Status
----------- | -------
Linux & OSX | [![Build Status](https://travis-ci.org/Zefiros-Software/SFML.svg?branch=master)](https://travis-ci.org/Zefiros-Software/SFML)
Windows     | [![Build status](https://ci.appveyor.com/api/projects/status/b4syumypyox1y09w?svg=true)](https://ci.appveyor.com/project/Zefiros-Software/sfml)