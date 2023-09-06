package net.bigpoint.darkorbit.map.model.ship
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.common.class_80;
   import package_10.class_305;
   import package_27.class_82;
   import package_29.class_267;
   import package_29.class_85;
   import package_9.class_50;
   
   public class class_378 extends class_267 implements class_80
   {
      
      private static const const_2729:Dictionary = new Dictionary();
       
      
      private var var_563:Dictionary;
      
      public function class_378()
      {
         this.var_563 = new Dictionary();
         super();
      }
      
      public static function method_569(param1:int, param2:class_86, param3:int) : void
      {
         var _loc4_:class_86;
         if((Boolean(_loc4_ = class_50.getInstance().map.method_1203().method_2455(param1) as class_86)) && Boolean(_loc4_.method_1954(class_378)))
         {
            class_378(_loc4_.method_1954(class_378)).dock(param2,param3);
         }
         else
         {
            if(true)
            {
               const_2729[param1] = [];
            }
            const_2729[param1].push({
               "minion":param2,
               "index":param3
            });
         }
      }
      
      public static function method_58(param1:int, param2:class_86) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(param2 == null)
         {
            return;
         }
         var _loc3_:class_86 = class_50.getInstance().map.method_1203().method_2455(param1) as class_86;
         if(Boolean(_loc3_) && Boolean(_loc3_.method_1954(class_378)))
         {
            class_378(_loc3_.method_1954(class_378)).undock(param2);
         }
         else if(false)
         {
            _loc4_ = const_2729[param1];
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(_loc4_.minion == param2)
               {
                  _loc4_.splice(_loc5_,1);
                  break;
               }
               _loc5_++;
            }
         }
      }
      
      public static function method_909() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in const_2729)
         {
            const_2729[_loc1_] = null;
            delete const_2729[_loc1_];
         }
      }
      
      override public function method_6037() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = const_2729[owner.id] as Array;
         if(_loc1_ != null)
         {
            for each(_loc2_ in _loc1_)
            {
               this.dock(_loc2_.minion,_loc2_.index);
            }
            this.method_6338();
            const_2729[owner.id] = null;
            delete const_2729[owner.id];
         }
      }
      
      public function updateObj(param1:Number) : void
      {
         this.method_6338();
      }
      
      private function undock(param1:class_85) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            class_82.playSoundEffect(112);
            for(_loc2_ in this.var_563)
            {
               if(this.var_563[_loc2_] == param1)
               {
                  this.var_563[_loc2_] = null;
                  delete this.var_563[_loc2_];
                  break;
               }
            }
         }
      }
      
      protected function method_6338() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc1_ in this.var_563)
         {
            _loc2_ = this.var_563[_loc1_] as class_85;
            if(_loc2_)
            {
               _loc3_ = owner.method_5851("dock_" + _loc1_);
               _loc2_.position.setTo(owner.x + _loc3_.x,owner.y + _loc3_.y,owner.z + _loc3_.z);
            }
         }
      }
      
      private function dock(param1:class_85, param2:int) : void
      {
         this.var_563[param2] = param1;
         this.method_6338();
      }
   }
}
