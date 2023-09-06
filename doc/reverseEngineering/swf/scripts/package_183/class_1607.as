package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import package_38.class_117;
   
   public class class_1607 extends Condition
   {
       
      
      public function class_1607()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.method_153(param1);
         if(param1.length > 1)
         {
            _loc2_ = param1[0];
            _loc3_ = "";
            switch(_loc2_)
            {
               case "LASER":
                  _loc3_ = class_88.getItem("lab_laser");
                  break;
               case "ROCKET":
                  _loc3_ = class_88.getItem("lab_raketen");
                  break;
               case "SPEED":
                  _loc3_ = class_88.getItem("lab_antrieb");
                  break;
               case "SHIELD":
                  _loc3_ = class_88.getItem("lab_schild");
            }
            _loc4_ = TextUtils.getTranslationByType("resource_ore_" + param1[1].toLowerCase(),class_117.const_1296);
            _description = _description.replace(/%TARGET%/,_loc3_).replace(/%TYPE%/,_loc4_);
            if(_target > 1)
            {
               var_106 = "/" + _target;
            }
         }
      }
      
      override public function get method_1303() : String
      {
         if(_target > 1)
         {
            return current.toString();
         }
         return super.method_1303;
      }
   }
}
