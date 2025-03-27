static ConVar g_ignoreAdmins;

void Variable_Create() {
    g_ignoreAdmins = CreateConVar("sm_pingchecker_ignore_admins", "1", "Ignore admins (yes - 1, no - 0)");
}

bool Variable_IgnoreAdmins() {
    return g_ignoreAdmins.BoolValue;
}
