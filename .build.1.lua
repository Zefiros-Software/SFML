
project "SFML"

    kind "StaticLib"
 
    defines
    {
        "SFML_SYSTEM_EXPORTS",
        "SFML_AUDIO_EXPORTS",
        "SFML_GRAPHICS_EXPORTS",
        "SFML_WINDOW_EXPORTS",
        "SFML_NETWORK_EXPORTS"
    }

    -- generic
    files {
       "include/SFML/*.hpp", 
       "include/SFML/Network/*.hpp",
       "include/SFML/System/*.hpp",
       "include/SFML/Window/*.hpp",
       "include/SFML/Network/*.inl",
       "include/SFML/System/*.inl",
       "include/SFML/Window/*.inl",
       "src/SFML/Network/*.cpp",
       "src/SFML/System/*.cpp",
       "src/SFML/Window/*.cpp"
    }

    filter "system:windows"
     	
       files {
       "src/SFML/Network/Win32/*.cpp",
       "src/SFML/System/Win32/*.cpp",
       "src/SFML/Window/Win32/*.cpp"
    	}
 
	removefiles {
	    "src/SFML/Window/EGLCheck.cpp",
            "src/SFML/Window/EglContext.cpp"
        }
   
    filter "system:linux"
    
       files {
       "src/SFML/Network/Unix/*.cpp",
       "src/SFML/System/Unix/*.cpp",
       "src/SFML/Window/Unix/*.cpp"
        }

        removefiles {
            "src/SFML/Window/EGLCheck.cpp",
            "src/SFML/Window/EglContext.cpp"
        }
 
    filter "system:macosx"
    
       files {
       "src/SFML/Network/Unix/*.cpp",
       "src/SFML/System/Unix/*.cpp",
       "src/SFML/Window/OSX/*.cpp",
       "src/SFML/Window/OSX/*.hpp",
       "src/SFML/Window/OSX/*.h",
       "src/SFML/Window/OSX/*.mm",
       "src/SFML/Window/OSX/*.m",
       "src/SFML/Window/OSX/SFOpenGLView+keyboard.mm"
        } 

	removefiles {
            "src/SFML/Window/EGLCheck.cpp",
            "src/SFML/Window/EglContext.cpp"
        }

    filter "action:android"
 
       files {
       "src/SFML/System/Android/*.cpp",
       "src/SFML/Window/Android/*.cpp"	    
       }



    filter {}
    	

 
    includedirs {
       "include",
       "src"
    }

    --TODO ios and android!

    zpm.export(function()
 
        defines
    {
        "SFML_SYSTEM_EXPORTS",
        "SFML_AUDIO_EXPORTS",
        "SFML_GRAPHICS_EXPORTS",
        "SFML_WINDOW_EXPORTS",
        "SFML_NETWORK_EXPORTS"
    }

	filter "system:macosx"

            linkoptions { "-framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL" }

	filter {}
	    
        includedirs { 
            "include"
        }

    end)
