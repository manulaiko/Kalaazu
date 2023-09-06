package net.bigpoint.darkorbit.net
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_101.class_271;
   import package_136.class_1864;
   import package_136.class_394;
   import package_27.class_82;
   import package_29.class_85;
   import package_35.EffectManager;
   import package_36.class_399;
   import package_38.class_603;
   import package_75.class_1482;
   import package_75.class_1862;
   import package_75.class_1863;
   import package_75.class_1865;
   import package_75.class_1866;
   import package_9.class_50;
   
   public class class_1486 extends class_96
   {
      
      private static var instance:class_1486;
       
      
      public function class_1486(param1:Function)
      {
         super();
         if(param1 !== method_336)
         {
            throw new Error("EffectActivationAssembly is a Singleton and can only be accessed through EffectActivationAssembly.getInstance()");
         }
      }
      
      private static function method_336() : void
      {
      }
      
      public static function getInstance() : class_1486
      {
         if(instance == null)
         {
            instance = new class_1486(method_336);
         }
         return instance;
      }
      
      public function method_1485(param1:class_603) : void
      {
         var _loc7_:* = null;
         var _loc2_:class_50 = var_574.name_47;
         if(_loc2_.map == null)
         {
            return;
         }
         var _loc3_:int = int(param1.var_4266);
         var _loc4_:class_85;
         if((_loc4_ = _loc2_.map.method_327(_loc3_)) == null)
         {
            return;
         }
         var _loc5_:* = null;
         if(param1.var_21.length > 0)
         {
            _loc5_ = _loc2_.map.method_327(param1.var_21[0]);
         }
         var _loc6_:EffectManager = _loc2_.map.effects;
         switch(param1.var_2632)
         {
            case class_126.const_1423:
               _loc6_.method_584(new class_394(4000,_loc4_,_loc5_));
               break;
            case class_126.const_806:
               _loc6_.method_584(new class_1864(6000,_loc4_,_loc5_));
               break;
            case class_126.const_437:
               _loc6_.method_5565(new class_1863(_loc4_));
               break;
            case class_126.const_3104:
               _loc6_.method_5565(new class_1866(_loc4_));
               break;
            case class_126.const_448:
               _loc6_.method_5565(new class_1482(_loc4_ as class_86,true));
               break;
            case class_126.const_1752:
               if(Boolean(_loc4_) && _loc4_ is class_86)
               {
                  (_loc4_ as class_86).cloaked.value = true;
                  class_82.playSoundEffect(class_126.const_2529,false,false,_loc4_.x,_loc4_.y);
                  break;
               }
               class_82.playSoundEffect(class_126.const_2529,false,false);
               break;
            case class_126.const_545:
               _loc6_.method_269(new class_399(_loc4_,true));
               break;
            case class_126.const_3217:
               _loc6_.method_5565(new class_1865(_loc5_));
               break;
            case class_126.const_1685:
               if(Boolean(_loc4_) && _loc4_.id == class_81.userID)
               {
                  if(_loc7_ = map.hero.method_1954(class_271) as class_271)
                  {
                     _loc7_.method_813();
                     break;
                  }
                  break;
               }
               break;
            case class_126.const_128:
               _loc6_.method_5084(new class_1862(_loc4_,_loc5_,class_1862.NORMAL));
               break;
            case class_126.const_839:
               _loc6_.method_5084(new class_1862(_loc4_,_loc5_,class_1862.const_1782));
         }
      }
      
      public function method_2893(param1:int, param2:int) : void
      {
         var _loc3_:class_50 = var_574.name_47;
         if(_loc3_.map == null)
         {
            return;
         }
         var _loc4_:class_86 = _loc3_.map.method_1203().method_2455(param2);
         var _loc5_:int = -1;
         switch(param1)
         {
            case class_126.const_1423:
               _loc5_ = 0;
               break;
            case class_126.const_806:
               _loc5_ = 0;
         }
         if(_loc5_ != -1 && _loc4_ != null)
         {
            class_82.playSoundEffect(_loc5_,false,false,_loc4_.x,_loc4_.y);
         }
      }
   }
}
