
project "SFML"

    kind "StaticLib"
 
    files {
       "src/Main/**.cpp",
       "src/Network/**.cpp",
       "src/System/**.cpp",
       "src/Window/**.cpp",
       "src/Graphics/**.cpp"
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
