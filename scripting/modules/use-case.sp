bool UseCase_IsClientIgnored(int client) {
    if (IsAdmin(client) && Variable_IgnoreAdmins()) {
        return true;
    }

    if (IsVip(client) && Variable_IgnoreVips()) {
        return true;
    }

    return false;
}

static bool IsAdmin(int client) {
    AdminId id = GetUserAdmin(client);

    return id.HasFlag(Admin_Generic);
}

static bool IsVip(int client) {
    char steam[MAX_AUTHID_LENGTH];

    GetClientAuthId(client, AuthId_Steam3, steam, sizeof(steam));

    return VipList_Exists(steam);
}

void UseCase_LoadVips(int client) {
    Storage_LoadVips();
    Message_VipsLoaded(client);
}
