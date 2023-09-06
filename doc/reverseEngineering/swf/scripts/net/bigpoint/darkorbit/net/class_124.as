package net.bigpoint.darkorbit.net
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_22.class_426;
   import package_27.class_82;
   import package_29.class_85;
   import package_36.class_425;
   import package_38.class_427;
   
   public class class_124 extends class_96
   {
      
      private static var instance:class_124;
       
      
      public var var_2562:Dictionary;
      
      private var var_139:Dictionary;
      
      private var main:class_9;
      
      public function class_124(param1:Function)
      {
         super();
         if(param1 !== method_336)
         {
            throw new Error("RocketLauncherAssembly is a Singleton and can only be accessed through RocketLauncherAssembly.getInstance()");
         }
         this.main = var_574;
         this.method_709();
         this.method_3372();
      }
      
      public static function getInstance() : class_124
      {
         if(instance == null)
         {
            instance = new class_124(method_336);
         }
         return instance;
      }
      
      private static function method_336() : void
      {
      }
      
      private function method_709() : void
      {
         this.var_139 = new Dictionary();
         this.var_139[class_74.const_3197] = this.method_54;
         this.var_139[class_74.const_1569] = this.method_54;
         this.var_139[class_74.const_1439] = this.method_1953;
         this.var_139[class_74.const_902] = this.method_1953;
      }
      
      private function method_3372() : void
      {
         this.var_2562 = new Dictionary();
         this.var_2562[class_427.const_345] = class_426.const_2290;
         this.var_2562[class_427.const_542] = class_426.const_1908;
         this.var_2562[class_427.const_536] = class_426.const_3215;
         this.var_2562[class_427.SAR01] = class_426.const_349;
         this.var_2562[class_427.SAR02] = class_426.const_1758;
         this.var_2562[class_427.CBR] = class_426.CBR;
         this.var_2562[class_427.const_329] = class_426.const_1360;
      }
      
      public function method_5080(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         if(this.var_139[_loc2_] != null)
         {
            this.var_139[_loc2_](param1);
         }
      }
      
      public function method_1953(param1:Array) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:int = int(param1[3]);
         var _loc3_:int = int(param1[4]);
         var _loc4_:int = int(param1[5]);
         var _loc5_:int = int(param1[6]);
         var _loc6_:Boolean = false;
         if(param1[7] == "M")
         {
            _loc6_ = true;
         }
         if(var_574.name_47.map != null)
         {
            _loc7_ = map.method_327(_loc2_);
            _loc8_ = map.method_327(_loc3_);
            if(Boolean(_loc7_) && Boolean(_loc8_))
            {
               var_574.name_47.map.effects.method_5084(new class_425(_loc7_,_loc8_,_loc5_,_loc4_,_loc6_));
            }
         }
      }
      
      private function method_1342(param1:Vector.<int>, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         Settings.rocketLauncherTypes = param1;
         Settings.selectedLauncherRocket = param2;
         Settings.rocketLauncherRocketsLoaded = param3;
         if(Settings.rocketLauncherTypes.length == 0 || Settings.rocketLauncherTypes[0] == 0)
         {
            Settings.rocketLauncherRocketsLoaded = 0;
         }
         else
         {
            _loc4_ = 0;
            for each(_loc5_ in Settings.rocketLauncherTypes)
            {
               if(_loc5_ == 1)
               {
                  _loc4_ += 3;
               }
               else if(_loc5_ == 2)
               {
                  _loc4_ += 5;
               }
            }
            if(false && Settings.rocketLauncherRocketsLoaded < _loc4_)
            {
               class_82.playSoundEffect(class_126.const_354);
            }
            else if(false && Settings.rocketLauncherRocketsLoaded < _loc4_)
            {
               class_82.playSoundEffect(class_126.const_426);
            }
            else if(Settings.rocketLauncherRocketsLoaded == _loc4_)
            {
               class_82.playSoundEffect(class_126.const_689);
            }
         }
      }
      
      public function method_54(param1:Array) : void
      {
         var _loc2_:Vector.<int> = new Vector.<int>();
         _loc2_.push(int(param1[3]));
         this.method_1342(_loc2_,int(param1[4]),int(param1[5]));
      }
   }
}
