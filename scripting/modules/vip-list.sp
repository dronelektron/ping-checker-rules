static StringMap g_vips;

void VipList_Create() {
    g_vips = new StringMap();
}

void VipList_Clear() {
    g_vips.Clear();
}

void VipList_Add(const char[] steam) {
    g_vips.SetValue(steam, NO_VALUE);
}

bool VipList_Exists(const char[] steam) {
    return g_vips.ContainsKey(steam);
}
