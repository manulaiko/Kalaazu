package package_183
{
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1590 extends Condition
   {
       
      
      public function class_1590()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc6_:int = 0;
         super.method_153(param1);
         var _loc2_:* = [];
         var _loc3_:Array = class_126.instance.var_1524;
         var _loc4_:Vector.<String>;
         var _loc5_:int = (_loc4_ = param1).length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = parseInt(_loc4_[_loc7_]);
            if(_loc3_[_loc6_] != null)
            {
               _loc2_.push(_loc3_[_loc6_]);
            }
            _loc7_++;
         }
         var _loc8_:String = _loc2_.join(" ,");
         _loc8_ = "\n" + _loc8_;
         _description = _description.replace(/%maps%/,_loc8_);
      }
   }
}
