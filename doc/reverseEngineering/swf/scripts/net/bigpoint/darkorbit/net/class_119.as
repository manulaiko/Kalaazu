package net.bigpoint.darkorbit.net
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_137.class_410;
   import package_137.class_412;
   import package_29.class_85;
   import package_36.class_409;
   import package_67.class_204;
   import package_75.class_411;
   
   public class class_119 extends class_96
   {
      
      private static const const_956:int = 3;
      
      private static var instance:class_119;
       
      
      private var var_139:Dictionary;
      
      private var var_296:class_204;
      
      private var main:class_9;
      
      public function class_119(param1:Function)
      {
         super();
         if(param1 !== method_336)
         {
            throw new Error("TechAssembly is a Singleton and can only be accessed through TechAssembly.getInstance()");
         }
         this.main = var_574;
         this.var_296 = new class_204(this.main);
         this.main.method_4489().var_296 = this.var_296;
         this.method_709();
      }
      
      public static function getInstance() : class_119
      {
         if(instance == null)
         {
            instance = new class_119(method_336);
         }
         return instance;
      }
      
      private static function method_336() : void
      {
      }
      
      private function method_709() : void
      {
         this.var_139 = new Dictionary();
         this.var_139[class_74.const_1690] = this.method_54;
         this.var_139[class_74.const_1506] = this.method_3809;
         this.var_139[class_74.const_673] = this.method_2869;
      }
      
      public function method_5080(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         if(this.var_139[_loc2_] != null)
         {
            this.var_139[_loc2_](param1);
         }
      }
      
      public function method_5008(param1:String, param2:int) : void
      {
         var _loc3_:int = int(class_412.method_4481(param1));
         if(_loc3_ > 0)
         {
            this.var_296.method_1530(_loc3_,param2);
         }
      }
      
      public function method_3891(param1:Array) : void
      {
         var _loc2_:String = param1[3];
         if(this.var_139[_loc2_] != null)
         {
            this.var_139[_loc2_](param1);
         }
      }
      
      private function method_3809(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:int = int(param1[4]);
         var _loc3_:Array = [int(param1[5])];
         var _loc4_:int = 6;
         while(_loc4_ < param1.length)
         {
            if(param1[_loc4_] != undefined)
            {
               _loc3_.push(int(param1[_loc4_]));
            }
            _loc4_++;
         }
         if(map != null)
         {
            _loc5_ = map.method_1203().method_2455(_loc2_);
            map.effects.method_269(new class_409(_loc5_,_loc3_));
         }
      }
      
      private function method_2869(param1:Array) : void
      {
         var _loc2_:String = param1[4];
         var _loc3_:int = int(param1[5]);
         var _loc4_:class_86;
         if((_loc4_ = map.method_1203().method_2455(_loc3_)) == null)
         {
            return;
         }
         switch(_loc2_)
         {
            case class_74.const_1897:
               map.effects.method_5565(new class_411(_loc4_));
         }
      }
      
      private function method_54(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = [];
         var _loc4_:int = 1;
         var _loc5_:int = 3;
         while(_loc5_ < param1.length)
         {
            _loc3_ = new class_410();
            _loc3_.type = _loc4_;
            if(int(param1[_loc5_] == 4))
            {
               _loc3_.status = 0;
            }
            else
            {
               _loc3_.status = int(param1[_loc5_]);
            }
            _loc3_.amount = int(param1[_loc5_ + 1]);
            _loc3_.var_3073 = int(param1[_loc5_ + 2]);
            _loc3_.method_1746();
            _loc2_.push(_loc3_);
            _loc4_++;
            _loc5_ += const_956;
         }
         this.var_296.method_6119(_loc2_);
      }
   }
}
