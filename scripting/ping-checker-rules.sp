#include <sourcemod>
#include <regex>

#include "ping-checker/api"

#include "ping-checker-rules/message"
#include "ping-checker-rules/vip-list"

#include "modules/console-command.sp"
#include "modules/console-variable.sp"
#include "modules/message.sp"
#include "modules/regex.sp"
#include "modules/storage.sp"
#include "modules/use-case.sp"
#include "modules/vip-list.sp"

public Plugin myinfo = {
    name = "Ping checker rules",
    author = "Dron-elektron",
    description = "Allows you to ignore admins and VIP players",
    version = "1.0.0",
    url = "https://github.com/dronelektron/ping-checker-rules"
};

public void OnPluginStart() {
    Command_Create();
    Variable_Create();
    Regex_Create();
    VipList_Create();
    Storage_BuildPath();
    Storage_LoadVips();
    LoadTranslations("ping-checker-rules.phrases");
    AutoExecConfig(_, "ping-checker-rules");
}

public Action PingChecker_OnClient(int client) {
    return UseCase_IsClientIgnored(client) ? Plugin_Stop : Plugin_Continue;
}
