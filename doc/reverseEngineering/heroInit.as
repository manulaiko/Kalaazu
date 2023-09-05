HERO_ID = int(_loc3_[2]);
HERO_NAME = _loc3_[3];
SHIP_GFX = int(_loc3_[4]);
SHIP_SPEED = int(_loc3_[5]) * 0.97;
CURRENT_SHIELD = int(_loc3_[6]);
MAX_SHIELD = int(_loc3_[7]);
HEALTH_POINTS = int(_loc3_[8]);
MAX_HEALTH_POINTS = int(_loc3_[9]);
CARGO = int(_loc3_[10]);
MAX_CARGO = int(_loc3_[11]);
POSITION_X = int(_loc3_[12]);
POSITION_Y = int(_loc3_[13]);
MAP_ID = int(_loc3_[14]);
FACTION_ID = int(_loc3_[15]);
CLAN_ID = int(_loc3_[16]);
Hero.maxLaserCapacity = int(_loc3_[17]);
Hero.maxRocketCapacity = int(_loc3_[18]);
EXPANSION_ID = int(_loc3_[19]);
Hero.premium = Boolean(int(_loc3_[20]));
Hero.experiencePoints = Number(_loc3_[21]);
Hero.honorPoints = Number(_loc3_[22]);
Hero.level = int(_loc3_[23]);
Hero.creditsAmount = Number(_loc3_[24]);
Hero.uridiumAmount = Number(_loc3_[25]);
Hero.jackpotAmount = Number(_loc3_[26]);
RANK_IDD = int(_loc3_[27]);
CLAN_TAG = _loc3_[28];
RINGS = int(_loc3_[29]);
CLOAKED = Boolean(int(_loc3_[31]));
Hero.isKilled = false;
this.main.getGuiManager().removeStopoverView();
SHIP_GFX = this.getMappedShipType(SHIP_GFX);
if (RANK_IDD == 21) {
    Hero.admin = true;
} else {
    Hero.admin = false;
}
Hero.username = HERO_NAME;
if (StringUtil.trim(CLAN_TAG).length > 0) {
    Hero.clan = CLAN_TAG;
}
Hero.factionID = FACTION_ID;
if (Settings.lastMapID != -1 && Settings.lastMapID != MAP_ID) {
    AudioManager.playSoundEffect(6);
}
if (Settings.lastMapID != MAP_ID) {
    this.isMapLoaded = false;
    this.main.createMap(MAP_ID);
    Settings.lastMapID = MAP_ID;
}
_loc10_ = this.main.screenManager.map.getShipManager().createShip(SHIP_GFX, HERO_ID, POSITION_X, POSITION_Y, SHIP_SPEED, HERO_NAME, CLAN_TAG, FACTION_ID, CLAN_ID, -1, RANK_IDD, EXPANSION_ID, false, RINGS, false);
if (SHIP_GFX == 80) {
    _loc10_.isCubicon = true;
}
if (_loc10_ == null) {
    return;
}
_loc10_.setHitpoints(HEALTH_POINTS);
_loc10_.setMaxHitpoints(MAX_HEALTH_POINTS);
_loc10_.setCargo(MAX_CARGO - CARGO);
_loc10_.setMaxCargo(MAX_CARGO);
_loc10_.setShieldChunk(CURRENT_SHIELD, MAX_SHIELD, true);
if (Settings.createOpponents) {
    _loc31_ = (_loc9_ = this.main.screenManager.map).getShipManager();
    _loc59_ = 0;
    while (_loc59_ < this.bufferedShips.length) {
        _loc11_ = this.bufferedShips[_loc59_];
        if (FACTION_ID > 3) {
            FACTION_ID = 0;
        }
        if (_loc31_ != null) {
            (_loc30_ = _loc31_.createShip(_loc11_.typeID, _loc11_.userID, _loc11_.xPos, _loc11_.yPos, 1, _loc11_.username, _loc11_.clanTag, _loc11_.fractionID, _loc11_.clanID, _loc11_.clanDiplomacy, _loc11_.dailyRank, _loc11_.expansionstage, _loc11_.warnIconOnMap, _loc11_.galaxyGatesFinished, _loc11_.isNPC)).setCloak(_loc11_.cloaked);
        }
        _loc59_++;
    }
    this.bufferedShips = [];
}
this.main.getGuiManager().removeConnectionWindow();
this.main.screenManager.map.getEventManager().unlockControls();
this.main.getGuiManager().loadChat();
this.main.getGuiManager().createLogWindow();
this.main.getGuiManager().addGUI();
if ((_loc102_ = this.main.getGuiManager().getWindow(SimpleWindow.WINDOW_CLASS_JACKPOTBATTLE)) != null) {
    this.main.getGuiManager().closeWindow(this.main.getGuiManager().getWindow(SimpleWindow.WINDOW_CLASS_JACKPOTBATTLE));
}
this.main.getGuiManager().createWindow(SimpleWindow.WINDOW_CLASS_USER);
this.main.getGuiManager().createWindow(SimpleWindow.WINDOW_CLASS_SHIP);
this.main.getGuiManager().createQuestWindow();
if (Settings.showInstantLog) {
    this.main.getGuiManager().createInstantLogView();
}
this.main.getGuiManager().createGlobalNotificationView();
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_SHIP, SimpleContainer.CONTAINER_CLASS_HERO_INFO_1, SimpleElement.TYPE_LASER);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_SHIP, SimpleContainer.CONTAINER_CLASS_HERO_INFO_1, SimpleElement.TYPE_ROCKETS);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_USER, SimpleContainer.CONTAINER_CLASS_HERO_INFO_3, SimpleElement.TYPE_CREDITS);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_USER, SimpleContainer.CONTAINER_CLASS_HERO_INFO_3, SimpleElement.TYPE_URIDIUM);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_USER, SimpleContainer.CONTAINER_CLASS_HERO_INFO_3, SimpleElement.TYPE_JACKPOT);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_USER, SimpleContainer.CONTAINER_CLASS_HERO_INFO_2, SimpleElement.TYPE_EXPERIENCE);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_USER, SimpleContainer.CONTAINER_CLASS_HERO_INFO_2, SimpleElement.TYPE_HONOR);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_USER, SimpleContainer.CONTAINER_CLASS_HERO_INFO_2, SimpleElement.TYPE_LEVEL);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_USER, SimpleContainer.CONTAINER_CLASS_HERO_INFO_2, SimpleElement.TYPE_JUMP_VOUCHERS);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_SHIP, SimpleContainer.CONTAINER_CLASS_HERO_INFO_0, SimpleElement.TYPE_HITPOINTS);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_SHIP, SimpleContainer.CONTAINER_CLASS_HERO_INFO_0, SimpleElement.TYPE_SHIELD);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_SHIP, SimpleContainer.CONTAINER_CLASS_HERO_INFO_0, SimpleElement.TYPE_CARGO);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_SHIP, SimpleContainer.CONTAINER_CLASS_HERO_INFO_1, SimpleElement.TYPE_LASER);
this.main.getGuiManager().updateInfoField(SimpleWindow.WINDOW_CLASS_SHIP, SimpleContainer.CONTAINER_CLASS_HERO_INFO_1, SimpleElement.TYPE_ROCKETS);
this.main.setScheduledDisconnect(false);
if (Hero.admin) {
    this.main.getGuiManager().createCommandLineInterface();
}
this.main.getGuiManager().unlockWindow(SimpleWindow.WINDOW_CLASS_LOGOUT);
this.main.getGroupManager().init();
this.main.getGuiManager().destroyWindow(SimpleWindow.WINDOW_CLASS_TDM);
this.main.getTDMManager().cleanUp();
if (Main.showCross) {
    this.main.getGuiManager().showCrosshair();
    this.main.getGuiManager().moveCrosshairs(POSITION_X, POSITION_Y);
}
_loc10_.setCloak(CLOAKED);
this.isHeroLoaded = true;
this.dispatchSpacemapLoaded();



public function createShip(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:String, param8:int, param9:int, param10:int, param11:int, param12:int, param13:Boolean, param14:int, param15:Boolean) : Ship
{
    var _loc23_:ShipLightDecorator = null;
    if(!this.map.valid)
    {
        return null;
    }
    var _loc16_:MapObject;
    if((_loc16_ = this.getShip(param2)) != null)
    {
        if(_loc16_.shipPattern.getPatternID() == param1)
        {
            return _loc16_ as Ship;
        }
        if(_loc16_.isHeroShip())
        {
            this.removeHeroShip();
        }
        else
        {
            this.removeOpponentShip(param2,false);
        }
    }
    var _loc17_:ShipPattern;
    if((_loc17_ = PatternManager.shipPatterns[param1]) == null)
    {
        _loc17_ = PatternManager.shipPatterns[4];
        param6 = "! SHIP TYPE " + param1 + " NOT DEFINED !";
    }
    var _loc18_:AudibleResourcePattern = PatternManager.enginePatterns[_loc17_.getEngineTypeID()];
    var _loc19_:EngineSmokePattern = PatternManager.engineSmokePatterns[_loc17_.getEngineSmokeID()];
    var _loc20_:ResourcePattern = PatternManager.shipGlowPatterns[_loc17_.getGlowID()];
    var _loc21_:Ship;
    (_loc21_ = new Ship(this,param2,param6,this.getMap().getMain().screenManager.getLaserLayer())).explodeTypeID = _loc17_.getExplodeTypeID();
    _loc21_.setShipPattern(_loc17_);
    _loc21_.setEnginePattern(_loc18_);
    _loc21_.setEngineSmokePattern(_loc19_);
    _loc21_.setShipGlowPattern(_loc20_);
    _loc21_.setSpeed(param5);
    _loc21_.setClanTag(param7);
    _loc21_.setClanID(param9);
    _loc21_.setClanDiplomacy(param10);
    _loc21_.setFactionID(param8);
    _loc21_.setDailyRank(param11);
    _loc21_.setWarnIconOnMap(param13);
    _loc21_.createContainers();
    _loc21_.galaxyGatesFinished = param14;
    _loc21_.setNPC(param15);
    if(!param15)
    {
        _loc21_.isGroupMember = this.map.getMain().getGroupManager().isGroupMember(param2);
    }
    this.ships[int(param2)] = _loc21_;
    _loc21_.updateLabel();
    _loc21_.updateShipClip();
    _loc21_.setExpansionTypeID(param12);
    _loc21_.updateExpansionClip();
    _loc21_.setClipPosition(param3,param4);
    if(Settings.qualityEngine == Settings.QUALITY_HIGH)
    {
        _loc21_.startEngineTimer();
    }
    var _loc22_:*;
    if(_loc22_ = param2 == Hero.userID)
    {
        this.map.getMain().screenManager.hero = _loc21_;
        if(ScreenManager.cameraLock == ScreenManager.CAMERA_LOCKED_TO_HERO)
        {
            this.map.getMain().screenManager.getHeroLayer().addChild(_loc21_.getClipContainer());
        }
        else
        {
            this.map.getMain().screenManager.getShipLayer().addChild(_loc21_.getClipContainer());
        }
    }
    else
    {
        this.map.getMain().screenManager.getShipLayer().addChild(_loc21_.getClipContainer());
    }
    if(param1 == 98)
    {
        _loc21_.isPoliceShip = true;
        _loc21_.stopSirenAnimations();
        _loc21_.flashLights();
    }
    else if(param1 == 63)
    {
        _loc23_ = new ShipLightDecorator(_loc21_);
        _loc21_.shipLightDecorator = _loc23_;
        _loc21_.updateStandardVisualShipRotation = _loc23_.updateGraphicRotation;
        _loc21_.updateStandardVisualShipRotation();
    }
    return _loc21_;
}
