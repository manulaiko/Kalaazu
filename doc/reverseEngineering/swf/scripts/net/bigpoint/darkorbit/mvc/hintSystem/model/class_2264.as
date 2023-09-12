package net.bigpoint.darkorbit.mvc.hintSystem.model {

import flash.utils.Dictionary;

import package_38.class_672;

import package_392.class_2265;

import package_451.HintSystemAttackContentDescription;
import package_451.HintSystemBetterEquipmentInTheShopContentDescription;
import package_451.HintSystemBoostingYourEquipmentContentDescription;
import package_451.HintSystemChangingShipsContentDescription;
import package_451.HintSystemFullCargoBoxContentDescription;
import package_451.HintSystemGettingMoreAmmunitionContentDescription;
import package_451.HintSystemHowToFlyContentDescription;
import package_451.HintSystemInstallingNewEquipmentContentDescription;
import package_451.HintSystemJumpGatesContentDescription;
import package_451.HintSystemJumpGatesDeviceContentDescription;
import package_451.HintSystemPVPWarningContentDescription;
import package_451.HintSystemPolicyChangesContentDescription;
import package_451.HintSystemPrepareTheBattleContentDescription;
import package_451.HintSystemRequestAMissionContentDescription;
import package_451.HintSystemSellingResourcesContentDescription;
import package_451.HintSystemShipRepairContentDescription;
import package_451.HintSystemSkylabContentDescription;
import package_451.HintSystemUnknownDangersContentDescription;
import package_451.HintSystemWealthyFamousContentDescription;
import package_451.HintSystemWelcomeContentDescription;
import package_451.class_2513;

import package_452.HintSystemAuctionHouseContentDescription;
import package_452.HintSystemClanBattleStationContentDescription;
import package_452.HintSystemContactlistContentDescription;
import package_452.HintSystemExtraCPUsContentDescription;
import package_452.HintSystemGalaxyGatesContentDescription;
import package_452.HintSystemLookingForGroupsContentDescription;
import package_452.HintSystemOresTransferContentDescription;
import package_452.HintSystemPalladiumContentDescription;
import package_452.HintSystemRocketLauncherContentDescription;
import package_452.HintSystemSecondConfigurationDescription;
import package_452.HintSystemShipdesignContentDescription;
import package_452.HintSystemSkillTreeContentDescription;
import package_452.HintSystemTechFactoryContent;
import package_452.HintSystemUpgradingItemsDescription;
import package_452.class_2511;
import package_452.class_2512;

public class class_2264 {

    private static var _content: Dictionary = new Dictionary();

    private static var _initialized: Boolean = false;


    public function class_2264() {
        super();
    }

    public static function init(): void {
        if (_initialized) {
            return;
        }
        _content[class_672.WELCOME] = new HintSystemWelcomeContentDescription("WELCOME");
        _content[class_672.HOW_TO_FLY] = new HintSystemHowToFlyContentDescription("HOW_TO_FLY");
        _content[class_672.REQUEST_MISSION] = new HintSystemRequestAMissionContentDescription("REQUEST_MISSION");
        _content[class_672.ATTACK] = new HintSystemAttackContentDescription("ATTACK");
        _content[class_672.SHIP_REPAIR] = new HintSystemShipRepairContentDescription("SHIP_REPAIR");
        _content[class_672.SELL_RESOURCE] = new HintSystemSellingResourcesContentDescription("SELL_RESOURCE");
        _content[class_672.WEALTHY_FAMOUS] = new HintSystemWealthyFamousContentDescription("WEALTHY_FAMOUS");
        _content[class_672.BOOST_YOUR_EQUIP] = new HintSystemBoostingYourEquipmentContentDescription("BOOST_YOUR_EQUIP");
        _content[class_672.GET_MORE_AMMO] = new HintSystemGettingMoreAmmunitionContentDescription("GET_MORE_AMMO");
        _content[class_672.PREPARE_BATTLE] = new HintSystemPrepareTheBattleContentDescription("PREPARE_BATTLE");
        _content[class_672.JUMP_GATES] = new HintSystemJumpGatesContentDescription("JUMP_GATES");
        _content[class_672.JUMP_DEVICE] = new HintSystemJumpGatesDeviceContentDescription("JUMP_DEVICE");
        _content[class_672.INSTALLING_NEW_EQUIPMENT] = new HintSystemInstallingNewEquipmentContentDescription("INSTALLING_NEW_EQUIPMENT");
        _content[class_672.THE_SHOP] = new HintSystemBetterEquipmentInTheShopContentDescription("THE_SHOP");
        _content[class_672.CHANGING_SHIPS] = new HintSystemChangingShipsContentDescription("CHANGING_SHIPS");
        _content[class_672.PVP_WARNING] = new HintSystemPVPWarningContentDescription("PVP_WARNING");
        _content[class_672.EQUIP_YOUR_ROCKETS] = new class_2513("EQUIP_YOUR_ROCKETS");
        _content[class_672.UNKOWN_DANGERS] = new HintSystemUnknownDangersContentDescription("UNKOWN_DANGERS");
        _content[class_672.SKYLAB] = new HintSystemSkylabContentDescription("SKYLAB");
        _content[class_672.POLICY_CHANGES] = new HintSystemPolicyChangesContentDescription("POLICY_CHANGES");
        _content[class_672.FULL_CARGO] = new HintSystemFullCargoBoxContentDescription("FULL_CARGO");
        _content[class_672.AUCTION_HOUSE] = new HintSystemAuctionHouseContentDescription("AUCTION_HOUSE");
        _content[class_672.CLAN_BATTLE_STATION] = new HintSystemClanBattleStationContentDescription("CLAN_BATTLE_STATION");
        _content[class_672.CONTACT_LIST] = new HintSystemContactlistContentDescription("CONTACT_LIST");
        _content[class_672.EXTRA_CPU] = new HintSystemExtraCPUsContentDescription("EXTRA_CPU");
        _content[class_672.GALAXY_GATE] = new HintSystemGalaxyGatesContentDescription("GALAXY_GATE");
        _content[class_672.LOOKING_FOR_GROUPS] = new HintSystemLookingForGroupsContentDescription("LOOKING_FOR_GROUPS");
        _content[class_672.ORE_TRANSFER] = new HintSystemOresTransferContentDescription("ORE_TRANSFER");
        _content[class_672.PALLADIUM] = new HintSystemPalladiumContentDescription("PALLADIUM");
        _content[class_672.ROCKET_LAUNCHER] = new HintSystemRocketLauncherContentDescription("ROCKET_LAUNCHER");
        _content[class_672.SECOND_CONFIGURATION] = new HintSystemSecondConfigurationDescription("SECOND_CONFIGURATION");
        _content[class_672.SHIP_DESIGN] = new HintSystemShipdesignContentDescription("SHIP_DESIGN");
        _content[class_672.SKILL_TREE] = new HintSystemSkillTreeContentDescription("SKILL_TREE");
        _content[class_672.TECH_FACTORY] = new HintSystemTechFactoryContent("TECH_FACTORY");
        _content[class_672.const_2835] = new class_2512("QUICK_ACCESS_BAR");
        _content[class_672.ITEM_UPGRADE] = new HintSystemUpgradingItemsDescription("ITEM_UPGRADE");
        _content[class_672.TRAINING_GROUNDS] = new class_2511("TRAINING_GROUNDS");
        _initialized = true;
    }

    private static function method_633(param1: XML): void {
    }

    public static function method_473(param1: uint): class_2265 {
        init();
        var _loc2_: class_2265 = _content[param1];
        if (_loc2_) {
            _loc2_.id = param1;
        }
        return _loc2_;
    }
}
}
