package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1594 extends Condition
   {
       
      
      public function class_1594()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.method_153(param1);
         if(param1.length)
         {
            _loc2_ = int(param1[0]);
            _loc3_ = class_126.instance.method_2318[_loc2_];
            if(!_loc3_)
            {
               return;
            }
            _loc4_ = class_88.getItem(_loc3_);
            _description = _description.replace(/%TYPE%/,_loc4_);
         }
      }
   }
}
