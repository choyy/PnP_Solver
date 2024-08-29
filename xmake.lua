set_project("EPnP")
add_rules("plugin.compile_commands.autoupdate", {outputdir = "build"})

add_rules("mode.debug", "mode.release")
set_config("arch", "x64")
add_requires("eigen")


target("EPnP")
    add_rules("qt.console")
    -- 检查是否为MSVC编译器并添加/bigobj选项
    if is_host("windows") and is_mode("debug") then
        add_cxxflags("/bigobj")
    end
    add_packages("eigen")
    add_includedirs(".")
    add_files("./*.cpp")

