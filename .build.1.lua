-- [[
-- @cond ___LICENSE___
--
-- Copyright (c) 2016-2018 Zefiros Software.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
-- @endcond
-- ]]
project "SFML-system"

    kind "StaticLib" 
    includedirs "src"

    files {
       "include/SFML/System/*.inl",
       "src/SFML/System/*.cpp"
    }

    filter "system:windows"
       files {
           "src/SFML/System/Win32/*.cpp"
       }

    filter "system:linux"
       files {
           "src/SFML/System/Unix/*.cpp"
       }

    filter "system:macosx"
       files {
           "src/SFML/System/Unix/*.cpp"
       }
    
    filter "action:android"
       files {
           "src/SFML/System/Android/*.cpp",
       }

    filter {} 

    zpm.export(function()
     
        defines "SFML_STATIC"

        includedirs {
            "include"
        }

        filter "system:macosx"
            linkoptions "-ObjC -framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL"

        filter {}
 
    end)

project "SFML-window"

    kind "StaticLib" 
    includedirs "src"

    files {
       "include/SFML/Window/*.inl",
       "src/SFML/Window/*.cpp"
    }
   
    links "SFML-system"

    filter "system:windows"
       files {
           "src/SFML/Window/Win32/*.cpp"
       }

       removefiles {
            "src/SFML/Window/EGLCheck.cpp",
            "src/SFML/Window/EglContext.cpp"
       }
  
    filter "system:linux"   
       files {
            "src/SFML/Window/Unix/*.cpp"
        }

        removefiles {
            "src/SFML/Window/EGLCheck.cpp",
            "src/SFML/Window/EglContext.cpp"
        }
    
     filter "system:macosx"

        files {
            "src/SFML/Window/OSX/*.cpp",
            "src/SFML/Window/OSX/*.mm",
	        "src/SFML/Window/OSX/*.m"
        }
        
        removefiles {
                "src/SFML/Window/EGLCheck.cpp",
                "src/SFML/Window/EglContext.cpp"
           }

     filter "action:android"
 
        files {
           "src/SFML/Window/Android/*.cpp"
        }
     
     filter {}
    
     zpm.export(function()

        defines "SFML_STATIC"
 
        includedirs {
            "include"
        }

        filter "system:macosx"

            linkoptions { "-ObjC -framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL" }

        filter "system:windows"
		
	        links { 
                "OpenGL32", 
                "Winmm" 
            }

        filter {}  

    end)

project "SFML-graphics"

    kind "StaticLib" 
    
    includedirs { "src",
                  "extlibs/headers/stb_image",
                  "extlibs/headers/freetype2" }

    files {
       "include/SFML/Graphics/*.inl",
       "src/SFML/Graphics/*.cpp"
    }
   
    links { "SFML-system",
            "SFML-window" }
    
     zpm.export(function()

        defines "SFML_STATIC"
 
        includedirs {
            "include"
        }

        filter "system:macosx"

            linkoptions { "-ObjC -framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL" }

        filter "system:windows"
		
	        links { 
                "OpenGL32", 
                "Winmm" 
            }

        filter {}  

    end)
    
    


