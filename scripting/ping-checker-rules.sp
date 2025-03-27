#include <sourcemod>

#include "ping-checker/api"

#include "modules/console-variable.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Ping checker rules",
    author = "Dron-elektron",
    description = "Allows you to ignore admins and VIP players",
    version = "0.1.0",
    url = "https://github.com/dronelektron/ping-checker-rules"
};

public void OnPluginStart() {
    Variable_Create();
    AutoExecConfig(_, "ping-checker-rules");
}

public Action PingChecker_OnClient(int client) {
    if (UseCase_IsClientIgnored(client)) {
        return Plugin_Stop;
    }

    return Plugin_Continue;
}
