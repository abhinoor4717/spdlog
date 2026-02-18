project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    includedirs {
        "include"
    }

    files {
        "include/**.h",
        "include/**.tcc",
        "src/**.cpp"
    }

    defines {
        "SPDLOG_COMPILED_LIB"
    }


    filter "system:windows"
        systemversion "latest"

    filter "action:vs*"
        buildoptions {
            "/utf-8"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
