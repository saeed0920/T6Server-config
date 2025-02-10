// IW5 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"MP_KILLSTREAK_N" );
    precachestring( &"MP_NUKE_ALREADY_INBOUND" );
    precachestring( &"MP_UNAVILABLE_IN_LASTSTAND" );
    precachestring( &"MP_UNAVAILABLE_FOR_N_WHEN_EMP" );
    precachestring( &"MP_UNAVAILABLE_FOR_N_WHEN_NUKE" );
    precachestring( &"MP_UNAVAILABLE_USING_TURRET" );
    precachestring( &"MP_UNAVAILABLE_WHEN_INCAP" );
    precachestring( &"MP_HELI_IN_QUEUE" );
    precachestring( &"MP_SPECIALIST_STREAKING_XP" );
    precachestring( &"MP_AIR_SPACE_TOO_CROWDED" );
    precachestring( &"MP_CIVILIAN_AIR_TRAFFIC" );
    precachestring( &"MP_TOO_MANY_VEHICLES" );
    precachestring( &"SPLASHES_HEADSHOT" );
    precachestring( &"SPLASHES_FIRSTBLOOD" );
    precachestring( &"MP_ASSIST" );
    precachestring( &"MP_ASSIST_TO_KILL" );
    precacheshader( "hud_killstreak_dpad_arrow_down" );
    precacheshader( "hud_killstreak_dpad_arrow_right" );
    precacheshader( "hud_killstreak_dpad_arrow_up" );
    precacheshader( "hud_killstreak_frame" );
    precacheshader( "hud_killstreak_frame_fade_top" );
    precacheshader( "hud_killstreak_highlight" );
    precacheshader( "hud_killstreak_bar_empty" );
    precacheshader( "hud_killstreak_bar_full" );
    initkillstreakdata();
    level.killstreakfuncs = [];
    level.killstreaksetupfuncs = [];
    level.killstreakweapons = [];
    thread maps\mp\killstreaks\_ac130::init();
    thread maps\mp\killstreaks\_remotemissile::init();
    thread maps\mp\killstreaks\_uav::init();
    thread maps\mp\killstreaks\_airstrike::init();
    thread maps\mp\killstreaks\_airdrop::init();
    thread maps\mp\killstreaks\_helicopter::init();
    thread maps\mp\killstreaks\_helicopter_flock::init();
    thread maps\mp\killstreaks\_helicopter_guard::init();
    thread maps\mp\killstreaks\_autosentry::init();
    thread maps\mp\killstreaks\_emp::init();
    thread maps\mp\killstreaks\_nuke::init();
    thread maps\mp\killstreaks\_escortairdrop::init();
    thread maps\mp\killstreaks\_remotemortar::init();
    thread maps\mp\killstreaks\_deployablebox::init();
    thread maps\mp\killstreaks\_ims::init();
    thread maps\mp\killstreaks\_perkstreaks::init();
    thread maps\mp\killstreaks\_remoteturret::init();
    thread maps\mp\killstreaks\_remoteuav::init();
    thread maps\mp\killstreaks\_remotetank::init();
    thread maps\mp\killstreaks\_juggernaut::init();
    level.killstreakweildweapons = [];
    level.killstreakweildweapons["cobra_player_minigun_mp"] = 1;
    level.killstreakweildweapons["artillery_mp"] = 1;
    level.killstreakweildweapons["stealth_bomb_mp"] = 1;
    level.killstreakweildweapons["pavelow_minigun_mp"] = 1;
    level.killstreakweildweapons["sentry_minigun_mp"] = 1;
    level.killstreakweildweapons["harrier_20mm_mp"] = 1;
    level.killstreakweildweapons["ac130_105mm_mp"] = 1;
    level.killstreakweildweapons["ac130_40mm_mp"] = 1;
    level.killstreakweildweapons["ac130_25mm_mp"] = 1;
    level.killstreakweildweapons["remotemissile_projectile_mp"] = 1;
    level.killstreakweildweapons["cobra_20mm_mp"] = 1;
    level.killstreakweildweapons["nuke_mp"] = 1;
    level.killstreakweildweapons["apache_minigun_mp"] = 1;
    level.killstreakweildweapons["littlebird_guard_minigun_mp"] = 1;
    level.killstreakweildweapons["uav_strike_marker_mp"] = 1;
    level.killstreakweildweapons["osprey_minigun_mp"] = 1;
    level.killstreakweildweapons["strike_marker_mp"] = 1;
    level.killstreakweildweapons["a10_30mm_mp"] = 1;
    level.killstreakweildweapons["manned_minigun_turret_mp"] = 1;
    level.killstreakweildweapons["manned_gl_turret_mp"] = 1;
    level.killstreakweildweapons["airdrop_trap_explosive_mp"] = 1;
    level.killstreakweildweapons["uav_strike_projectile_mp"] = 1;
    level.killstreakweildweapons["remote_mortar_missile_mp"] = 1;
    level.killstreakweildweapons["manned_littlebird_sniper_mp"] = 1;
    level.killstreakweildweapons["iw5_m60jugg_mp"] = 1;
    level.killstreakweildweapons["iw5_mp412jugg_mp"] = 1;
    level.killstreakweildweapons["iw5_riotshieldjugg_mp"] = 1;
    level.killstreakweildweapons["iw5_usp45jugg_mp"] = 1;
    level.killstreakweildweapons["remote_turret_mp"] = 1;
    level.killstreakweildweapons["osprey_player_minigun_mp"] = 1;
    level.killstreakweildweapons["deployable_vest_marker_mp"] = 1;
    level.killstreakweildweapons["ugv_turret_mp"] = 1;
    level.killstreakweildweapons["ugv_gl_turret_mp"] = 1;
    level.killstreakweildweapons["uav_remote_mp"] = 1;
    level.killstreakchainingweapons = [];
    level.killstreakchainingweapons["remotemissile_projectile_mp"] = "predator_missile";
    level.killstreakchainingweapons["ims_projectile_mp"] = "ims";
    level.killstreakchainingweapons["sentry_minigun_mp"] = "airdrop_sentry_minigun";
    level.killstreakchainingweapons["artillery_mp"] = "precision_airstrike";
    level.killstreakchainingweapons["cobra_20mm_mp"] = "helicopter";
    level.killstreakchainingweapons["apache_minigun_mp"] = "littlebird_flock";
    level.killstreakchainingweapons["littlebird_guard_minigun_mp"] = "littlebird_support";
    level.killstreakchainingweapons["remote_mortar_missile_mp"] = "remote_mortar";
    level.killstreakchainingweapons["ugv_turret_mp"] = "airdrop_remote_tank";
    level.killstreakchainingweapons["ugv_gl_turret_mp"] = "airdrop_remote_tank";
    level.killstreakchainingweapons["pavelow_minigun_mp"] = "helicopter_flares";
    level.killstreakchainingweapons["ac130_105mm_mp"] = "ac130";
    level.killstreakchainingweapons["ac130_40mm_mp"] = "ac130";
    level.killstreakchainingweapons["ac130_25mm_mp"] = "ac130";
    level.killstreakchainingweapons["iw5_m60jugg_mp"] = "airdrop_juggernaut";
    level.killstreakchainingweapons["iw5_mp412jugg_mp"] = "airdrop_juggernaut";
    level.killstreakchainingweapons["osprey_player_minigun_mp"] = "osprey_gunner";
    level.killstreakrounddelay = maps\mp\_utility::getintproperty( "scr_game_killstreakdelay", 8 );
    level thread onplayerconnect();
}

initkillstreakdata()
{
    var_0 = 1;

    for (;;)
    {
        var_1 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 1 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_2 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 1 );
        var_3 = tablelookupistring( "mp/killstreakTable.csv", 0, var_0, 6 );
        precachestring( var_3 );
        var_4 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 8 );
        game["dialog"][var_2] = var_4;
        var_5 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 9 );
        game["dialog"]["allies_friendly_" + var_2 + "_inbound"] = "use_" + var_5;
        game["dialog"]["allies_enemy_" + var_2 + "_inbound"] = "enemy_" + var_5;
        var_6 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 10 );
        game["dialog"]["axis_friendly_" + var_2 + "_inbound"] = "use_" + var_6;
        game["dialog"]["axis_enemy_" + var_2 + "_inbound"] = "enemy_" + var_6;
        var_7 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 12 );
        precacheitem( var_7 );
        var_8 = int( tablelookup( "mp/killstreakTable.csv", 0, var_0, 13 ) );
        maps\mp\gametypes\_rank::registerscoreinfo( "killstreak_" + var_2, var_8 );
        var_9 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 14 );
        precacheshader( var_9 );
        var_9 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 15 );

        if ( var_9 != "" )
            precacheshader( var_9 );

        var_9 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 16 );

        if ( var_9 != "" )
            precacheshader( var_9 );

        var_9 = tablelookup( "mp/killstreakTable.csv", 0, var_0, 17 );

        if ( var_9 != "" )
            precacheshader( var_9 );

        var_0++;
    }
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["killstreaks"] ) )
            var_0.pers["killstreaks"] = [];

        if ( !isdefined( var_0.pers["kID"] ) )
            var_0.pers["kID"] = 10;

        var_0.lifeid = 0;
        var_0.curdefvalue = 0;

        if ( isdefined( var_0.pers["deaths"] ) )
            var_0.lifeid = var_0.pers["deaths"];

        var_0 visionsetmissilecamforplayer( game["thermal_vision"] );
        var_0 thread onplayerspawned();
        var_0.spupdatetotal = 0;
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );

        thread killstreakusewaiter();
        thread waitforchangeteam();

        inittrackerdata();
        thread watchgamepad();
        thread streakusekeyboardtracker();
        thread streakusegamepadtracker();
        thread streakselectuptracker();
        thread streakselectdowntracker();
        thread streaknotifytracker();

        if ( !isdefined( self.pers["killstreaks"][0] ) )
            initplayerkillstreaks();

        if ( !isdefined( self.earnedstreaklevel ) )
            self.earnedstreaklevel = 0;

        if ( !isdefined( self.adrenaline ) )
            self.adrenaline = self getplayerdata( "killstreaksState", "count" );

        setstreakcounttonext();
        updatestreakslots();

        if ( self.streaktype == "specialist" )
        {
            updatespecialistkillstreaks();
            continue;
        }

        giveownedkillstreakitem();
    }
}

initplayerkillstreaks()
{
    if ( !isdefined( self.streaktype ) )
        return;

    if ( self.streaktype == "specialist" )
        self setplayerdata( "killstreaksState", "isSpecialist", 1 );
    else
        self setplayerdata( "killstreaksState", "isSpecialist", 0 );

    self.pers["killstreaks"][0] = spawnstruct();
    self.pers["killstreaks"][0].available = 0;
    self.pers["killstreaks"][0].streakname = undefined;
    self.pers["killstreaks"][0].earned = 0;
    self.pers["killstreaks"][0].awardxp = undefined;
    self.pers["killstreaks"][0].owner = undefined;
    self.pers["killstreaks"][0].kid = undefined;
    self.pers["killstreaks"][0].lifeid = undefined;
    self.pers["killstreaks"][0].isgimme = 1;
    self.pers["killstreaks"][0].isspecialist = 0;
    self.pers["killstreaks"][0].nextslot = undefined;

    for ( var_0 = 1; var_0 < 4; var_0++ )
    {
        self.pers["killstreaks"][var_0] = spawnstruct();
        self.pers["killstreaks"][var_0].available = 0;
        self.pers["killstreaks"][var_0].streakname = undefined;
        self.pers["killstreaks"][var_0].earned = 1;
        self.pers["killstreaks"][var_0].awardxp = 1;
        self.pers["killstreaks"][var_0].owner = undefined;
        self.pers["killstreaks"][var_0].kid = undefined;
        self.pers["killstreaks"][var_0].lifeid = -1;
        self.pers["killstreaks"][var_0].isgimme = 0;
        self.pers["killstreaks"][var_0].isspecialist = 0;
    }

    self.pers["killstreaks"][4] = spawnstruct();
    self.pers["killstreaks"][4].available = 0;
    self.pers["killstreaks"][4].streakname = "all_perks_bonus";
    self.pers["killstreaks"][4].earned = 1;
    self.pers["killstreaks"][4].awardxp = 0;
    self.pers["killstreaks"][4].owner = undefined;
    self.pers["killstreaks"][4].kid = undefined;
    self.pers["killstreaks"][4].lifeid = -1;
    self.pers["killstreaks"][4].isgimme = 0;
    self.pers["killstreaks"][4].isspecialist = 1;

    for ( var_0 = 0; var_0 < 4; var_0++ )
    {
        self setplayerdata( "killstreaksState", "icons", var_0, 0 );
        self setplayerdata( "killstreaksState", "hasStreak", var_0, 0 );
    }

    self setplayerdata( "killstreaksState", "hasStreak", 0, 0 );
    var_1 = 1;

    foreach ( var_3 in self.killstreaks )
    {
        self.pers["killstreaks"][var_1].streakname = var_3;
        self.pers["killstreaks"][var_1].isspecialist = self.streaktype == "specialist";
        var_4 = self.pers["killstreaks"][var_1].streakname;

        if ( self.streaktype == "specialist" )
        {
            var_5 = strtok( self.pers["killstreaks"][var_1].streakname, "_" );

            if ( var_5[var_5.size - 1] == "ks" )
            {
                var_6 = undefined;

                foreach ( var_8 in var_5 )
                {
                    if ( var_8 != "ks" )
                    {
                        if ( !isdefined( var_6 ) )
                        {
                            var_6 = var_8;
                            continue;
                        }

                        var_6 = var_6 + ( "_" + var_8 );
                    }
                }

                if ( maps\mp\_utility::isstrstart( self.pers["killstreaks"][var_1].streakname, "_" ) )
                    var_6 = "_" + var_6;

                if ( isdefined( var_6 ) && maps\mp\gametypes\_class::getperkupgrade( var_6 ) != "specialty_null" )
                    var_4 = self.pers["killstreaks"][var_1].streakname + "_pro";
            }
        }

        self setplayerdata( "killstreaksState", "icons", var_1, getkillstreakindex( var_4 ) );
        self setplayerdata( "killstreaksState", "hasStreak", var_1, 0 );
        var_1++;
    }

    self setplayerdata( "killstreaksState", "nextIndex", 1 );
    self setplayerdata( "killstreaksState", "selectedIndex", -1 );
    self setplayerdata( "killstreaksState", "numAvailable", 0 );
    self setplayerdata( "killstreaksState", "hasStreak", 4, 0 );
}

updatestreakcount()
{
    if ( !isdefined( self.pers["killstreaks"] ) )
        return;

    if ( self.adrenaline == self.previousadrenaline )
        return;

    var_0 = self.adrenaline;
    self setplayerdata( "killstreaksState", "count", self.adrenaline );

    if ( self.adrenaline >= self getplayerdata( "killstreaksState", "countToNext" ) )
        setstreakcounttonext();
}

resetstreakcount()
{
    self setplayerdata( "killstreaksState", "count", 0 );
    setstreakcounttonext();
}

setstreakcounttonext()
{
    if ( !isdefined( self.streaktype ) )
    {
        self setplayerdata( "killstreaksState", "countToNext", 0 );
        return;
    }

    if ( getmaxstreakcost() == 0 )
    {
        self setplayerdata( "killstreaksState", "countToNext", 0 );
        return;
    }

    if ( self.streaktype == "specialist" )
    {
        if ( self.adrenaline >= getmaxstreakcost() )
            return;
    }

    var_0 = getnextstreakname();

    if ( !isdefined( var_0 ) )
        return;

    var_1 = getstreakcost( var_0 );
    self setplayerdata( "killstreaksState", "countToNext", var_1 );
}

getnextstreakname()
{
    if ( self.adrenaline == getmaxstreakcost() && self.streaktype != "specialist" )
        var_0 = 0;
    else
        var_0 = self.adrenaline;

    foreach ( var_2 in self.killstreaks )
    {
        var_3 = getstreakcost( var_2 );

        if ( var_3 > var_0 )
            return var_2;
    }

    return undefined;
}

getmaxstreakcost()
{
    var_0 = 0;

    foreach ( var_2 in self.killstreaks )
    {
        var_3 = getstreakcost( var_2 );

        if ( var_3 > var_0 )
            var_0 = var_3;
    }

    return var_0;
}

updatestreakslots()
{
    if ( !isdefined( self.streaktype ) )
        return;

    if ( !maps\mp\_utility::isreallyalive( self ) )
        return;

    var_0 = 0;

    for ( var_1 = 0; var_1 < 4; var_1++ )
    {
        if ( isdefined( self.pers["killstreaks"][var_1] ) && isdefined( self.pers["killstreaks"][var_1].streakname ) )
        {
            self setplayerdata( "killstreaksState", "hasStreak", var_1, self.pers["killstreaks"][var_1].available );

            if ( self.pers["killstreaks"][var_1].available == 1 )
                var_0++;
        }
    }

    if ( self.streaktype != "specialist" )
        self setplayerdata( "killstreaksState", "numAvailable", var_0 );

    var_2 = self.earnedstreaklevel;
    var_3 = getmaxstreakcost();

    if ( self.earnedstreaklevel == var_3 && self.streaktype != "specialist" )
        var_2 = 0;

    var_4 = 1;

    foreach ( var_6 in self.killstreaks )
    {
        var_7 = getstreakcost( var_6 );

        if ( var_7 > var_2 )
        {
            var_8 = var_6;
            break;
        }

        if ( self.streaktype == "specialist" )
        {
            if ( self.earnedstreaklevel == var_3 )
                break;
        }

        var_4++;
    }

    self setplayerdata( "killstreaksState", "nextIndex", var_4 );

    if ( isdefined( self.killstreakindexweapon ) && self.streaktype != "specialist" )
        self setplayerdata( "killstreaksState", "selectedIndex", self.killstreakindexweapon );
    else if ( self.streaktype == "specialist" && self.pers["killstreaks"][0].available )
        self setplayerdata( "killstreaksState", "selectedIndex", 0 );
    else
        self setplayerdata( "killstreaksState", "selectedIndex", -1 );
}

waitforchangeteam()
{
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self notify( "waitForChangeTeam" );
    self endon( "waitForChangeTeam" );

    for (;;)
    {
        self waittill( "joined_team" );
        clearkillstreaks();
    }
}

isridekillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "helicopter_mk19":
        case "helicopter_minigun":
        case "remote_uav":
        case "remote_tank":
        case "remote_mortar":
        case "osprey_gunner":
        case "predator_missile":
        case "ac130":
            return 1;
        default:
            return 0;
    }
}

iscarrykillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "deployable_exp_ammo":
        case "gl_turret":
        case "sentry_gl":
        case "deployable_vest":
        case "ims":
        case "minigun_turret":
        case "sentry":
            return 1;
        default:
            return 0;
    }
}

deadlykillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "harrier_airstrike":
        case "helicopter_minigun":
        case "stealth_airstrike":
        case "littlebird_support":
        case "helicopter":
        case "remote_tank":
        case "remote_mortar":
        case "osprey_gunner":
        case "littlebird_flock":
        case "helicopter_flares":
        case "predator_missile":
        case "precision_airstrike":
        case "ac130":
            return 1;
    }

    return 0;
}

killstreakusepressed()
{
    var_0 = self.pers["killstreaks"][self.killstreakindexweapon].streakname;
    var_1 = self.pers["killstreaks"][self.killstreakindexweapon].lifeid;
    var_2 = self.pers["killstreaks"][self.killstreakindexweapon].earned;
    var_3 = self.pers["killstreaks"][self.killstreakindexweapon].awardxp;
    var_4 = self.pers["killstreaks"][self.killstreakindexweapon].kid;
    var_5 = self.pers["killstreaks"][self.killstreakindexweapon].isgimme;

    if ( !self isonground() && ( isridekillstreak( var_0 ) || iscarrykillstreak( var_0 ) ) )
        return 0;

    if ( maps\mp\_utility::isusingremote() )
        return 0;

    if ( isdefined( self.selectinglocation ) )
        return 0;

    if ( deadlykillstreak( var_0 ) && level.killstreakrounddelay && maps\mp\_utility::getgametypenumlives() )
    {
        if ( level.graceperiod - level.ingraceperiod < level.killstreakrounddelay )
        {
            self iprintlnbold( &"MP_UNAVAILABLE_FOR_N", level.killstreakrounddelay - ( level.graceperiod - level.ingraceperiod ) );
            return 0;
        }
    }

    if ( level.teambased && level.teamemped[self.team] || !level.teambased && isdefined( level.empplayer ) && level.empplayer != self )
    {
        if ( var_0 != "deployable_vest" )
        {
            self iprintlnbold( &"MP_UNAVAILABLE_FOR_N_WHEN_EMP", level.emptimeremaining );
            return 0;
        }
    }

    if ( isdefined( self.nuked ) && self.nuked )
    {
        if ( var_0 != "deployable_vest" )
        {
            self iprintlnbold( &"MP_UNAVAILABLE_FOR_N_WHEN_NUKE", level.nukeemptimeremaining );
            return 0;
        }
    }

    if ( self isusingturret() && ( isridekillstreak( var_0 ) || iscarrykillstreak( var_0 ) ) )
    {
        self iprintlnbold( &"MP_UNAVAILABLE_USING_TURRET" );
        return 0;
    }

    if ( isdefined( self.laststand ) && isridekillstreak( var_0 ) )
    {
        self iprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );
        return 0;
    }

    if ( !common_scripts\utility::isweaponenabled() )
        return 0;

    var_6 = 0;

    if ( maps\mp\_utility::_hasperk( "specialty_explosivebullets" ) && !issubstr( var_0, "explosive_ammo" ) )
        var_6 = 1;

    if ( issubstr( var_0, "airdrop" ) || var_0 == "littlebird_flock" )
    {
        if ( !self [[ level.killstreakfuncs[var_0] ]]( var_1, var_4 ) )
            return 0;
    }
    else if ( !self [[ level.killstreakfuncs[var_0] ]]( var_1 ) )
        return 0;

    if ( var_6 )
        maps\mp\_utility::_unsetperk( "specialty_explosivebullets" );

    thread updatekillstreaks();
    usedkillstreak( var_0, var_3 );
    return 1;
}

usedkillstreak( var_0, var_1 )
{
    self playlocalsound( "weap_c4detpack_trigger_plr" );

    if ( var_1 )
    {
        self thread [[ level.onxpevent ]]( "killstreak_" + var_0 );
        thread maps\mp\gametypes\_missions::usehardpoint( var_0 );
    }

    var_2 = maps\mp\_awards::getkillstreakawardref( var_0 );

    if ( isdefined( var_2 ) )
        thread maps\mp\_utility::incplayerstat( var_2, 1 );

    if ( isassaultkillstreak( var_0 ) )
        thread maps\mp\_utility::incplayerstat( "assaultkillstreaksused", 1 );
    else if ( issupportkillstreak( var_0 ) )
        thread maps\mp\_utility::incplayerstat( "supportkillstreaksused", 1 );
    else if ( isspecialistkillstreak( var_0 ) )
    {
        thread maps\mp\_utility::incplayerstat( "specialistkillstreaksearned", 1 );
        return;
    }

    var_3 = self.team;

    if ( level.teambased )
    {
        thread maps\mp\_utility::leaderdialog( var_3 + "_friendly_" + var_0 + "_inbound", var_3 );

        if ( getkillstreakinformenemy( var_0 ) )
            thread maps\mp\_utility::leaderdialog( var_3 + "_enemy_" + var_0 + "_inbound", level.otherteam[var_3] );
    }
    else
    {
        thread maps\mp\_utility::leaderdialogonplayer( var_3 + "_friendly_" + var_0 + "_inbound" );

        if ( getkillstreakinformenemy( var_0 ) )
        {
            var_4[0] = self;
            thread maps\mp\_utility::leaderdialog( var_3 + "_enemy_" + var_0 + "_inbound", undefined, undefined, var_4 );
        }
    }
}

updatekillstreaks( keepCurrent )
{
    if ( !isdefined( keepCurrent ) )
    {
        self.pers["killstreaks"][self.killstreakindexweapon].available = false;

        if ( self.killstreakindexweapon == 0 )
        {
            self.pers["killstreaks"][self.pers["killstreaks"][0].nextslot] = undefined;
            streakName = undefined;

            for ( i = 5; i < self.pers["killstreaks"].size; i++ )
            {
                if ( !isdefined( self.pers["killstreaks"][i] ) || !isdefined( self.pers["killstreaks"][i].streakname ) )
                    continue;

                streakName = self.pers["killstreaks"][i].streakname;
                self.pers["killstreaks"][0].nextslot = i;
            }

            if ( isdefined( streakName ) )
            {
                self.pers["killstreaks"][0].available = true;
                self.pers["killstreaks"][0].streakname = streakName;
                streakIndex = getkillstreakindex( streakName );
                self setplayerdata( "killstreaksState", "icons", 0, streakIndex );

                if ( !self is_player_gamepad_enabled() )
                {
                    var_4 = getkillstreakweapon( streakName );
                    maps\mp\_utility::_setactionslot( 4, "weapon", var_4 );
                }
            }
        }
    }

    highestStreakIndex = undefined;

    if ( self.streaktype == "specialist" )
    {
        if ( self.pers["killstreaks"][0].available )
            highestStreakIndex = 0;
    }
    else
    {
        for ( i = 0; i < 4; i++ )
        {
            if ( isdefined( self.pers["killstreaks"][i] ) && isdefined( self.pers["killstreaks"][i].streakname ) && self.pers["killstreaks"][i].available )
                highestStreakIndex = i;
        }
    }

    if ( isdefined( highestStreakIndex ) )
    {
        if ( self is_player_gamepad_enabled() )
        {
            self.killstreakindexweapon = highestStreakIndex;
            self.pers["lastEarnedStreak"] = self.pers["killstreaks"][highestStreakIndex].streakname;
            giveselectedkillstreakitem();
        }
        else
        {
            for ( i = 0; i < 4; i++ )
            {
                if ( isdefined( self.pers["killstreaks"][i] ) && isdefined( self.pers["killstreaks"][i].streakname ) && self.pers["killstreaks"][i].available )
                {
                    var_4 = getkillstreakweapon( self.pers["killstreaks"][i].streakname );
                    var_6 = self getweaponslistitems();
                    owned = false;

                    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
                    {
                        if ( var_4 == var_6[var_8] )
                        {
                            owned = true;
                            break;
                        }
                    }

                    if ( !owned )
                        maps\mp\_utility::_giveweapon( var_4 );
                    else if ( issubstr( var_4, "airdrop_" ) )
                        self setweaponammoclip( var_4, 1 );

                    maps\mp\_utility::_setactionslot( i + 4, "weapon", var_4 );
                }
            }

            self.killstreakindexweapon = undefined;
            self.pers["lastEarnedStreak"] = self.pers["killstreaks"][highestStreakIndex].streakname;
            updatestreakslots();
        }
    }
    else
    {
        self.killstreakindexweapon = undefined;
        self.pers["lastEarnedStreak"] = undefined;
        updatestreakslots();
    }
}

clearkillstreaks()
{
    for ( var_0 = self.pers["killstreaks"].size - 1; var_0 > -1; var_0-- )
    {
        if ( isdefined( self.pers["killstreaks"][var_0] ) )
            self.pers["killstreaks"][var_0] = undefined;
    }

    initplayerkillstreaks();
    resetadrenaline();
    self.killstreakindexweapon = undefined;
    updatestreakslots();
}

updatespecialistkillstreaks()
{
    if ( self.adrenaline == 0 )
    {
        for ( var_0 = 1; var_0 < 4; var_0++ )
        {
            if ( isdefined( self.pers["killstreaks"][var_0] ) )
            {
                self.pers["killstreaks"][var_0].available = 0;
                self setplayerdata( "killstreaksState", "hasStreak", var_0, 0 );
            }
        }

        self setplayerdata( "killstreaksState", "nextIndex", 1 );
        self setplayerdata( "killstreaksState", "hasStreak", 4, 0 );
    }
    else
    {
        for ( var_0 = 1; var_0 < 4; var_0++ )
        {
            if ( isdefined( self.pers["killstreaks"][var_0] ) && isdefined( self.pers["killstreaks"][var_0].streakname ) && self.pers["killstreaks"][var_0].available )
            {
                var_1 = getstreakcost( self.pers["killstreaks"][var_0].streakname );

                if ( var_1 > self.adrenaline )
                {
                    self.pers["killstreaks"][var_0].available = 0;
                    self setplayerdata( "killstreaksState", "hasStreak", var_0, 0 );
                    continue;
                }

                if ( self.adrenaline >= var_1 )
                {
                    if ( self getplayerdata( "killstreaksState", "hasStreak", var_0 ) )
                    {
                        if ( isdefined( level.killstreakfuncs[self.pers["killstreaks"][var_0].streakname] ) )
                            self [[ level.killstreakfuncs[self.pers["killstreaks"][var_0].streakname] ]]();

                        continue;
                    }

                    givekillstreak( self.pers["killstreaks"][var_0].streakname, self.pers["killstreaks"][var_0].earned, 0, self, 1 );
                }
            }
        }

        var_2 = 8;

        if ( maps\mp\_utility::_hasperk( "specialty_hardline" ) )
            var_2--;

        if ( self.adrenaline >= var_2 )
        {
            self setplayerdata( "killstreaksState", "hasStreak", 4, 1 );
            self.spawnperk = 0;
            giveallperks();
        }
        else
            self setplayerdata( "killstreaksState", "hasStreak", 4, 0 );
    }

    if ( self.pers["killstreaks"][0].available )
    {
        var_3 = self.pers["killstreaks"][0].streakname;
        var_4 = getkillstreakweapon( var_3 );

        if ( self is_player_gamepad_enabled() )
        {
            givekillstreakweapon( var_4 );
            self.killstreakindexweapon = 0;
        }
        else
        {
            maps\mp\_utility::_giveweapon( var_4 );
            maps\mp\_utility::_setactionslot( 4, "weapon", var_4 );
            self.killstreakindexweapon = undefined;
        }
    }
}

getfirstprimaryweapon()
{
    var_0 = self getweaponslistprimaries();
    return var_0[0];
}

killstreakusewaiter()
{
    self endon( "disconnect" );
    self endon( "finish_death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    self notify( "killstreakUseWaiter" );
    self endon( "killstreakUseWaiter" );
    self.lastkillstreak = 0;

    if ( !isdefined( self.pers["lastEarnedStreak"] ) )
        self.pers["lastEarnedStreak"] = undefined;

    thread finishdeathwaiter();

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        waittillframeend;

        if ( !isalive( self ) )
            continue;

        if ( !isdefined( self.killstreakindexweapon )
            || !isdefined( self.pers["killstreaks"][self.killstreakindexweapon] )
            || !isdefined( self.pers["killstreaks"][self.killstreakindexweapon].streakname ) )
            continue;

        var_1 = getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname );

        if ( var_0 != var_1 )
        {
            if ( maps\mp\_utility::isstrstart( var_0, "airdrop_" ) )
            {
                self takeweapon( var_0 );
                self switchtoweapon( self.lastdroppableweapon );
            }

            continue;
        }

        waittillframeend;
		
        var_2 = self.pers["killstreaks"][self.killstreakindexweapon].streakname;
        var_3 = self.pers["killstreaks"][self.killstreakindexweapon].isgimme;
        var_4 = killstreakusepressed();
        var_5 = undefined;

        if ( !var_4 && !isalive( self ) && !self hasweapon( common_scripts\utility::getlastweapon() ) )
        {
            var_5 = common_scripts\utility::getlastweapon();
            maps\mp\_utility::_giveweapon( var_5 );
        }
        else if ( !self hasweapon( common_scripts\utility::getlastweapon() ) )
            var_5 = getfirstprimaryweapon();
        else
            var_5 = common_scripts\utility::getlastweapon();

        if ( var_4 )
            thread waittakekillstreakweapon( var_1, var_5 );

        if ( shouldswitchweaponpostkillstreak( var_4, var_2 ) )
            self switchtoweapon( var_5 );

        if ( self getcurrentweapon() == "none" )
        {
            while ( self getcurrentweapon() == "none" )
                wait 0.05;

            waittillframeend;
        }
    }
}

waittakekillstreakweapon( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "finish_death" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self notify( "waitTakeKillstreakWeapon" );
    self endon( "waitTakeKillstreakWeapon" );
    var_2 = self getcurrentweapon() == "none";
    self waittill( "weapon_change", var_3 );

    if ( var_3 == var_1 )
    {
        takekillstreakweaponifnodupe( var_0 );

        //if ( /*!level.console && !self is_player_gamepad_enabled()*/ !self.gpadkscall )
        //    self.killstreakindexweapon = undefined;

    }
    else if ( var_3 != var_0 )
        thread waittakekillstreakweapon( var_0, var_1 );
    else if ( var_2 && self getcurrentweapon() == var_0 )
        thread waittakekillstreakweapon( var_0, var_1 );
}

takekillstreakweaponifnodupe( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < self.pers["killstreaks"].size; var_2++ )
    {
        if ( isdefined( self.pers["killstreaks"][var_2] ) && isdefined( self.pers["killstreaks"][var_2].streakname ) && self.pers["killstreaks"][var_2].available )
        {
            if ( !isspecialistkillstreak( self.pers["killstreaks"][var_2].streakname ) && var_0 == getkillstreakweapon( self.pers["killstreaks"][var_2].streakname ) )
            {
                var_1 = 1;
                break;
            }
        }
    }

    if ( var_1 )
    {
        if ( self is_player_gamepad_enabled() )
        {
            if ( isdefined( self.killstreakindexweapon ) && var_0 != getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname ) )
                self takeweapon( var_0 );
            else if ( isdefined( self.killstreakindexweapon ) && var_0 == getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname ) )
            {
                self takeweapon( var_0 );
                maps\mp\_utility::_giveweapon( var_0, 0 );
                maps\mp\_utility::_setactionslot( 4, "weapon", var_0 );
            }
        }
        else
        {
            self takeweapon( var_0 );
            maps\mp\_utility::_giveweapon( var_0, 0 );
        }
    }
    else
        self takeweapon( var_0 );
}

shouldswitchweaponpostkillstreak( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "uav_strike":
            if ( !var_0 )
                return 0;
    }

    if ( !var_0 )
        return 1;

    if ( isridekillstreak( var_1 ) )
        return 0;

    return 1;
}

finishdeathwaiter()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "finishDeathWaiter" );
    self endon( "finishDeathWaiter" );
    self waittill( "death" );
    wait 0.05;
    self notify( "finish_death" );
    self.pers["lastEarnedStreak"] = undefined;
}

checkstreakreward()
{
    foreach ( var_1 in self.killstreaks )
    {
        var_2 = getstreakcost( var_1 );

        if ( var_2 > self.adrenaline )
            break;

        if ( self.previousadrenaline < var_2 && self.adrenaline >= var_2 )
        {
            earnkillstreak( var_1, var_2 );
            break;
        }
    }
}

getcustomclassloc()
{
    if ( getdvarint( "xblive_privatematch" ) || getdvarint( "xblive_competitionmatch" ) && getdvarint( "systemlink" ) )
        return "privateMatchCustomClasses";
    else if ( getdvarint( "xblive_competitionmatch" ) && ( !level.console && ( getdvar( "dedicated" ) == "dedicated LAN server" || getdvar( "dedicated" ) == "dedicated internet server" ) ) )
        return "privateMatchCustomClasses";
    else
        return "customClasses";
}

killstreakearned( var_0 )
{
    var_1 = "assault";

    switch ( self.streaktype )
    {
        case "assault":
            var_1 = "assaultStreaks";
            break;
        case "support":
            var_1 = "defenseStreaks";
            break;
        case "specialist":
            var_1 = "specialistStreaks";
            break;
    }

    if ( isdefined( self.class_num ) )
    {
        var_2 = getcustomclassloc();

        if ( self getplayerdata( var_2, self.class_num, var_1, 0 ) == var_0 )
            self.firstkillstreakearned = gettime();
        else if ( self getplayerdata( var_2, self.class_num, var_1, 2 ) == var_0 && isdefined( self.firstkillstreakearned ) )
        {
            if ( gettime() - self.firstkillstreakearned < 20000 )
                thread maps\mp\gametypes\_missions::genericchallenge( "wargasm" );
        }
    }
}

earnkillstreak( var_0, var_1 )
{
    level notify( "gave_killstreak", var_0 );
    self.earnedstreaklevel = var_1;

    if ( !level.gameended )
    {
        var_2 = undefined;

        if ( self.streaktype == "specialist" )
        {
            var_3 = getsubstr( var_0, 0, var_0.size - 3 );

            if ( maps\mp\gametypes\_class::isperkupgraded( var_3 ) )
                var_2 = "pro";
        }

        thread maps\mp\gametypes\_hud_message::killstreaksplashnotify( var_0, var_1, var_2 );
    }

    thread killstreakearned( var_0 );
    self.pers["lastEarnedStreak"] = var_0;
    setstreakcounttonext();
    givekillstreak( var_0, 1, 1 );
}

givekillstreak( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "givingLoadout" );

    if ( !isdefined( level.killstreakfuncs[var_0] ) || tablelookup( "mp/killstreakTable.csv", 1, var_0, 0 ) == "" )
        return;

    if ( !isdefined( self.pers["killstreaks"] ) )
        return;

    self endon( "disconnect" );

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = undefined;

    if ( !isdefined( var_1 ) || var_1 == 0 )
    {
        var_6 = self.pers["killstreaks"].size;

        if ( !isdefined( self.pers["killstreaks"][var_6] ) )
            self.pers["killstreaks"][var_6] = spawnstruct();

        self.pers["killstreaks"][var_6].available = 0;
        self.pers["killstreaks"][var_6].streakname = var_0;
        self.pers["killstreaks"][var_6].earned = 0;
        self.pers["killstreaks"][var_6].awardxp = isdefined( var_2 ) && var_2;
        self.pers["killstreaks"][var_6].owner = var_3;
        self.pers["killstreaks"][var_6].kid = self.pers["kID"];
        self.pers["killstreaks"][var_6].lifeid = -1;
        self.pers["killstreaks"][var_6].isgimme = 1;
        self.pers["killstreaks"][var_6].isspecialist = 0;
        self.pers["killstreaks"][0].nextslot = var_6;
        self.pers["killstreaks"][0].streakname = var_0;
        var_5 = 0;
        var_7 = getkillstreakindex( var_0 );
        self setplayerdata( "killstreaksState", "icons", 0, var_7 );

        if ( !var_4 )
            showselectedstreakhint( var_0 );
    }
    else
    {
        for ( var_8 = 1; var_8 < 4; var_8++ )
        {
            if ( isdefined( self.pers["killstreaks"][var_8] ) && isdefined( self.pers["killstreaks"][var_8].streakname ) && var_0 == self.pers["killstreaks"][var_8].streakname )
            {
                var_5 = var_8;
                break;
            }
        }

        if ( !isdefined( var_5 ) )
            return;
    }

    self.pers["killstreaks"][var_5].available = 1;
    self.pers["killstreaks"][var_5].earned = isdefined( var_1 ) && var_1;
    self.pers["killstreaks"][var_5].awardxp = isdefined( var_2 ) && var_2;
    self.pers["killstreaks"][var_5].owner = var_3;
    self.pers["killstreaks"][var_5].kid = self.pers["kID"];
    self.pers["kID"]++;

    if ( !self.pers["killstreaks"][var_5].earned )
        self.pers["killstreaks"][var_5].lifeid = -1;
    else
        self.pers["killstreaks"][var_5].lifeid = self.pers["deaths"];

    if ( self.streaktype == "specialist" && var_5 != 0 )
    {
        self.pers["killstreaks"][var_5].isspecialist = 1;

        if ( isdefined( level.killstreakfuncs[var_0] ) )
            self [[ level.killstreakfuncs[var_0] ]]();

        usedkillstreak( var_0, var_2 );
    }
    else if ( self is_player_gamepad_enabled())
    {
        var_9 = getkillstreakweapon( var_0 );
        givekillstreakweapon( var_9 );

        if ( isdefined( self.killstreakindexweapon ) )
        {
            var_0 = self.pers["killstreaks"][self.killstreakindexweapon].streakname;
            var_10 = getkillstreakweapon( var_0 );

            if ( !iscurrentlyholdingkillstreakweapon( var_10 ) )
                self.killstreakindexweapon = var_5;
        }
        else
            self.killstreakindexweapon = var_5;
    }
    else
    {
        if ( 0 == var_5 && self.pers["killstreaks"][0].nextslot > 5 )
        {
            var_11 = self.pers["killstreaks"][0].nextslot - 1;
            var_12 = getkillstreakweapon( self.pers["killstreaks"][var_11].streakname );
            self takeweapon( var_12 );
        }

        var_10 = getkillstreakweapon( var_0 );
        maps\mp\_utility::_giveweapon( var_10, 0 );
        maps\mp\_utility::_setactionslot( var_5 + 4, "weapon", var_10 );
    }

    updatestreakslots();

    if ( isdefined( level.killstreaksetupfuncs[var_0] ) )
        self [[ level.killstreaksetupfuncs[var_0] ]]();

    if ( isdefined( var_1 ) && var_1 && isdefined( var_2 ) && var_2 )
        self notify( "received_earned_killstreak" );
}

iscurrentlyholdingkillstreakweapon( var_0 )
{
    var_1 = self getcurrentweapon();

    switch ( var_0 )
    {
        case "killstreak_uav_mp":
            return var_1 == "killstreak_remote_uav_mp";
    }

    return var_1 == var_0;
}

givekillstreakweapon( var_0 )
{
    self endon( "disconnect" );

    if ( !self is_player_gamepad_enabled() )
        return;

    var_1 = self getweaponslistitems();

    foreach ( var_3 in var_1 )
    {
        if ( !maps\mp\_utility::isstrstart( var_3, "killstreak_" ) && !maps\mp\_utility::isstrstart( var_3, "airdrop_" ) && !maps\mp\_utility::isstrstart( var_3, "deployable_" ) )
            continue;

        if ( self getcurrentweapon() == var_3 || isdefined( self.changingweapon ) && self.changingweapon == var_3 )
            continue;

        while ( maps\mp\_utility::ischangingweapon() )
            wait 0.05;

        self takeweapon( var_3 );
    }

    if ( isdefined( self.killstreakindexweapon ) )
    {
        var_5 = self.pers["killstreaks"][self.killstreakindexweapon].streakname;
        var_6 = getkillstreakweapon( var_5 );

        if ( self getcurrentweapon() != var_6 )
        {
            maps\mp\_utility::_giveweapon( var_0, 0 );
            maps\mp\_utility::_setactionslot( 4, "weapon", var_0 );
            return;
        }
    }
    else
    {
        maps\mp\_utility::_giveweapon( var_0, 0 );
        maps\mp\_utility::_setactionslot( 4, "weapon", var_0 );
    }
}

getstreakcost( var_0 )
{
    var_1 = int( tablelookup( "mp/killstreakTable.csv", 1, var_0, 4 ) );

    if ( isdefined( self ) && isplayer( self ) )
    {
        if ( isspecialistkillstreak( var_0 ) )
        {
            if ( isdefined( self.pers["gamemodeLoadout"] ) )
            {
                if ( isdefined( self.pers["gamemodeLoadout"]["loadoutKillstreak1"] ) && self.pers["gamemodeLoadout"]["loadoutKillstreak1"] == var_0 )
                    var_1 = 2;
                else if ( isdefined( self.pers["gamemodeLoadout"]["loadoutKillstreak2"] ) && self.pers["gamemodeLoadout"]["loadoutKillstreak2"] == var_0 )
                    var_1 = 4;
                else if ( isdefined( self.pers["gamemodeLoadout"]["loadoutKillstreak3"] ) && self.pers["gamemodeLoadout"]["loadoutKillstreak3"] == var_0 )
                    var_1 = 6;
                else
                {

                }
            }
            else if ( issubstr( self.curclass, "custom" ) )
            {
                var_2 = getcustomclassloc();

                for ( var_3 = 0; var_3 < 3; var_3++ )
                {
                    var_4 = self getplayerdata( var_2, self.class_num, "specialistStreaks", var_3 );

                    if ( var_4 == var_0 )
                        break;
                }

                var_1 = self getplayerdata( var_2, self.class_num, "specialistStreakKills", var_3 );
            }
            else if ( issubstr( self.curclass, "axis" ) || issubstr( self.curclass, "allies" ) )
            {
                var_3 = 0;
                var_5 = "none";

                if ( issubstr( self.curclass, "axis" ) )
                    var_5 = "axis";
                else if ( issubstr( self.curclass, "allies" ) )
                    var_5 = "allies";

                for ( var_6 = maps\mp\gametypes\_class::getclassindex( self.curclass ); var_3 < 3; var_3++ )
                {
                    var_4 = getmatchrulesdata( "defaultClasses", var_5, var_6, "class", "specialistStreaks", var_3 );

                    if ( var_4 == var_0 )
                        break;
                }

                var_1 = getmatchrulesdata( "defaultClasses", var_5, var_6, "class", "specialistStreakKills", var_3 );
            }
        }

        if ( maps\mp\_utility::_hasperk( "specialty_hardline" ) && var_1 > 0 )
            var_1--;
    }

    // JC-12/03/13- Hackers are adjusting their specialist perk kill
    // requirement in player data to be enormous. This is causing some
    // suspect script in _class::setKillstreaks() to throw an infinite
    // loop assert. In ship this is killing the thread and preventing 
    // the player from getting a body. This results in an invisible player
    // who is also invincible. Simple fix, clamp the killstreak cost.
    // JC-ToDo: May want to clamp this according to a precalculated
    // max killstreak cost or make the logic in setKillstreaks() better.
    // var_1 is "const" var
    var_1 = int( clamp( var_1, 0, 30 ) );

    return var_1;
}

isassaultkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "littlebird_support":
        case "helicopter":
        case "airdrop_remote_tank":
        case "remote_mortar":
        case "ims":
        case "osprey_gunner":
        case "littlebird_flock":
        case "helicopter_flares":
        case "airdrop_juggernaut":
        case "airdrop_sentry_minigun":
        case "airdrop_assault":
        case "predator_missile":
        case "precision_airstrike":
        case "ac130":
        case "uav":
            return 1;
        default:
            return 0;
    }
}

issupportkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "sam_turret":
        case "remote_uav":
        case "uav_support":
        case "airdrop_juggernaut_recon":
        case "remote_mg_turret":
        case "deployable_vest":
        case "escort_airdrop":
        case "airdrop_trap":
        case "stealth_airstrike":
        case "counter_uav":
        case "triple_uav":
        case "emp":
            return 1;
        default:
            return 0;
    }
}

isspecialistkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "all_perks_bonus":
        case "specialty_stalker_ks":
        case "specialty_quieter_ks":
        case "specialty_bulletaccuracy_ks":
        case "specialty_autospot_ks":
        case "specialty_detectexplosive_ks":
        case "_specialty_blastshield_ks":
        case "specialty_assists_ks":
        case "specialty_quickdraw_ks":
        case "specialty_coldblooded_ks":
        case "specialty_hardline_ks":
        case "specialty_paint_ks":
        case "specialty_blindeye_ks":
        case "specialty_scavenger_ks":
        case "specialty_fastreload_ks":
        case "specialty_longersprint_ks":
            return 1;
        default:
            return 0;
    }
}

getkillstreakhint( var_0 )
{
    return tablelookupistring( "mp/killstreakTable.csv", 1, var_0, 6 );
}

getkillstreakinformenemy( var_0 )
{
    return int( tablelookup( "mp/killstreakTable.csv", 1, var_0, 11 ) );
}

getkillstreaksound( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 7 );
}

getkillstreakdialog( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 8 );
}

getkillstreakweapon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 12 );
}

getkillstreakicon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 14 );
}

getkillstreakcrateicon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 15 );
}

getkillstreakdpadicon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 16 );
}

getkillstreakindex( var_0 )
{
    return tablelookuprownum( "mp/killstreakTable.csv", 1, var_0 ) - 1;
}

streaktyperesetsondeath( var_0 )
{
    switch ( var_0 )
    {
        case "assault":
        case "specialist":
            return 1;
        case "support":
            return 0;
    }
}

giveownedkillstreakitem( var_0 )
{
    if ( self is_player_gamepad_enabled() )
    {
        var_1 = -1;
        var_2 = -1;

        for ( var_3 = 0; var_3 < 4; var_3++ )
        {
            if ( isdefined( self.pers["killstreaks"][var_3] ) && isdefined( self.pers["killstreaks"][var_3].streakname ) && self.pers["killstreaks"][var_3].available && getstreakcost( self.pers["killstreaks"][var_3].streakname ) > var_2 )
            {
                var_2 = 0;

                if ( !self.pers["killstreaks"][var_3].isgimme )
                    var_2 = getstreakcost( self.pers["killstreaks"][var_3].streakname );

                var_1 = var_3;
            }
        }

        if ( var_1 != -1 )
        {
            self.killstreakindexweapon = var_1;
            var_4 = self.pers["killstreaks"][self.killstreakindexweapon].streakname;
            var_5 = getkillstreakweapon( var_4 );
            givekillstreakweapon( var_5 );

            if ( !isdefined( var_0 ) && !level.ingraceperiod )
                showselectedstreakhint( var_4 );
        }
        else
            self.killstreakindexweapon = undefined;
    }
    else
    {
        var_1 = -1;
        var_2 = -1;

        for ( var_3 = 0; var_3 < 4; var_3++ )
        {
            if ( isdefined( self.pers["killstreaks"][var_3] ) && isdefined( self.pers["killstreaks"][var_3].streakname ) && self.pers["killstreaks"][var_3].available )
            {
                var_6 = getkillstreakweapon( self.pers["killstreaks"][var_3].streakname );
                var_7 = self getweaponslistitems();
                var_8 = 0;

                for ( var_9 = 0; var_9 < var_7.size; var_9++ )
                {
                    if ( var_6 == var_7[var_9] )
                    {
                        var_8 = 1;
                        break;
                    }
                }

                if ( !var_8 )
                    maps\mp\_utility::_giveweapon( var_6 );
                else if ( issubstr( var_6, "airdrop_" ) )
                    self setweaponammoclip( var_6, 1 );

                maps\mp\_utility::_setactionslot( var_3 + 4, "weapon", var_6 );

                if ( getstreakcost( self.pers["killstreaks"][var_3].streakname ) > var_2 )
                {
                    var_2 = 0;

                    if ( !self.pers["killstreaks"][var_3].isgimme )
                        var_2 = getstreakcost( self.pers["killstreaks"][var_3].streakname );

                    var_1 = var_3;
                }
            }
        }

        if ( var_1 != -1 )
        {
            var_4 = self.pers["killstreaks"][var_1].streakname;

            if ( !isdefined( var_0 ) && !level.ingraceperiod )
                showselectedstreakhint( var_4 );
        }

        self.killstreakindexweapon = undefined;
    }

    updatestreakslots();
}

initridekillstreak( var_0 )
{
    common_scripts\utility::_disableusability();
    var_1 = initridekillstreak_internal( var_0 );

    if ( isdefined( self ) )
        common_scripts\utility::_enableusability();

    return var_1;
}

initridekillstreak_internal( var_0 )
{
    if ( isdefined( var_0 ) && ( var_0 == "osprey_gunner" || var_0 == "remote_uav" || var_0 == "remote_tank" ) )
        var_1 = "timeout";
    else
        var_1 = common_scripts\utility::waittill_any_timeout( 1.0, "disconnect", "death", "weapon_switch_started" );

    maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

    if ( var_1 == "weapon_switch_started" )
        return "fail";

    if ( !isalive( self ) )
        return "fail";

    if ( var_1 == "disconnect" || var_1 == "death" )
    {
        if ( var_1 == "disconnect" )
            return "disconnect";

        if ( self.team == "spectator" )
            return "fail";

        return "success";
    }

    if ( maps\mp\_utility::isemped() || maps\mp\_utility::isnuked() || maps\mp\_utility::isairdenied() )
        return "fail";

    self visionsetnakedforplayer( "black_bw", 0.75 );
    var_2 = common_scripts\utility::waittill_any_timeout( 0.8, "disconnect", "death" );
    maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

    if ( var_2 != "disconnect" )
    {
        thread clearrideintro( 1.0 );

        if ( self.team == "spectator" )
            return "fail";
    }

    if ( self isonladder() )
        return "fail";

    if ( !isalive( self ) )
        return "fail";

    if ( maps\mp\_utility::isemped() || maps\mp\_utility::isnuked() || maps\mp\_utility::isairdenied() )
        return "fail";

    if ( var_2 == "disconnect" )
        return "disconnect";
    else
        return "success";
}

clearrideintro( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        wait( var_0 );

    if ( isdefined( level.nukedetonated ) )
        self visionsetnakedforplayer( level.nukevisionset, 0 );
    else
        self visionsetnakedforplayer( "", 0 );
}

giveselectedkillstreakitem()
{
    var_0 = self.pers["killstreaks"][self.killstreakindexweapon].streakname;
    var_1 = getkillstreakweapon( var_0 );
    givekillstreakweapon( var_1 );
    updatestreakslots();
}

showselectedstreakhint( var_0 )
{
    var_1 = spawnstruct();
    var_1.name = "selected_" + var_0;
    var_1.type = "killstreak_minisplash";
    var_1.optionalnumber = getstreakcost( var_0 );
    var_1.leadersound = var_0;
    var_1.leadersoundgroup = "killstreak_earned";
    var_1.slot = 0;
    self.notifytext.alpha = 0;
    self.notifytext2.alpha = 0;
    self.notifyicon.alpha = 0;
    thread maps\mp\gametypes\_hud_message::actionnotifymessage( var_1 );
}

getkillstreakcount()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < 4; var_1++ )
    {
        if ( isdefined( self.pers["killstreaks"][var_1] ) && isdefined( self.pers["killstreaks"][var_1].streakname ) && self.pers["killstreaks"][var_1].available )
            var_0++;
    }

    return var_0;
}

// NEW SYSTEM
inittrackerdata()
{
    self.streakuseenabled = true;
    self.actionslotenabled = [];
    self.actionslotenabled[0] = true;
    self.actionslotenabled[1] = true;
    self.actionslotenabled[2] = true;
    self.actionslotenabled[3] = true;
}

streaknotifytracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::gameflagwait( "prematch_done" );

    self notifyonplayercommand( "toggled_up", "+actionslot 1" );
    self notifyonplayercommand( "toggled_down", "+actionslot 2" );
    self notifyonplayercommand( "streakUsed", "+actionslot 4" );
    self notifyonplayercommand( "streakUsed", "+actionslot 5" );
    self notifyonplayercommand( "streakUsed", "+actionslot 6" );
    self notifyonplayercommand( "streakUsed", "+actionslot 7" );

    self notifyonplayercommand( "streakUsed1", "+actionslot 4" );
    self notifyonplayercommand( "streakUsed2", "+actionslot 5" );
    self notifyonplayercommand( "streakUsed3", "+actionslot 6" );
    self notifyonplayercommand( "streakUsed4", "+actionslot 7" );
}

streakselectuptracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "toggled_up" );

        waittillframeend;

        if ( !self.streakuseenabled )
            continue;

        if ( !self is_player_gamepad_enabled() )
            continue;

        if ( !self ismantling() && ( !isdefined( self.changingweapon ) || isdefined( self.changingweapon ) && self.changingweapon == "none" ) && ( !maps\mp\_utility::iskillstreakweapon( self getcurrentweapon() ) || maps\mp\_utility::isjuggernautweapon( self getcurrentweapon() ) && maps\mp\_utility::isjuggernaut() ) && self.streaktype != "specialist" && ( !isdefined( self.iscarrying ) || isdefined( self.iscarrying ) && self.iscarrying == 0 ) && ( !isdefined( self.laststreakused ) || isdefined( self.laststreakused ) && gettime() - self.laststreakused > 100 ) )
            shufflekillstreaksup();

        wait 0.12;
    }
}

streakselectdowntracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "toggled_down" );

        waittillframeend;

        if ( !self.streakuseenabled )
            continue;

        if ( !self is_player_gamepad_enabled() )
            continue;

        if ( !self ismantling() && ( !isdefined( self.changingweapon ) || isdefined( self.changingweapon ) && self.changingweapon == "none" ) && ( !maps\mp\_utility::iskillstreakweapon( self getcurrentweapon() ) || maps\mp\_utility::isjuggernautweapon( self getcurrentweapon() ) && maps\mp\_utility::isjuggernaut() ) && self.streaktype != "specialist" && ( !isdefined( self.iscarrying ) || isdefined( self.iscarrying ) && self.iscarrying == 0 ) && ( !isdefined( self.laststreakused ) || isdefined( self.laststreakused ) && gettime() - self.laststreakused > 100 ) )
            shufflekillstreaksdown();

        wait 0.12;
    }
}

shufflekillstreaksup()
{
    if ( getkillstreakcount() > 1 )
    {
        for (;;)
        {
            self.killstreakindexweapon++;

            if ( self.killstreakindexweapon > 3 )
                self.killstreakindexweapon = 0;

            if ( self.pers["killstreaks"][self.killstreakindexweapon].available == 1 )
                break;
        }

        giveselectedkillstreakitem();
        showselectedstreakhint( self.pers["killstreaks"][self.killstreakindexweapon].streakname );
    }
}

shufflekillstreaksdown()
{
    if ( getkillstreakcount() > 1 )
    {
        for (;;)
        {
            self.killstreakindexweapon--;

            if ( self.killstreakindexweapon < 0 )
                self.killstreakindexweapon = 3;

            if ( self.pers["killstreaks"][self.killstreakindexweapon].available == 1 )
                break;
        }

        giveselectedkillstreakitem();
        showselectedstreakhint( self.pers["killstreaks"][self.killstreakindexweapon].streakname );
    }
}

streakusegamepadtracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "streakUsed" );

        if (!self.streakuseenabled)
            continue;
        
        if ( !self is_player_gamepad_enabled() )
            continue;

        self.laststreakused = gettime();
        self.streakuseenabled = false;

        for (;;)
        {
            self waittill( "weapon_change", weapon );

            if ( isdefined( self.killstreakindexweapon ) )
            {
                var_2 = getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname );

                if ( weapon == var_2 || weapon == "none" || var_2 == "killstreak_uav_mp" && weapon == "killstreak_remote_uav_mp" || var_2 == "killstreak_uav_mp" && weapon == "uav_remote_mp" )
                {
                    continue;
                }

                break;
            }

            break;
        }

        waittillframeend;

        self.streakuseenabled = true;
    }
}

streakusekeyboardtracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = common_scripts\utility::waittill_any_return( "streakUsed1", "streakUsed2", "streakUsed3", "streakUsed4" );

        if (!self.streakuseenabled)
            continue;

		if( self is_player_gamepad_enabled() )
			continue;

        if ( !isdefined( var_0 ) )
            continue;

        if ( self.streaktype == "specialist" && var_0 != "streakUsed1" )
            continue;

        if ( isdefined( self.changingweapon ) && self.changingweapon == "none" )
            continue;

        switch ( var_0 )
        {
            case "streakUsed1":
                if ( self.pers["killstreaks"][0].available && self.actionslotenabled[0] )
                    self.killstreakindexweapon = 0;

                break;
            case "streakUsed2":
                if ( self.pers["killstreaks"][1].available && self.actionslotenabled[1] )
                    self.killstreakindexweapon = 1;

                break;
            case "streakUsed3":
                if ( self.pers["killstreaks"][2].available && self.actionslotenabled[2] )
                    self.killstreakindexweapon = 2;

                break;
            case "streakUsed4":
                if ( self.pers["killstreaks"][3].available && self.actionslotenabled[3] )
                    self.killstreakindexweapon = 3;

                break;
        }

        if ( isdefined( self.killstreakindexweapon ) && !self.pers["killstreaks"][self.killstreakindexweapon].available )
            self.killstreakindexweapon = undefined;

        if ( isdefined( self.killstreakindexweapon ) )
        {
            self.streakuseenabled = false;
            disablekillstreakactionslots();

            // fix for smash 2 killstreaks at same time result in client != server weapons
            self.kspendinghold = true;

            for (;;)
            {
                self waittill( "weapon_change", weapon );

                if ( isdefined( self.killstreakindexweapon ) )
                {
                    var_2 = getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname );

                    if ( weapon == var_2 || weapon == "none" || var_2 == "killstreak_uav_mp" && weapon == "killstreak_remote_uav_mp" || var_2 == "killstreak_uav_mp" && weapon == "uav_remote_mp" )
                    {
                        self.kspendinghold = false;
                        continue;
                    }
                    else if ( self.kspendinghold )
                    {
                        self_pers_ks = self.pers["killstreaks"];

                        if ( self.killstreakindexweapon != 0 && self_pers_ks[0].available && weapon == getkillstreakweapon( self_pers_ks[0].streakname ) )
                        {
                            self.killstreakindexweapon = 0;
                            continue;
                        }

                        if ( self.killstreakindexweapon != 1 && self_pers_ks[1].available && weapon == getkillstreakweapon( self_pers_ks[1].streakname ) )
                        {
                            self.killstreakindexweapon = 1;
                            continue;
                        }

                        if ( self.killstreakindexweapon != 2 && self_pers_ks[2].available && weapon == getkillstreakweapon( self_pers_ks[2].streakname ) )
                        {
                            self.killstreakindexweapon = 2;
                            continue;
                        }

                        if ( self.killstreakindexweapon != 3 && self_pers_ks[3].available && weapon == getkillstreakweapon( self_pers_ks[3].streakname ) )
                        {
                            self.killstreakindexweapon = 3;
                            continue;
                        }
                    }

                    break;
                }

                break;
            }

            waittillframeend;

            if ( !self is_player_gamepad_enabled() )
            {
                enablekillstreakactionslots();
                self.killstreakindexweapon = undefined;
            }

            self.streakuseenabled = true;
        }
    }
}

disablekillstreakactionslots()
{
    for ( i = 0; i < 4; i++ )
    {
        if ( !isdefined( self.killstreakindexweapon ) )
            break;

        if ( self.killstreakindexweapon == i )
            continue;

        maps\mp\_utility::_setactionslot( i + 4, "" );
        self.actionslotenabled[i] = false;
    }
}

enablekillstreakactionslots()
{
    for ( i = 0; i < 4; i++ )
    {
        if ( self.pers["killstreaks"][i].available )
        {
            weapon = getkillstreakweapon( self.pers["killstreaks"][i].streakname );
            maps\mp\_utility::_setactionslot( i + 4, "weapon", weapon );
        }
        else
            maps\mp\_utility::_setactionslot( i + 4, "" );

        self.actionslotenabled[i] = true;
    }
}

watchgamepad()
{
	self endon ( "death" );
	self endon ( "disconnect" );
	level endon ( "game_ended" );

	game_pad_enabled = self is_player_gamepad_enabled();

	while( true )
	{
		if( self.streakuseenabled && game_pad_enabled != self is_player_gamepad_enabled() )
		{
			game_pad_enabled = self is_player_gamepad_enabled();
			
			if( !game_pad_enabled )
			{
				switch_to_keyboard();
			}
			else
			{
				switch_to_gamepad();
			}
		}

		wait( 0.05 );
	}
}

switch_to_keyboard()
{
    // enable all slots
    for( i = 0; i < 4; i++ )
    {
        self.actionslotenabled[ i ] = true;
    }

    // give back all ks weapons
    self giveownedkillstreakitem();
}

switch_to_gamepad()
{
    // take all of the killstreak weapons, unless you're holding one
    weapon_list = self getweaponslistitems();
    foreach( weapon in weapon_list )
    {
        if( maps\mp\_utility::iskillstreakweapon( weapon ) && weapon == self getcurrentweapon() )
        {
            self switchtoweapon( self common_scripts\utility::getlastweapon() );
            while( self maps\mp\_utility::ischangingweapon() )
                wait( 0.05 );
        }
        
        if( maps\mp\_utility::iskillstreakweapon( weapon ) )
            self takeweapon( weapon );
    }

    // clear the action slots, it should get filled by the function call below
    for( i = 0; i < 3 + 1; i++ )
    {
        self maps\mp\_utility::_setactionslot( i + 4, "" );
        self.actionslotenabled[ i ] = false;
    }

    // give back top ks weapon
    self giveownedkillstreakitem();
}

registeradrenalineinfo( var_0, var_1 )
{
    if ( !isdefined( level.adrenalineinfo ) )
        level.adrenalineinfo = [];

    level.adrenalineinfo[var_0] = var_1;
}

giveadrenaline( var_0 )
{
    if ( level.adrenalineinfo[var_0] == 0 )
        return;

    var_1 = self.adrenaline + level.adrenalineinfo[var_0];
    var_2 = var_1;
    var_3 = getmaxstreakcost();

    if ( var_2 > var_3 && self.streaktype != "specialist" )
        var_2 = var_2 - var_3;
    else if ( level.killstreakrewards && var_2 > var_3 && self.streaktype == "specialist" )
    {
        var_4 = 8;

        if ( maps\mp\_utility::_hasperk( "specialty_hardline" ) )
            var_4--;

        if ( var_2 == var_4 )
        {
            giveallperks();
            usedkillstreak( "all_perks_bonus", 1 );
            thread maps\mp\gametypes\_hud_message::killstreaksplashnotify( "all_perks_bonus", var_4 );
            self setplayerdata( "killstreaksState", "hasStreak", 4, 1 );
            self.pers["killstreaks"][4].available = 1;
        }

        if ( var_3 > 0 && !( ( var_2 - var_3 ) % 2 ) )
        {
            thread maps\mp\gametypes\_rank::xpeventpopup( &"MP_SPECIALIST_STREAKING_XP" );
            thread maps\mp\gametypes\_rank::giverankxp( "kill" );
        }
    }

    setadrenaline( var_2 );
    checkstreakreward();

    if ( var_1 == var_3 && self.streaktype != "specialist" )
        setadrenaline( 0 );
}

giveallperks()
{
    var_0 = [];
    var_0[var_0.size] = "specialty_longersprint";
    var_0[var_0.size] = "specialty_fastreload";
    var_0[var_0.size] = "specialty_scavenger";
    var_0[var_0.size] = "specialty_blindeye";
    var_0[var_0.size] = "specialty_paint";
    var_0[var_0.size] = "specialty_hardline";
    var_0[var_0.size] = "specialty_coldblooded";
    var_0[var_0.size] = "specialty_quickdraw";
    var_0[var_0.size] = "_specialty_blastshield";
    var_0[var_0.size] = "specialty_detectexplosive";
    var_0[var_0.size] = "specialty_autospot";
    var_0[var_0.size] = "specialty_bulletaccuracy";
    var_0[var_0.size] = "specialty_quieter";
    var_0[var_0.size] = "specialty_stalker";
    var_0[var_0.size] = "specialty_marksman";
    var_0[var_0.size] = "specialty_sharp_focus";
    var_0[var_0.size] = "specialty_longerrange";
    var_0[var_0.size] = "specialty_fastermelee";
    var_0[var_0.size] = "specialty_reducedsway";
    var_0[var_0.size] = "specialty_lightweight";

    foreach ( var_2 in var_0 )
    {
        if ( !maps\mp\_utility::_hasperk( var_2 ) )
        {
            maps\mp\_utility::giveperk( var_2, 0 );

            if ( maps\mp\gametypes\_class::isperkupgraded( var_2 ) )
            {
                var_3 = tablelookup( "mp/perktable.csv", 1, var_2, 8 );
                maps\mp\_utility::giveperk( var_3, 0 );
            }
        }
    }
}

resetadrenaline()
{
    self.earnedstreaklevel = 0;
    setadrenaline( 0 );
    resetstreakcount();

    if ( isdefined( self.pers["lastEarnedStreak"] ) )
        self.pers["lastEarnedStreak"] = undefined;
}

setadrenaline( var_0 )
{
    if ( var_0 < 0 )
        var_0 = 0;

    if ( isdefined( self.adrenaline ) )
        self.previousadrenaline = self.adrenaline;
    else
        self.previousadrenaline = 0;

    self.adrenaline = var_0;
    self setclientdvar( "ui_adrenaline", self.adrenaline );
    updatestreakcount();
}

killstreakhit( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) && isplayer( var_0 ) && isdefined( var_2.owner ) && isdefined( var_2.owner.team ) )
    {
        if ( ( level.teambased && var_2.owner.team != var_0.team || !level.teambased ) && var_0 != var_2.owner )
        {
            if ( maps\mp\_utility::iskillstreakweapon( var_1 ) )
                return;

            if ( !isdefined( var_0.lasthittime[var_1] ) )
                var_0.lasthittime[var_1] = 0;

            if ( var_0.lasthittime[var_1] == gettime() )
                return;

            var_0.lasthittime[var_1] = gettime();
            var_0 thread maps\mp\gametypes\_gamelogic::threadedsetweaponstatbyname( var_1, 1, "hits" );
            var_3 = var_0 maps\mp\gametypes\_persistence::statgetbuffered( "totalShots" );
            var_4 = var_0 maps\mp\gametypes\_persistence::statgetbuffered( "hits" ) + 1;

            if ( var_4 <= var_3 )
            {
                var_0 maps\mp\gametypes\_persistence::statsetbuffered( "hits", var_4 );
                var_0 maps\mp\gametypes\_persistence::statsetbuffered( "misses", int( var_3 - var_4 ) );
                var_5 = clamp( float( var_4 ) / float( var_3 ), 0.0, 1.0 ) * 10000.0;
                var_0 maps\mp\gametypes\_persistence::statsetbuffered( "accuracy", int( var_5 ) );
            }
        }
    }
}

is_player_gamepad_enabled()
{
    if (self istestclient()) return false;

    return self usinggamepad();
}
