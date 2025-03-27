bool UseCase_IsClientIgnored(int client) {
    return IsAdmin(client) && Variable_IgnoreAdmins();
}

static bool IsAdmin(int client) {
    AdminId id = GetUserAdmin(client);

    return id.HasFlag(Admin_Generic);
}
