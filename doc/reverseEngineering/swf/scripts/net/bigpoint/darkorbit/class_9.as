package net.bigpoint.darkorbit
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.system.System;
   import flash.text.StyleSheet;
   import net.bigpoint.darkorbit.gui.class_55;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
   import net.bigpoint.darkorbit.net.class_53;
   import net.bigpoint.darkorbit.net.class_59;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_13.class_51;
   import package_15.class_54;
   import package_16.class_56;
   import package_17.class_62;
   import package_9.class_50;
   import package_9.class_61;
   import spark.components.SkinnableContainer;
   import spark.core.SpriteVisualElement;
   
   public class class_9 extends SpriteVisualElement
   {
      
      public static var var_635:String = "Unknown";
      
      public static var VERSION:String;
      
      public static var var_2751:XML;
      
      public static const const_3029:Boolean = false;
      
      public static var var_1501:StyleSheet;
      
      public static var var_1028:Boolean;
      
      public static var helpLink:String;
       
      
      public var name_47:class_50;
      
      public var guiManager:class_58;
      
      public var name_41:class_61;
      
      public var name_161:class_54;
      
      private var var_3515:SkinnableContainer;
      
      public var var_4954:Boolean = false;
      
      private var name_20:class_62;
      
      public var var_1908:MainClientApplication;
      
      private var var_12:class_53;
      
      public function class_9()
      {
         super();
         class_60.initialize();
         this.addEventListener(Event.ADDED_TO_STAGE,this.method_1798);
      }
      
      public static function method_1377(param1:String) : void
      {
         class_59.call(class_59.const_2017,[param1],System.exit,[0]);
      }
      
      private function method_1798(param1:Event = null) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.method_1798);
         Settings.parsePlayerVersion();
         var _loc2_:class_51 = new class_51(this,this.stage);
         this.name_20 = class_62.getInstance();
         this.name_20.method_5032(_loc2_);
         stage.dispatchEvent(new Event(Event.INIT));
         this.forwardEventDispatch(new Event(Event.INIT));
      }
      
      [SecureSWF(rename="off")]
      public function forwardEventDispatch(param1:Event) : void
      {
         this.var_1908.systemManager.dispatchEvent(param1);
      }
      
      public function method_1936() : void
      {
         var _loc1_:class_51 = new class_51(this,this.stage);
         this.name_20.method_2407(class_56.const_2687,_loc1_);
         this.name_20.removeCommand(class_56.const_2687);
         this.forwardEventDispatch(new Event("gameclient_start",true));
      }
      
      public function method_1644() : void
      {
         var _loc1_:DisplayObject = this.method_4489().method_2003().getChildByName("quickloader");
         var _loc2_:class_55 = this.method_4489().method_2003();
         if(_loc1_ && _loc2_ && Boolean(_loc2_.contains(_loc1_)))
         {
            _loc2_.removeChild(_loc1_);
         }
      }
      
      public function method_6154() : class_53
      {
         var _loc1_:* = null;
         if(this.var_12 == null)
         {
            _loc1_ = this.name_20.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy;
            this.var_12 = _loc1_.connectionManager;
         }
         return this.var_12;
      }
      
      public function method_4489() : class_58
      {
         return this.guiManager;
      }
      
      public function method_2732() : class_61
      {
         if(this.name_41 == null)
         {
            this.name_41 = new class_61(this);
         }
         return this.name_41;
      }
      
      public function method_4257() : class_54
      {
         return this.name_161;
      }
      
      public function method_360(param1:Boolean) : void
      {
         var_1028 = param1;
      }
      
      public function method_2045() : Boolean
      {
         return var_1028;
      }
      
      public function method_984() : void
      {
      }
      
      public function init(param1:MainClientApplication, param2:SkinnableContainer) : void
      {
         this.var_1908 = param1;
         this.var_3515 = param2;
         this.var_3515.width = stage.width;
         this.var_3515.height = stage.height;
         class_57.getInstance().init(param2);
      }
      
      public function get windowContainer() : SkinnableContainer
      {
         return this.var_3515;
      }
   }
}
