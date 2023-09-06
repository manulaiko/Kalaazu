package package_405
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import net.bigpoint.darkorbit.fui.components.bars.SliderNSteps;
   import net.bigpoint.darkorbit.fui.components.bars.TabBar;
   import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
   import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBox;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.list.dropdownbox.DropDownBox;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
   import net.bigpoint.darkorbit.fui.components.scroll.ScrollEvent;
   import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import net.bigpoint.darkorbit.settings.Settings;
   
   public class class_2296 extends Sprite
   {
       
      
      private var var_3229:TabBar;
      
      private var var_3602:Coreponent;
      
      private var var_1797:CheckBox;
      
      private var var_1314:CheckBox;
      
      private var var_370:Label;
      
      private var var_1894:SliderNSteps;
      
      private var var_4358:Label;
      
      private var var_335:Coreponent;
      
      private var var_3075:DropDownBox;
      
      private var var_4740:DropDownBox;
      
      private var var_2523:DropDownBox;
      
      private var var_1281:DropDownBox;
      
      private var var_3931:DropDownBox;
      
      private var var_4648:DropDownBox;
      
      private var var_4703:Coreponent;
      
      private var var_4687:DropDownBox;
      
      private var var_2123:DropDownBox;
      
      private var var_1256:DropDownBox;
      
      private var var_2825:DropDownBox;
      
      private var var_2463:DropDownBox;
      
      private var var_1243:DropDownBox;
      
      private var var_1713:DropDownBox;
      
      private var var_2023:DropDownBox;
      
      private var var_2293:Coreponent;
      
      private var var_690:CheckBox;
      
      private var var_639:CheckBox;
      
      private var var_1779:CheckBox;
      
      private var var_893:CheckBox;
      
      private var var_579:CheckBox;
      
      private var var_1717:CheckBox;
      
      private var var_1262:CheckBox;
      
      private var var_2883:CheckBox;
      
      private var var_4008:CheckBox;
      
      private var var_978:Coreponent;
      
      private var var_2114:ItemList;
      
      private var var_4816:Scrollbar;
      
      private var var_3635:Button;
      
      private var var_4304:Coreponent;
      
      private var var_1478:CheckBox;
      
      private var var_2190:SliderNSteps;
      
      private var var_2693:SliderNSteps;
      
      private var var_618:SliderNSteps;
      
      private var var_4268:Coreponent;
      
      private var var_4145:ItemList;
      
      private var var_965:Scrollbar;
      
      private var var_4669:Label;
      
      private var var_3143:Vector.<Coreponent>;
      
      private var var_2718:Vector.<DropDownBox>;
      
      private var var_542:Button;
      
      private var var_3154:Button;
      
      private var var_4282:Button;
      
      private var var_4477:Coreponent;
      
      private var var_3478:Coreponent;
      
      public function class_2296(param1:Coreponent)
      {
         super();
         this.var_3478 = param1;
         this.var_3229 = (param1.getChildByName("tabBarContainer") as Coreponent).getChildByName("settingsBar") as TabBar;
         this.var_3602 = param1.getChildByName("displaySettingsContainer") as Coreponent;
         var _loc2_:Coreponent = this.var_3602.getChildByName("firstLineLayout") as Coreponent;
         this.var_1314 = _loc2_.getChildByName("use2D") as CheckBox;
         this.var_370 = _loc2_.getChildByName("use2DLabel") as Label;
         this.var_1797 = this.displaySettingsContainer.getChildByName("advancedMode") as CheckBox;
         this.var_1894 = this.displaySettingsContainer.getChildByName("sliderDisplayQuality") as SliderNSteps;
         this.var_4358 = this.displaySettingsContainer.getChildByName("graphicsQualityValueLabel") as Label;
         this.var_2718 = new Vector.<DropDownBox>();
         this.var_335 = this.displaySettingsContainer.getChildByName("advancedSettingsContainer2D") as Coreponent;
         this.var_3075 = this.method_609.getChildByName("qualityBackground") as DropDownBox;
         if(false)
         {
            this.var_3075.updateAvailableEntries(new <String>["quality_no","quality_medium","quality_good","quality_high"]);
         }
         else
         {
            this.var_3075.updateAvailableEntries(new <String>["quality_no","quality_medium","quality_good"]);
         }
         this.var_2718.push(this.method_4056);
         this.var_4740 = this.method_609.getChildByName("qualityZones") as DropDownBox;
         this.var_4740.updateAvailableEntries(new <String>["quality_low","quality_medium","quality_high"]);
         this.var_2718.push(this.method_1279);
         this.var_2523 = this.method_609.getChildByName("qualityShips") as DropDownBox;
         this.var_2523.updateAvailableEntries(new <String>["quality_low","quality_high"]);
         this.var_2718.push(this.method_6445);
         this.var_1281 = this.method_609.getChildByName("qualityEngines") as DropDownBox;
         this.var_2718.push(this.method_6102);
         this.var_3931 = this.method_609.getChildByName("qualityExplosions") as DropDownBox;
         this.var_3931.updateAvailableEntries(new <String>["quality_no","quality_medium","quality_good","quality_high"]);
         this.var_2718.push(this.method_3935);
         this.var_4648 = this.method_609.getChildByName("resourcesBoxes") as DropDownBox;
         this.var_4648.updateAvailableEntries(new <String>["quality_low","quality_high"]);
         this.var_2718.push(this.method_703);
         this.var_4703 = this.displaySettingsContainer.getChildByName("advancedSettingsContainer3D") as Coreponent;
         this.var_4687 = this.method_557.getChildByName("qualityAntialias") as DropDownBox;
         this.var_2718.push(this.method_1284);
         this.var_2123 = this.method_557.getChildByName("qualityLights") as DropDownBox;
         this.var_2123.updateAvailableEntries(new <String>["quality_low","quality_medium","quality_high"]);
         this.var_2718.push(this.method_2576);
         this.var_1256 = this.method_557.getChildByName("qualityTextures") as DropDownBox;
         this.var_1256.updateAvailableEntries(new <String>["quality_low","quality_medium","quality_high"]);
         this.var_2718.push(this.method_6387);
         this.var_2825 = this.method_557.getChildByName("sizeTextures") as DropDownBox;
         this.var_2825.updateAvailableEntries(new <String>["quality_low","quality_medium","quality_high"]);
         this.var_2718.push(this.method_4457);
         this.var_2463 = this.method_557.getChildByName("qualityEffects") as DropDownBox;
         this.var_2718.push(this.method_1223);
         this.var_1243 = this.method_557.getChildByName("textureFiltering") as DropDownBox;
         this.var_1243.updateAvailableEntries(new <String>["quality_low","quality_medium","quality_high"]);
         this.var_2718.push(this.method_2129);
         this.var_1713 = this.method_557.getChildByName("qualityBackground3D") as DropDownBox;
         this.var_2718.push(this.method_1597);
         this.var_2023 = this.method_557.getChildByName("qualityZones3D") as DropDownBox;
         this.var_2718.push(this.method_3419);
         this.var_2293 = param1.getChildByName("gameplaySettingsContainer") as Coreponent;
         this.var_690 = this.gameplaySettingsContainer.getChildByName("autoWeaponBoost") as CheckBox;
         this.var_639 = this.gameplaySettingsContainer.getChildByName("autoAmmoChange") as CheckBox;
         this.var_1779 = this.gameplaySettingsContainer.getChildByName("autoMaterialRefinement") as CheckBox;
         this.var_893 = this.gameplaySettingsContainer.getChildByName("toggleAttackQuickbar") as CheckBox;
         this.var_579 = this.gameplaySettingsContainer.getChildByName("autoLogin") as CheckBox;
         this.var_1717 = this.gameplaySettingsContainer.getChildByName("doubleClickAttack") as CheckBox;
         this.var_1262 = this.gameplaySettingsContainer.getChildByName("autoBuyBootyKeys") as CheckBox;
         this.var_2883 = this.gameplaySettingsContainer.getChildByName("showBattlerayNotifications") as CheckBox;
         this.var_4008 = this.gameplaySettingsContainer.getChildByName("showLowHpWarning") as CheckBox;
         this.var_978 = param1.getChildByName("interfaceSettingsContainer") as Coreponent;
         this.var_2114 = this.interfaceSettingsContainer.getChildByName("interfaceSettingsItemlist") as ItemList;
         this.var_2114.itemDataAssigner = class_2536;
         this.var_4816 = this.interfaceSettingsContainer.getChildByName("interfaceSettingsScrollbar") as Scrollbar;
         this.var_4816.addEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED,this.method_3378);
         this.var_2114.addEventListener(MouseEvent.MOUSE_WHEEL,this.method_243);
         this.var_3635 = this.interfaceSettingsContainer.getChildByName("configButton") as Button;
         this.var_4304 = param1.getChildByName("soundSettingsContainer") as Coreponent;
         this.var_1478 = this.soundSettingsContainer.getChildByName("playCombatMusic") as CheckBox;
         this.var_2190 = this.soundSettingsContainer.getChildByName("sliderSoundVolume") as SliderNSteps;
         this.var_2693 = this.soundSettingsContainer.getChildByName("sliderMusicVolume") as SliderNSteps;
         this.var_618 = this.soundSettingsContainer.getChildByName("sliderBoardcomputerVolume") as SliderNSteps;
         this.var_4268 = param1.getChildByName("keyboardSettingsContainer") as Coreponent;
         this.var_4145 = this.keyboardSettingsContainer.getChildByName("keyboardSettingsItemlist") as ItemList;
         this.var_4145.itemDataAssigner = class_2537;
         this.var_965 = this.keyboardSettingsContainer.getChildByName("keyboardSettingsScrollbar") as Scrollbar;
         this.var_965.addEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED,this.method_405);
         this.var_4145.addEventListener(MouseEvent.MOUSE_WHEEL,this.method_1724);
         this.var_4669 = this.var_4268.getChildByName("keyboardPressKeyToBind") as Label;
         this.var_3143 = new Vector.<Coreponent>();
         this.var_3143.push(this.displaySettingsContainer);
         this.var_3143.push(this.gameplaySettingsContainer);
         this.var_3143.push(this.interfaceSettingsContainer);
         this.var_3143.push(this.soundSettingsContainer);
         this.var_3143.push(this.keyboardSettingsContainer);
         this.var_542 = param1.getChildByName("saveButton") as Button;
         this.var_3154 = param1.getChildByName("cancelButton") as Button;
         this.var_4282 = param1.getChildByName("resetButton") as Button;
         this.var_4477 = param1.getChildByName("busyMC") as Coreponent;
      }
      
      private function method_1724(param1:MouseEvent) : void
      {
         if(this.var_965)
         {
            this.var_965.updateScrollPositionByScrollDelta(param1.delta);
         }
      }
      
      private function method_405(param1:ScrollEvent) : void
      {
         var _loc2_:Number = NaN;
         if(this.var_965)
         {
            _loc2_ = Number(this.var_965.getScrollPositionInPercent());
            this.method_4256.setScrollPositionInPercent(_loc2_);
         }
      }
      
      private function method_243(param1:MouseEvent) : void
      {
         if(this.var_4816)
         {
            this.var_4816.updateScrollPositionByScrollDelta(param1.delta);
         }
      }
      
      private function method_3378(param1:ScrollEvent) : void
      {
         var _loc2_:Number = NaN;
         if(this.var_4816)
         {
            _loc2_ = Number(this.var_4816.getScrollPositionInPercent());
            this.method_6155.setScrollPositionInPercent(_loc2_);
         }
      }
      
      public function get tabbar() : TabBar
      {
         return this.var_3229;
      }
      
      public function get displaySettingsContainer() : Coreponent
      {
         return this.var_3602;
      }
      
      public function get advanced() : CheckBox
      {
         return this.var_1797;
      }
      
      public function get use2D() : CheckBox
      {
         return this.var_1314;
      }
      
      public function get use2DLabel() : Label
      {
         return this.var_370;
      }
      
      public function get method_1139() : SliderNSteps
      {
         return this.var_1894;
      }
      
      public function get method_609() : Coreponent
      {
         return this.var_335;
      }
      
      public function get method_4056() : DropDownBox
      {
         return this.var_3075;
      }
      
      public function get method_1279() : DropDownBox
      {
         return this.var_4740;
      }
      
      public function get method_6445() : DropDownBox
      {
         return this.var_2523;
      }
      
      public function get method_6102() : DropDownBox
      {
         return this.var_1281;
      }
      
      public function get method_3935() : DropDownBox
      {
         return this.var_3931;
      }
      
      public function get method_703() : DropDownBox
      {
         return this.var_4648;
      }
      
      public function get method_557() : Coreponent
      {
         return this.var_4703;
      }
      
      public function get method_1284() : DropDownBox
      {
         return this.var_4687;
      }
      
      public function get method_2576() : DropDownBox
      {
         return this.var_2123;
      }
      
      public function get method_6387() : DropDownBox
      {
         return this.var_1256;
      }
      
      public function get method_4457() : DropDownBox
      {
         return this.var_2825;
      }
      
      public function get method_1223() : DropDownBox
      {
         return this.var_2463;
      }
      
      public function get method_2129() : DropDownBox
      {
         return this.var_1243;
      }
      
      public function get method_1597() : DropDownBox
      {
         return this.var_1713;
      }
      
      public function get method_3419() : DropDownBox
      {
         return this.var_2023;
      }
      
      public function get gameplaySettingsContainer() : Coreponent
      {
         return this.var_2293;
      }
      
      public function get method_2761() : CheckBox
      {
         return this.var_690;
      }
      
      public function get method_4459() : CheckBox
      {
         return this.var_639;
      }
      
      public function get method_1879() : CheckBox
      {
         return this.var_1779;
      }
      
      public function get method_4351() : CheckBox
      {
         return this.var_893;
      }
      
      public function get autoLogin() : CheckBox
      {
         return this.var_579;
      }
      
      public function get doubleClickAttack() : CheckBox
      {
         return this.var_1717;
      }
      
      public function get method_6156() : CheckBox
      {
         return this.var_1262;
      }
      
      public function get showBattlerayNotifications() : CheckBox
      {
         return this.var_2883;
      }
      
      public function get showLowHpWarning() : CheckBox
      {
         return this.var_4008;
      }
      
      public function get interfaceSettingsContainer() : Coreponent
      {
         return this.var_978;
      }
      
      public function get method_6155() : ItemList
      {
         return this.var_2114;
      }
      
      public function get method_1689() : Button
      {
         return this.var_3635;
      }
      
      public function get soundSettingsContainer() : Coreponent
      {
         return this.var_4304;
      }
      
      public function get playCombatMusic() : CheckBox
      {
         return this.var_1478;
      }
      
      public function get method_2475() : SliderNSteps
      {
         return this.var_2190;
      }
      
      public function get musicVolume() : SliderNSteps
      {
         return this.var_2693;
      }
      
      public function get method_4421() : SliderNSteps
      {
         return this.var_618;
      }
      
      public function get keyboardSettingsContainer() : Coreponent
      {
         return this.var_4268;
      }
      
      public function get method_4256() : ItemList
      {
         return this.var_4145;
      }
      
      public function get method_4174() : Vector.<Coreponent>
      {
         return this.var_3143;
      }
      
      public function get method_1858() : Vector.<DropDownBox>
      {
         return this.var_2718;
      }
      
      public function get method_5107() : Button
      {
         return this.var_542;
      }
      
      public function get method_801() : Button
      {
         return this.var_3154;
      }
      
      public function get method_4031() : Button
      {
         return this.var_4282;
      }
      
      public function get method_5869() : Label
      {
         return this.var_4358;
      }
      
      public function get method_5610() : Label
      {
         return this.var_4669;
      }
      
      public function get busyMC() : Coreponent
      {
         return this.var_4477;
      }
      
      public function get method_3367() : Coreponent
      {
         return this.var_3478;
      }
   }
}
