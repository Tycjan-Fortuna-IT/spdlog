project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"
    
    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    defines 
    {
        "SPDLOG_COMPILED_LIB"
    }
    
    files
    {
        "include/spdlog/**.h",
        "src/**.cpp"
    }
    
    includedirs
    {
        "include"
    }
    
    filter "system:windows"
        systemversion "latest"
        
        filter "configurations:Debug"
        defines "DEBUG"
        runtime "Debug"
        symbols "on"

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
