static ConVar g_ignoreAdmins;
static ConVar g_ignoreVips;

void Variable_Create() {
    g_ignoreAdmins = CreateConVar("sm_pingchecker_ignore_admins", "1", "Ignore admins (yes - 1, no - 0)");
    g_ignoreVips = CreateConVar("sm_pingchecker_ignore_vips", "1", "Ignore VIP players (yes - 1, no - 0)");
}

bool Variable_IgnoreAdmins() {
    return g_ignoreAdmins.BoolValue;
}

bool Variable_IgnoreVips() {
    return g_ignoreVips.BoolValue;
}
