project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    defines {
        "SPDLOG_COMPILED_LIB",
        "_SILENCE_STDEXT_ARR_ITERS_DEPRECATION_WARNING",
    }
    
    files {
        "include/spdlog/**.h",
        "src/**.cpp"
    }
    
    includedirs {
        "include"
    }
    
    filter "system:windows"
        systemversion "latest"
        
        filter "configurations:Debug"
        defines "DEBUG"
        runtime "Debug"
        symbols "on"

    filter "system:linux"
		pic "On"
		systemversion "latest"

    filter "configurations:Release"
        defines "RELEASE"
        runtime "Release"
        optimize "on"
        symbols "on"

    filter "configurations:Dist"
        defines "DIST"    
        runtime "Release"
        optimize "on"
        symbols "off"
