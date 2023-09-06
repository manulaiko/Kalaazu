package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_1585 extends Condition
   {
       
      
      public function class_1585()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:* = null;
         if(Boolean(param1) && Boolean(param1.length))
         {
            _loc2_ = "q2_condition_" + definition.method_1895.replace("_TO_LEVEL","") + "_" + param1[0];
            _description = _description.replace(/%TYPE%/,class_88.getItem(_loc2_)).replace(/%COUNT%/,this._target);
         }
      }
   }
}
