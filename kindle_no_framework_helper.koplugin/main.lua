local Dispatcher = require("dispatcher")  -- luacheck:ignore
local WidgetContainer = require("ui/widget/container/widgetcontainer")

local initialized = false


local Helper = WidgetContainer:new{
    name = "kindle_no_framework_helper",
    is_doc_only = false,
}

function Helper:init()
    if not initialized then
        local haslipc, lipc = pcall(require, "liblipclua")
        if haslipc and lipc then
            self.lipc_handle, error_message, error_number = lipc.init("com.lab126.kaf")
        end

        if self.lipc_handle ~= nil then
            local framework_started_property = self.lipc_handle:register_int_property("frameworkStarted", "r")
            framework_started_property.value = 1
            self.lipc_handle:set_string_property("com.lab126.blanket", "unload", "splash")
            self.lipc_handle:set_string_property("com.lab126.blanket", "unload", "screensaver")
        end

        initialized = true
    end
end


function Helper:onExit()
    if self.lipc_handle ~= nil then
        self.lipc_handle:set_string_property("com.lab126.blanket", "load", "screensaver")
        self.lipc_handle:set_string_property("com.lab126.blanket", "load", "splash")
        self.lipc_handle:close()
    end
end


return Helper
