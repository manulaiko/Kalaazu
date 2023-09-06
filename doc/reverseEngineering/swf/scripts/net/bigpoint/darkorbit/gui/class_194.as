package net.bigpoint.darkorbit.gui
{
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.net.class_53;
   import package_17.class_62;
   import package_172.class_1057;
   import package_173.class_1058;
   import package_173.class_1059;
   import package_38.class_665;
   import package_38.class_753;
   import package_38.class_955;
   import package_9.class_50;
   
   public final class class_194
   {
      
      private static var _instance:class_194 = new class_194();
       
      
      private var ships:Vector.<class_955>;
      
      private var var_5004:class_53;
      
      private var var_4295:Sprite;
      
      private var var_3011:class_1059;
      
      private var var_4466:Boolean = false;
      
      private var var_3408:Boolean = false;
      
      private var var_112:Boolean;
      
      public function class_194()
      {
         super();
         if(_instance)
         {
            throw new Error("Singleton and can only access with Singleton.getInstance()");
         }
      }
      
      public static function getInstance() : class_194
      {
         return _instance;
      }
      
      public function method_226(param1:Vector.<class_955>, param2:Boolean, param3:Sprite, param4:class_53) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         this.method_132();
         this.ships = param1;
         this.var_112 = param2;
         this.var_4295 = param3;
         this.var_5004 = param4;
         this.var_3011 = new class_1059(param2);
         this.method_3986();
         var _loc5_:Boolean = false;
         while(!_loc5_)
         {
            _loc5_ = true;
            _loc7_ = 0;
            while(_loc7_ < param1.length - 1)
            {
               _loc8_ = param1[_loc7_] as class_955;
               _loc9_ = param1[_loc7_ + 1] as class_955;
               if(_loc8_.var_4881 > _loc9_.var_4881)
               {
                  _loc5_ = false;
                  _loc10_ = param1[_loc7_];
                  param1[_loc7_] = param1[_loc7_ + 1];
                  param1[_loc7_ + 1] = _loc10_;
                  _loc10_ = null;
               }
               _loc7_++;
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc11_ = param1[_loc6_] as class_955;
            _loc12_ = new class_1058(_loc11_.name_126,_loc11_.var_2618,_loc11_.var_1235,_loc11_.var_1694,_loc11_.var_3141,_loc11_.var_4881,_loc11_.var_3441);
            _loc12_.x = (_loc12_.width + class_1059.var_1732) * _loc6_;
            this.var_3011.method_4529(_loc12_);
            _loc6_++;
         }
         this.var_4295.addChild(this.var_3011);
         this.var_3011.addEventListener(class_1057.SHIP_SELECTION_MADE,this.method_430);
         this.var_3011.addEventListener(class_1057.CLOSE_SELECTION_WINDOW,this.closeWindow);
         class_62.getInstance().sendNotification(FeaturesMenuNotifications.TOGGLE_BTN_SELECTION,true,GuiConstants.SHIP_WARP_WINDOW);
      }
      
      public function method_3986() : void
      {
         if(this.var_3011)
         {
            this.var_3011.x = Number(class_50.method_1849()) - Number(this.var_3011.width) / 2;
            this.var_3011.y = Number(class_50.method_5866()) - Number(this.var_3011.height) / 2;
         }
      }
      
      private function method_132() : void
      {
         if(this.var_4295 != null && this.var_3011 != null)
         {
            this.var_3011.method_2014();
            this.var_4295.removeChild(this.var_3011);
            this.var_3011 = null;
            this.var_3408 = false;
         }
      }
      
      public function closeWindow(param1:class_1057 = null, param2:Boolean = false) : void
      {
         if(this.var_4295 != null && this.var_3011 != null)
         {
            this.var_3408 = param2;
            this.var_3011.method_2014();
            this.var_4295.removeChild(this.var_3011);
            this.var_3011 = null;
            this.var_4466 = false;
            class_62.getInstance().sendNotification(FeaturesMenuNotifications.TOGGLE_BTN_SELECTION,false,GuiConstants.SHIP_WARP_WINDOW);
         }
      }
      
      private function method_430(param1:class_1057) : void
      {
         this.var_4295.removeChild(this.var_3011);
         var _loc2_:class_753 = new class_753();
         _loc2_.var_2618 = param1.var_1611;
         this.var_5004.sendRequest(_loc2_);
         this.var_3011 = null;
         this.var_4466 = false;
         this.var_3408 = false;
         class_62.getInstance().sendNotification(FeaturesMenuNotifications.TOGGLE_BTN_SELECTION,false,GuiConstants.SHIP_WARP_WINDOW);
      }
      
      public function method_977() : Boolean
      {
         return this.var_4466;
      }
      
      public function method_12(param1:Boolean) : void
      {
         this.var_4466 = param1;
      }
      
      public function method_1965() : void
      {
         if(this.var_3011)
         {
            this.var_3011.method_1965();
         }
      }
      
      public function method_1863() : void
      {
         if(this.var_3011)
         {
            this.var_3011.method_28();
         }
      }
      
      public function method_1522() : void
      {
         var _loc1_:* = null;
         if(!this.var_3408)
         {
            return;
         }
         this.var_4466 = true;
         _loc1_ = new class_665("ship_warp");
         class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,_loc1_);
      }
   }
}
