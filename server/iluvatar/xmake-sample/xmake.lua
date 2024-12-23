toolchain("iluvatar.toolchain")
    set_toolset("cc"  , "clang"  )
    set_toolset("cxx" , "clang++")
    set_toolset("cu"  , "clang++")
    set_toolset("culd", "clang++")
    set_toolset("cu-ccbin", "$(env CXX)", "$(env CC)")
toolchain_end()

rule("iluvatar.env")
    add_deps("cuda.env", {order = true})
    after_load(function (target)
        local old = target:get("syslinks")
        local new = {}

        for _, link in ipairs(old) do
            if link ~= "cudadevrt" then
                table.insert(new, link)
            end
        end

        if #old > #new then
            target:set("syslinks", new)
            local log = "cudadevrt removed, syslinks = { "
            for _, link in ipairs(new) do
                log = log .. link .. ", "
            end
            log = log:sub(0, -3) .. " }"
            print(log)
        end
    end)
rule_end()

target("iluvatar")
    set_kind("binary")    -- 目标将编译为二进制可执行文件
    add_files("src/*.cu") -- 目标使用的源文件是 src 目录下扩展名为 cu 的文件
    add_links("cudart")   -- 首选动态链接 cudart 以免链接 cudart_static

    set_toolchains("iluvatar.toolchain") -- 设置工具链
    add_rules("iluvatar.env")            -- 添加自定义处理规则
    set_values("cuda.rdc", false)        -- 关闭 -fcuda-rdc 以免生成依赖 cudadevrt 的代码
target_end()
