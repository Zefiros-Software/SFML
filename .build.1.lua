
project "SFML"

    kind "StaticLib"
 
    

    files {
       "src/**.cpp"
    }

    removefiles {
       "src/Audio/**.cpp"
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
