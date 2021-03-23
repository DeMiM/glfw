-- Vendor: GLFW

project "omega-vendor-glfw"
	location (OFFSET_PRJ)

	filter { "configurations:debug" }
		defines  "DEBUG"
		runtime  "Debug"
		symbols  "On"
	filter { "configurations:release" }
		defines  "NDEBUG"
		runtime  "Release"
		optimize "On"		
	filter {}

	kind          "StaticLib"
	language      "C"
	characterset  "MBCS"
	staticruntime "On"

	targetdir (OFFSET_PRJ .. OUTPUT_BIN .. "/%{prj.name}")
	objdir (OFFSET_PRJ .. OUTPUT_OBJ .. "/%{prj.name}")

	includedirs	{ "include", "src" }

	files {
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/internal.h",
		"src/mappings.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c"
	}

	filter { "system:windows" }
		systemversion "latest"
		defines { "WIN32", "_WINDOWS", "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }
		files {			
			"src/win32_platform.h",
			"src/win32_joystick.h",
			"src/wgl_context.h",
			"src/egl_context.h",
			"src/osmesa_context.h",
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}
	filter {}

