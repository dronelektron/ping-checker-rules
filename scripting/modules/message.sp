void Message_AddVipUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: sm_pingchecker_vip_add <steamid3>");
}

void Message_RemoveVipUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: sm_pingchecker_vip_remove <steamid3>");
}

void Message_VipAlreadyExists(int client, const char[] steam) {
    ReplyToCommand(client, "%s%t", PREFIX, "Vip already exists", steam);
}

void Message_VipAdded(int client, const char[] steam) {
    ShowActivity2(client, PREFIX, "%t", "Vip added", steam);
    LogMessage("\"%L\" added '%s' to the list", client, steam);
}

void Message_VipNotFound(int client, const char[] steam) {
    ReplyToCommand(client, "%s%t", PREFIX, "Vip not found", steam);
}

void Message_VipRemoved(int client, const char[] steam) {
    ShowActivity2(client, PREFIX, "%t", "Vip removed", steam);
    LogMessage("\"%L\" removed '%s' from the list", client, steam);
}

void Message_VipsSaved(int client) {
    ShowActivity2(client, PREFIX, "%t", "Vips saved");
    LogMessage("\"%L\" saved the VIP players", client);
}

void Message_VipsLoaded(int client) {
    ShowActivity2(client, PREFIX, "%t", "Vips loaded");
    LogMessage("\"%L\" loaded the VIP players", client);
}
