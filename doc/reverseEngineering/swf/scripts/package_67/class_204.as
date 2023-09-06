package package_67
{
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.gui.class_1051;
   import net.bigpoint.darkorbit.net.class_59;
   import net.bigpoint.darkorbit.net.class_74;
   import package_137.class_410;
   
   public class class_204
   {
       
      
      private var main:class_9;
      
      public var techs:Array;
      
      public var var_3972:Array;
      
      public const const_1377:int = 5;
      
      public const const_1612:int = 1;
      
      public const const_1506:int = 2;
      
      public const const_2289:int = 3;
      
      public const SHIELD_BACKUP:int = 4;
      
      public const const_1266:int = 5;
      
      public const SPEED_LEECH:int = 6;
      
      public var var_4390:Array;
      
      public function class_204(param1:class_9)
      {
         this.var_3972 = [];
         this.var_4390 = [];
         super();
         this.main = param1;
         var _loc2_:int = 1;
         while(_loc2_ <= 5)
         {
            this.var_3972[_loc2_] = new class_1051(_loc2_,0);
            _loc2_++;
         }
      }
      
      public function method_1530(param1:int, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc3_:class_1051 = this.var_3972[param1] as class_1051;
         _loc3_.seconds = param2;
         _loc3_.var_531 = param2;
         _loc3_.update();
         _loc3_.onCompleteCallback = this.method_4178;
         if(this.techs == null)
         {
            return;
         }
         var _loc6_:int = 1;
         while(_loc6_ < this.techs.length)
         {
            if((_loc4_ = this.techs[_loc6_] as class_410).type == param1)
            {
               _loc5_ = true;
               _loc4_.var_2403 = param2;
               _loc4_.var_4031 = param2 > 0;
            }
            _loc6_++;
         }
      }
      
      private function method_4178(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         if(this.techs == null)
         {
            return;
         }
         var _loc4_:int = 1;
         while(_loc4_ < this.techs.length)
         {
            _loc2_ = this.techs[_loc4_] as class_410;
            if(_loc2_.type == param1)
            {
               if(_loc2_.var_4031 == true)
               {
                  _loc2_.var_4031 = false;
                  _loc3_ = true;
               }
            }
            _loc4_++;
         }
      }
      
      public function method_6119(param1:Array) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.techs == null)
         {
            this.techs = [];
            _loc2_ = true;
         }
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            if((_loc5_ = param1[_loc7_] as class_410).type != 0)
            {
               _loc4_ = true;
            }
            if((_loc6_ = this.techs[_loc5_.type] as class_410) != null)
            {
               if((_loc6_.status == class_410.const_1625 || _loc6_.status == class_410.const_2076) && _loc5_.status == class_410.const_2671)
               {
                  _loc3_ = true;
               }
               _loc2_ = Boolean(_loc6_.method_3691(_loc5_)) || _loc2_;
            }
            else
            {
               this.techs[_loc5_.type] = _loc5_;
               _loc2_ = true;
            }
            (this.techs[_loc5_.type] as class_410).var_4031 = (this.var_3972[_loc5_.type] as class_1051).isRunning;
            (this.techs[_loc5_.type] as class_410).var_2403 = (this.var_3972[_loc5_.type] as class_1051).seconds;
            _loc7_++;
         }
         if(_loc3_)
         {
            class_59.call(class_59.const_68,[]);
         }
         this.method_1235();
      }
      
      public function method_1235() : void
      {
         var _loc1_:* = null;
         this.var_4390 = [];
         for each(_loc1_ in this.techs)
         {
            this.var_4390[_loc1_.type] = _loc1_.slot;
         }
      }
      
      public function method_5351(param1:int) : void
      {
         this.main.method_6154().sendCommand(class_74.const_1926,[param1]);
      }
      
      public function method_5733(param1:int) : void
      {
         this.main.method_6154().sendCommand(class_74.const_1926,[param1]);
      }
   }
}
