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

void UseCase_AddVip(int client, const char[] steam) {
    if (Regex_IsBadSteam(steam)) {
        Message_InvalidSteamFormat(client);

        return;
    }

    if (VipList_Exists(steam)) {
        Message_VipAlreadyExists(client, steam);

        return;
    }

    VipList_Add(steam);
    Message_VipAdded(client, steam);
}

void UseCase_RemoveVip(int client, const char[] steam) {
    if (Regex_IsBadSteam(steam)) {
        Message_InvalidSteamFormat(client);

        return;
    }

    if (!VipList_Exists(steam)) {
        Message_VipNotFound(client, steam);

        return;
    }

    VipList_RemoveBySteam(steam);
    Message_VipRemoved(client, steam);
}

void UseCase_SaveVips(int client) {
    Storage_SaveVips();
    Message_VipsSaved(client);
}

void UseCase_LoadVips(int client) {
    Storage_LoadVips();
    Message_VipsLoaded(client);
}
