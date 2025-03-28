void Command_Create() {
    RegAdminCmd("sm_pingchecker_vips_load", OnLoadVips, ADMFLAG_GENERIC);
}

static Action OnLoadVips(int client, int args) {
    UseCase_LoadVips(client);

    return Plugin_Handled;
}
