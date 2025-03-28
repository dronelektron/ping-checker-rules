static Regex g_steam;

void Regex_Create() {
    g_steam = new Regex("^\\[U:1:[0-9]+\\]$");
}

bool Regex_IsBadSteam(const char[] steam) {
    return g_steam.MatchAll(steam) != 1;
}
