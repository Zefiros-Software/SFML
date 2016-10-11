project "SFML-system"

    kind "StaticLib"
 
    defines { "SFML_STATIC" }

    includedirs {
       "include",
       "src"
    }

    -- generic
    files {
       "include/SFML/System/*.inl",
       "src/SFML/System/*.cpp"
    }

    filter "system:windows"

       files 
       {
           "src/SFML/System/Win32/*.cpp"
       }

    filter "system:linux"

       files 
       {
           "src/SFML/System/Unix/*.cpp"
       }

    filter "system:macosx"

       files 
       {
           "src/SFML/System/Unix/*.cpp"
       }
    
    filter "action:android"

       files 
       {
           "src/SFML/System/Android/*.cpp",
       }

    filter {} 

    zpm.export(function()

        filter "system:macosx"

            linkoptions { "-ObjC -framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL" }

        filter {}

        includedirs {
            "include"
        }
     
        defines { "SFML_STATIC" }
 
    end)

project "SFML-window"

    kind "StaticLib"
 
    defines { "SFML_STATIC" }

    includedirs {
       "include",
       "src"
    }


    -- generic
    files {
       "include/SFML/Window/*.inl",
       "src/SFML/Window/*.cpp"
    }
   
    links { "SFML-system" }

    filter "system:windows"

       files 
       {
           "src/SFML/Window/Win32/*.cpp"
       }

       removefiles 
       {
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

	files
 	{
            "src/SFML/Window/OSX/*.cpp",
            "src/SFML/Window/OSX/*.mm",
	    "src/SFML/Window/OSX/*.m"
        }
    
	removefiles {
            "src/SFML/Window/EGLCheck.cpp",
            "src/SFML/Window/EglContext.cpp"
        }

     filter "action:android"
 
        files 
        {
           "src/SFML/Window/Android/*.cpp"
        }
     
     filter{}

    
     zpm.export(function()

        filter "system:macosx"

            linkoptions { "-ObjC -framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL" }

        filter "system:windows"
		
	    links { "OpenGL32", "Winmm" }

        filter {}

  
 
        includedirs {
            "include"
        }

        defines { "SFML_STATIC" }

    end)


