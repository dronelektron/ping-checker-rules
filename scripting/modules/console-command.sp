void Command_Create() {
    RegAdminCmd("sm_pingchecker_vip_add", OnAddVip, ADMFLAG_GENERIC);
    RegAdminCmd("sm_pingchecker_vip_remove", OnRemoveVip, ADMFLAG_GENERIC);
    RegAdminCmd("sm_pingchecker_vips_save", OnSaveVips, ADMFLAG_GENERIC);
    RegAdminCmd("sm_pingchecker_vips_load", OnLoadVips, ADMFLAG_GENERIC);
}

static Action OnAddVip(int client, int args) {
    if (args < 1) {
        Message_AddVipUsage(client);

        return Plugin_Handled;
    }

    char steam[MAX_AUTHID_LENGTH];

    GetCmdArg(1, steam, sizeof(steam));
    UseCase_AddVip(client, steam);

    return Plugin_Handled;
}

static Action OnRemoveVip(int client, int args) {
    if (args < 1) {
        Message_RemoveVipUsage(client);

        return Plugin_Handled;
    }

    char steam[MAX_AUTHID_LENGTH];

    GetCmdArg(1, steam, sizeof(steam));
    UseCase_RemoveVip(client, steam);

    return Plugin_Handled;
}

static Action OnSaveVips(int client, int args) {
    UseCase_SaveVips(client);

    return Plugin_Handled;
}

static Action OnLoadVips(int client, int args) {
    UseCase_LoadVips(client);

    return Plugin_Handled;
}
