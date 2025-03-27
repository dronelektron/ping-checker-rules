#include <sourcemod>

#include "ping-checker/api"

#include "ping-checker-rules/vip-list"

#include "modules/console-variable.sp"
#include "modules/storage.sp"
#include "modules/use-case.sp"
#include "modules/vip-list.sp"

public Plugin myinfo = {
    name = "Ping checker rules",
    author = "Dron-elektron",
    description = "Allows you to ignore admins and VIP players",
    version = "0.1.0",
    url = "https://github.com/dronelektron/ping-checker-rules"
};

public void OnPluginStart() {
    Variable_Create();
    Storage_BuildPath();
    VipList_Create();
    AutoExecConfig(_, "ping-checker-rules");
}

public void OnMapStart() {
    Storage_LoadVips();
}

public Action PingChecker_OnClient(int client) {
    if (UseCase_IsClientIgnored(client)) {
        return Plugin_Stop;
    }

    return Plugin_Continue;
}
