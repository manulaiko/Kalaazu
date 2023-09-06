package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import package_38.class_117;
   
   public class class_1628 extends Condition
   {
      
      private static var var_2298:String = "PUT_ITEM_IN_ANY_SLOT_BAR";
       
      
      public function class_1628()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super.method_153(param1);
         if(param1.length > 2)
         {
            _loc2_ = class_88.getItem(param1[0]);
            _loc3_ = parseInt(param1[1]);
            _loc4_ = TextUtils.getTranslationByType(param1[2],class_117.const_1296);
            _description = _description.replace(/%SLOT%/,_loc3_).replace(/%BAR%/,_loc2_).replace(/%ITEM%/,_loc4_);
         }
         else if(param1.length > 1 && param1.length <= 2)
         {
            _loc5_ = class_88.getItem(param1[0]);
            _loc6_ = TextUtils.getTranslationByType(param1[1],class_117.const_1296);
            _description = class_88.getItem("q2_condition_" + var_2298);
            _description = _description.replace(/%BAR%/,_loc5_).replace(/%ITEM%/,_loc6_);
         }
      }
   }
}
