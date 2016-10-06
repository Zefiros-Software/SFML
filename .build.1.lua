
project "SFML"

    kind "StaticLib"
 
    

    files {
       "src/**.cpp"
    }

    removefiles {
       "src/SFML/Audio/**.cpp",
       "src/SFML/Graphics/**.cpp",
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
