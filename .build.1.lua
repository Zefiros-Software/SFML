
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
       --"src/SFML/Window/OSX/*.cpp",
       --"src/SFML/Window/OSX/*.hpp",
       --"src/SFML/Window/OSX/*.h",
       --"src/SFML/Window/OSX/*.mm",
       --"src/SFML/Window/OSX/*.m",
       --"src/SFML/Window/OSX/SFOpenGLView+keyboard.mm"
        } 

	files
        {
        "src/SFML/Window/OSX/cpp_objc_conversion.h",
        "src/SFML/Window/OSX/cpp_objc_conversion.mm",
        "src/SFML/Window/OSX/cg_sf_conversion.hpp",
        "src/SFML/Window/OSX/cg_sf_conversion.mm",
        "src/SFML/Window/OSX/InputImpl.mm",
        "src/SFML/Window/OSX/InputImpl.hpp",
        "src/SFML/Window/OSX/HIDInputManager.hpp",
        "src/SFML/Window/OSX/HIDInputManager.mm",
        "src/SFML/Window/OSX/HIDJoystickManager.hpp",
        "src/SFML/Window/OSX/HIDJoystickManager.cpp",
        "src/SFML/Window/OSX/JoystickImpl.cpp",
        "src/SFML/Window/OSX/JoystickImpl.hpp",
        "src/SFML/Window/OSX/NSImage+raw.h",
        "src/SFML/Window/OSX/NSImage+raw.mm",
        "src/SFML/Window/OSX/Scaling.h",
        "src/SFML/Window/OSX/SensorImpl.cpp",
        "src/SFML/Window/OSX/SensorImpl.hpp",
        "src/SFML/Window/OSX/SFApplication.h",
        "src/SFML/Window/OSX/SFApplication.m",
        "src/SFML/Window/OSX/SFApplicationDelegate.h",
        "src/SFML/Window/OSX/SFApplicationDelegate.m",
        "src/SFML/Window/OSX/SFContext.hpp",
        "src/SFML/Window/OSX/SFContext.mm",
        "src/SFML/Window/OSX/SFKeyboardModifiersHelper.h",
        "src/SFML/Window/OSX/SFKeyboardModifiersHelper.mm",
        "src/SFML/Window/OSX/SFOpenGLView.h",
        "src/SFML/Window/OSX/SFOpenGLView.mm",
        "src/SFML/Window/OSX/SFOpenGLView+keyboard.mm",
        "src/SFML/Window/OSX/SFOpenGLView+keyboard_priv.h",
        "src/SFML/Window/OSX/SFOpenGLView+mouse.mm",
        "src/SFML/Window/OSX/SFOpenGLView+mouse_priv.h",
        "src/SFML/Window/OSX/SFSilentResponder.h",
        "src/SFML/Window/OSX/SFSilentResponder.m",
        "src/SFML/Window/OSX/SFWindow.h",
        "src/SFML/Window/OSX/SFWindow.m",
        "src/SFML/Window/OSX/SFWindowController.h",
        "src/SFML/Window/OSX/SFWindowController.mm",
        "src/SFML/Window/OSX/SFViewController.h",
        "src/SFML/Window/OSX/SFViewController.mm",
        "src/SFML/Window/OSX/VideoModeImpl.cpp",
        "src/SFML/Window/OSX/WindowImplCocoa.hpp",
        "src/SFML/Window/OSX/WindowImplCocoa.mm",
        "src/SFML/Window/OSX/WindowImplDelegateProtocol.h",
        "src/SFML/Window/OSX/AutoreleasePoolWrapper.h",
        "src/SFML/Window/OSX/AutoreleasePoolWrapper.mm"
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

            linkoptions { "-ObjC -framework CoreFoundation -framework AppKit -framework IOKit -framework Carbon -framework OpenGL" }
	 
	filter {}
	    
        includedirs { 
            "include"
        }

    end)
