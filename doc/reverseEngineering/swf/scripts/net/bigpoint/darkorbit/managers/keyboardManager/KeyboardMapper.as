package net.bigpoint.darkorbit.managers.keyboardManager
{
   import package_191.FocusChatCommand;
   import package_191.PetRepairShipCommand;
   import package_191.ToggleCategoryBarCommand;
   import package_191.ZoomInCommand;
   import package_191.ZoomOutCommand;
   import package_191.class_1157;
   import package_191.class_1158;
   import package_191.class_1159;
   import package_191.class_1160;
   import package_191.class_1161;
   import package_191.class_1162;
   import package_191.class_1163;
   import package_191.class_1164;
   import package_191.class_1165;
   import package_191.class_1166;
   import package_191.class_1167;
   import package_191.class_1168;
   import package_191.class_1169;
   import package_191.class_1170;
   import package_192.class_1171;
   import package_192.class_1172;
   import package_9.class_50;
   
   public class KeyboardMapper
   {
      
      private static var _instance:KeyboardMapper;
      
      private static const const_2958:Object = new Object();
      
      {
         const_2958[class_1158.NAME] = class_1158;
         const_2958[class_1162.NAME] = class_1162;
         const_2958[class_1161.NAME] = class_1161;
         const_2958[class_1167.NAME] = class_1167;
         const_2958[class_1164.NAME] = class_1164;
         const_2958[class_1163.NAME] = class_1163;
         const_2958[class_1159.NAME] = class_1159;
         const_2958[class_1169.NAME] = class_1169;
         const_2958[class_1165.NAME] = class_1165;
         const_2958[class_1160.NAME] = class_1160;
         const_2958[class_1168.NAME] = class_1168;
         const_2958[class_1166.NAME] = class_1166;
         const_2958[class_1170.NAME] = class_1170;
         const_2958[ZoomInCommand.NAME] = ZoomInCommand;
         const_2958[ZoomOutCommand.NAME] = ZoomOutCommand;
         const_2958[PetRepairShipCommand.NAME] = PetRepairShipCommand;
         const_2958[FocusChatCommand.NAME] = FocusChatCommand;
         const_2958[ToggleCategoryBarCommand.NAME] = ToggleCategoryBarCommand;
      }
      
      private const const_2382:int = 222;
      
      private var var_4652:Array;
      
      private var var_415:Object;
      
      public function KeyboardMapper(param1:HiddenClass)
      {
         super();
         if(param1 is HiddenClass)
         {
            this.var_415 = new Object();
            this.method_5145();
            return;
         }
         throw new Error("use getInstance. its a singleton");
      }
      
      public static function getInstance() : KeyboardMapper
      {
         if(!_instance)
         {
            _instance = new KeyboardMapper(new HiddenClass());
         }
         return _instance;
      }
      
      public function method_4777(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Vector.<Object> = this.var_415[param1.toString()];
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = _loc3_[class_1172.NAME];
               _loc5_ = _loc3_[class_1172.const_882][_loc4_];
               if((_loc6_ = const_2958[_loc4_]) != null)
               {
                  (new _loc6_() as class_1157).execute(class_50.getInstance().map,_loc5_);
                  return;
               }
            }
         }
      }
      
      public function method_1900(param1:class_1171) : void
      {
         var _loc3_:* = null;
         var _loc2_:Object = param1.parse();
         for(_loc3_ in _loc2_)
         {
            if(this.var_415[_loc3_] != undefined || this.var_415[_loc3_] != null)
            {
               this.var_415[_loc3_] = null;
            }
            this.var_415[_loc3_] = _loc2_[_loc3_];
         }
         this.method_5145();
      }
      
      private function method_1170(param1:int) : void
      {
         delete this.var_415[param1.toString()];
      }
      
      private function method_5145() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         this.method_1491();
         var _loc3_:int = 0;
         while(_loc3_ <= 222)
         {
            _loc1_ = this.var_415[_loc3_.toString()];
            if(_loc1_)
            {
               for each(_loc4_ in _loc1_)
               {
                  _loc2_ = _loc4_[class_1172.NAME];
                  Vector.<int>(this.var_4652[_loc2_]).push(_loc3_);
               }
            }
            _loc3_++;
         }
      }
      
      private function method_1491() : void
      {
         var _loc1_:* = null;
         this.var_4652 = [];
         for(_loc1_ in const_2958)
         {
            this.var_4652[_loc1_] = new Vector.<int>();
         }
      }
      
      public function get commandMap() : Array
      {
         return this.var_4652;
      }
      
      public function method_6497(param1:String) : Vector.<int>
      {
         return this.var_4652[param1] as Vector.<int>;
      }
      
      public function method_5293(param1:String, param2:Vector.<String>) : Vector.<int>
      {
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc3_:Vector.<int> = this.var_4652[param1] as Vector.<int>;
         var _loc4_:Vector.<int> = new Vector.<int>();
         for each(_loc7_ in _loc3_)
         {
            for each(_loc8_ in this.var_415[_loc7_.toString()])
            {
               if((Boolean(_loc5_ = _loc8_[class_1172.const_882][param1])) && param2.length == _loc5_.length)
               {
                  _loc6_ = true;
                  _loc9_ = 0;
                  while(_loc9_ < param2.length)
                  {
                     if(param2[_loc9_] != _loc5_[_loc9_])
                     {
                        _loc6_ = false;
                     }
                     _loc9_++;
                  }
                  if(_loc6_)
                  {
                     _loc4_.push(_loc7_);
                  }
                  _loc6_ = false;
               }
            }
         }
         return _loc4_;
      }
      
      public function method_5159(param1:Vector.<int>) : void
      {
         var _loc2_:int = 0;
         for each(_loc2_ in param1)
         {
            this.method_1170(_loc2_);
         }
         this.method_5145();
      }
      
      public function cleanup() : void
      {
         this.var_415 = new Object();
      }
   }
}

class HiddenClass
{
    
   
   function HiddenClass()
   {
      super();
   }
}
