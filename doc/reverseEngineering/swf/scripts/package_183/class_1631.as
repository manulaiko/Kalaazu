package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_1631 extends Condition
   {
       
      
      public function class_1631()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:String = param1.length > 0 ? param1[0] : "noMatches";
         var _loc3_:String = class_88.getItem("q2_condition_undefined_" + _loc2_);
         _description = _loc3_.replace(/%amount%/,_target);
      }
   }
}
