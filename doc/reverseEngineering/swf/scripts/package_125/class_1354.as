package package_125
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_124.class_1340;
   import package_29.class_85;
   import package_36.class_1818;
   import package_36.class_1819;
   import package_38.class_849;
   import package_75.class_349;
   import package_84.class_243;
   
   public class class_1354 extends class_243
   {
       
      
      public function class_1354()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc12_:int = 0;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         super.execute(param1);
         var _loc2_:class_849 = param1.getBody() as class_849;
         var _loc3_:int = int(_loc2_.name_133);
         var _loc4_:int = int(_loc2_.var_4862);
         var _loc5_:String = class_352.method_425(_loc2_.var_2806.var_468);
         var _loc6_:int = int(_loc2_.var_2147);
         var _loc7_:int = int(_loc2_.var_1623);
         var _loc8_:int = int(_loc2_.var_1551);
         var _loc9_:int = int(_loc2_.damage);
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = true;
         if(map == null)
         {
            return;
         }
         var _loc13_:class_85 = map.method_327(_loc3_);
         var _loc14_:class_85 = map.method_327(_loc4_);
         switch(_loc5_)
         {
            case class_352.REPAIR:
               _loc12_ = 2;
               _loc10_ = true;
               _loc11_ = false;
               break;
            case class_352.LASER:
            case class_352.ROCKET:
            case class_352.ECI:
            case class_352.SINGULARITY:
            case class_352.const_272:
            case class_352.const_455:
            default:
               _loc12_ = 0;
         }
         if(class_81.userID == _loc4_)
         {
            _loc12_ = 1;
         }
         if(_loc14_)
         {
            map.effects.method_269(new class_1819(_loc14_,_loc5_));
            if(_loc15_ = map.method_5806(_loc4_,class_308) as class_308)
            {
               _loc15_.hp.value = _loc6_;
               _loc15_.const_2381.value = _loc7_;
               _loc15_.shield.value = _loc8_;
            }
            if(false && _loc9_ != 0)
            {
               if(_loc5_ == class_352.const_272 || _loc5_ == class_352.const_455)
               {
                  if(_loc14_ is class_86)
                  {
                     _loc16_ = true;
                     if(_loc5_ == class_352.const_272)
                     {
                        _loc16_ = false;
                     }
                     else if(_loc5_ == class_352.const_455)
                     {
                        _loc16_ = true;
                     }
                     map.effects.method_269(new class_1818(_loc13_,_loc14_ as class_86,_loc16_));
                  }
               }
               map.effects.method_5084(new class_349(map.method_327(_loc4_),_loc9_,_loc12_,_loc10_,_loc11_));
            }
         }
         if(class_81.userID == _loc4_)
         {
            class_1340.method_3364();
         }
      }
   }
}
