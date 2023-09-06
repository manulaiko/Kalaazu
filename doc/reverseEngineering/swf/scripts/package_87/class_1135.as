package package_87
{
   import com.bigpoint.utils.class_122;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.BPLocaleEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_271.BPLocalLoader;
   import package_271.class_1675;
   import package_272.class_1676;
   import package_84.class_1134;
   
   public class class_1135 extends class_1134
   {
       
      
      public function class_1135()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener(Event.COMPLETE,this.method_1312);
         var _loc3_:String = "undefinedspacemap/templates/language_undefined.xml?__cv=undefined";
         _loc2_.load(new URLRequest(_loc3_));
      }
      
      private function method_1312(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc2_:URLLoader = param1.target as URLLoader;
         _loc2_.removeEventListener(Event.COMPLETE,this.method_1312);
         var _loc3_:XMLList = XML(_loc2_.data).children();
         var _loc4_:Dictionary = new Dictionary();
         for each(_loc5_ in _loc3_)
         {
            _loc4_[_loc5_.attribute("name").toString()] = _loc5_.attribute("hash").toString();
         }
         _loc6_ = "null";
         _loc7_ = "undefinedspacemap/templates/" + _loc6_ + "/";
         _loc8_ = "undefinedspacemap/templates/" + _loc6_ + "/" + "flashres.xml?__cv=" + _loc4_["flashres"];
         _loc9_ = _loc7_ + "resource_quest.xml?__cv=" + _loc4_["resource_quest"];
         _loc10_ = _loc7_ + "resource_items.xml?__cv=" + _loc4_["resource_items"];
         _loc11_ = _loc7_ + "resource_achievement.xml?__cv=" + _loc4_["resource_achievement"];
         class_88.addEventListener(BPLocaleEvent.const_3138,this.method_5536);
         class_88.addEventListener(BPLocaleEvent.const_676,this.method_95);
         class_88.method_6172 = class_88.const_1244;
         this.load(new <class_1675>[new class_1675(_loc8_,""),new class_1675(_loc9_,"quests"),new class_1675(_loc10_,"items"),new class_1675(_loc11_,"achievements")]);
      }
      
      private function load(param1:Vector.<class_1675>) : void
      {
         new BPLocalLoader().method_3425(param1,this.method_5331);
      }
      
      private function method_5331(param1:Vector.<XML>) : void
      {
         var _loc2_:int = param1.length;
         var _loc3_:class_1676 = new class_1676();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.method_2367(param1[_loc4_]);
            _loc4_++;
         }
         param1.length = 0;
         this.method_5536();
      }
      
      private function method_6095(param1:BPLocaleEvent) : void
      {
      }
      
      private function method_4356(param1:BPLocaleEvent) : void
      {
      }
      
      private function method_95(param1:BPLocaleEvent) : void
      {
         this.commandComplete();
      }
      
      protected function method_5536(param1:BPLocaleEvent = null) : void
      {
         class_88.removeEventListener(BPLocaleEvent.const_3138,this.method_5536);
         class_122.method_3540();
         this.method_2449();
         this.commandComplete();
      }
      
      private function method_2449() : void
      {
         var _loc1_:String = class_88.getItem("no_clan");
         class_81.name_145 = _loc1_;
         class_81.var_4995 = _loc1_;
         class_88.method_4884("equipment_weapon_rocketlauncher_hst","HST");
         class_88.method_4884("loadingClaim","LOADING…");
         if(false)
         {
            class_88.method_4884("title_bannerad",class_88.getItem("title_bannerad") + " - " + class_88.getItem("title_bannerad_addendum"));
         }
         class_88.method_4884("btn_label_bannerad_shipdesignGlory","Get it now for only %PRICE|SYMBOL%!");
         class_88.method_4884("log_msg_gather_extra-energy_s",class_88.getItem("log_msg_gather_extra-energy_s_collected"));
         class_88.method_4884("log_msg_gather_extra-energy_p",class_88.getItem("log_msg_gather_extra-energy_p_collected"));
         class_88.method_4884("log_msg_gg_completed_y6",class_88.getItem("log_msg_gg_completed_bday"));
         class_88.method_4884("title_107",class_88.getItem("title_337"));
         class_88.method_4884("title_108",class_88.getItem("title_338"));
         class_88.method_4884("title_109",class_88.getItem("title_339"));
         class_88.method_4884("tutorial_video_msg_8_2",class_88.getItem("tutorial_video_msg_8_3"));
         class_88.method_4884("tutorial_video_msg_9",class_88.getItem("tutorial_video_msg_8_3"));
         class_88.method_4884("msg_station_built",class_88.getItem("msg_station_built_deflector_off"));
      }
   }
}
