package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
   
   public class class_1600 extends Condition
   {
      
      private static const const_708:int = 3;
       
      
      public function class_1600()
      {
         super();
      }
      
      override public function get method_1303() : String
      {
         if(_target > 0)
         {
            return String(_current);
         }
         return "";
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean, param6:Boolean, param7:Vector.<String>) : void
      {
         super.init(param1,param2,param3,param4,param5,param6,param7);
         var_1427 = ParserUtility.parseBooleanFromInt(int(param7[0]));
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         _loc2_ = class_88.getItem(param1[1]);
         var _loc3_:int = int(param1[2]) + const_708;
         var _loc4_:int = int(const_708);
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1[_loc4_];
            _loc6_ = param1[_loc4_ + 1];
            _loc2_ = _loc2_.replace(_loc5_,_loc6_);
            _loc4_ += 2;
         }
         if(_target > 0)
         {
            var_106 = "/" + _target.toString();
         }
         else
         {
            var_106 = "";
         }
         _description = _loc2_;
         super.method_153(param1);
      }
   }
}
