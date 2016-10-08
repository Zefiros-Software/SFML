
project "SFML"

    kind "StaticLib"
 
    print ( "DEBUG" );
    print ( _ACTION );   

    -- generic
    files {
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
 
    --filter "action:gmake"   
    filter "system:macosx"
    
       files {
       "src/SFML/Network/Unix/*.cpp",
       "src/SFML/System/Unix/*.cpp",
       "src/SFML/Window/OSX/*.cpp",
       "src/SFML/Window/OSX/*.hpp",
       "src/SFML/Window/OSX/*.h,"
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
 
	filter "system:macosx"

            linkoptions { "-framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL" }

	filter {}
	    
        includedirs { 
            "include"
        }

    end)
