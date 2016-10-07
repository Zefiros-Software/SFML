
project "SFML"

    kind "StaticLib"
 
    print ( "DEBUG" );
    print ( _ACTION );   

    files {
       "src/**.cpp"
    }

    removefiles {
       "src/SFML/Audio/**.cpp",
       "src/SFML/Graphics/**.cpp",
       "src/SFML/Main/**.cpp",
       "src/SFML/System/Android/**.cpp", 
       "src/SFML/System/Unix/**.cpp", 
       "src/SFML/System/Win32/**.cpp", 
   }  
 
    includedirs {
       "include",
       "src"
    }

    --TODO ios and android!

    zpm.export(function()
     
        includedirs { 
            "include"
        }

    end)
