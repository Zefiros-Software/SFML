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
                  "extlibs/stb_image" }

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
    
    


