static ArrayList g_byIndex;
static StringMap g_bySteam;

void VipList_Create() {
    int blockSize = ByteCountToCells(MAX_AUTHID_LENGTH);

    g_byIndex = new ArrayList(blockSize);
    g_bySteam = new StringMap();
}

void VipList_Clear() {
    g_byIndex.Clear();
    g_bySteam.Clear();
}

void VipList_Add(const char[] steam) {
    g_byIndex.PushString(steam);
    g_bySteam.SetValue(steam, NO_VALUE);
}

void VipList_RemoveBySteam(const char[] steam) {
    int index = g_byIndex.FindString(steam);

    g_byIndex.Erase(index);
    g_bySteam.Remove(steam);
}

void VipList_Get(int index, char[] steam) {
    g_byIndex.GetString(index, steam, MAX_AUTHID_LENGTH);
}

bool VipList_Exists(const char[] steam) {
    return g_bySteam.ContainsKey(steam);
}

int VipList_Size() {
    return g_byIndex.Length;
}
