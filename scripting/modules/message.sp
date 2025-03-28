void Message_VipsLoaded(int client) {
    ShowActivity2(client, PREFIX, "%t", "Vips loaded");
    LogMessage("\"%L\" loaded the VIP players", client);
}
