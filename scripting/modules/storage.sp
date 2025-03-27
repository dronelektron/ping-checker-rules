static char g_configPath[PLATFORM_MAX_PATH];

void Storage_BuildPath() {
    BuildPath(Path_SM, g_configPath, sizeof(g_configPath), "configs/ping-checker-rules-vips.txt");
}

void Storage_LoadVips() {
    VipList_Clear();

    if (!FileExists(g_configPath)) {
        return;
    }

    File file = OpenFile(g_configPath, "r");

    if (file == null) {
        LogError("Unable to open the '%s' config file", g_configPath);

        return;
    }

    char steam[MAX_AUTHID_LENGTH];

    while (file.ReadLine(steam, sizeof(steam))) {
        TrimString(steam);

        if (IsEmptyString(steam)) {
            continue;
        }

        VipList_Add(steam);
    }

    CloseHandle(file);
}

static bool IsEmptyString(const char[] text) {
    return text[0] == '\0';
}
