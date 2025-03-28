# Ping checker rules

Allows you to ignore admins and VIP players

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later
* [ping-checker](https://github.com/dronelektron/ping-checker)

### Installation

* Download latest [release](https://github.com/dronelektron/ping-checker-rules/releases)
* Extract `plugins` and `translations` folders to `addons/sourcemod` folder of your server

### Console Commands

* sm_pingchecker_vip_add &lt;steamid3&gt; - Add SteamID3 to the list
* sm_pingchecker_vip_remove &lt;steamid3&gt; - Remove SteamID3 from the list
* sm_pingchecker_vips_save - Save VIP players to the file
* sm_pingchecker_vips_load - Load VIP players from the file

### Console Variables

* sm_pingchecker_ignore_admins - Ignore admins (yes - 1, no - 0) [default: "1"]
* sm_pingchecker_ignore_vips - Ignore VIP players (yes - 1, no - 0) [default: "1"]
