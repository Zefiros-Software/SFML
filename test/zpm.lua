
workspace "SFML"
   configurations { "Test" }
   startproject "SFML"

    project "SFML"
        kind "ConsoleApp"
        files "main.cpp"

        zpm.uses "Zefiros-Software/SFML"