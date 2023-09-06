package package_124
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.gui.vo.class_186;
   import package_37.class_170;
   import package_38.class_441;
   import package_38.class_502;
   import package_38.class_781;
   
   public class class_1357 extends class_170
   {
       
      
      public function class_1357()
      {
         super();
      }
      
      public static function run(param1:class_502) : void
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<class_186> = new Vector.<class_186>();
         var _loc3_:class_126 = class_126.getInstance();
         for each(_loc4_ in param1.var_1802)
         {
            method_3097(_loc4_.var_2427.var_2008,_loc4_.var_1197,_loc4_.value,_loc2_,_loc3_);
         }
         var_574.method_4489().method_4102(_loc2_);
      }
      
      private static function method_3097(param1:int, param2:Vector.<class_441>, param3:int, param4:Vector.<class_186>, param5:class_126) : void
      {
         var _loc8_:* = null;
         var _loc9_:Boolean = false;
         var _loc6_:int = int(param5.var_3905[param1]);
         var _loc7_:int = param4.length;
         var _loc10_:int = 0;
         while(_loc10_ < _loc7_)
         {
            if(!_loc9_)
            {
               if(param4[_loc10_].var_2303 == _loc6_)
               {
                  _loc8_ = param4[_loc10_];
                  _loc9_ = true;
               }
            }
            _loc10_++;
         }
         var _loc11_:String = createToolTip(param2,param5);
         if(_loc8_)
         {
            _loc8_.var_561 += param3;
            _loc8_.tooltip += _loc11_;
         }
         else
         {
            (_loc8_ = new class_186()).var_2303 = _loc6_;
            _loc8_.var_561 = param3;
            _loc8_.tooltip = _loc11_;
            param4.push(_loc8_);
         }
      }
      
      private static function createToolTip(param1:Vector.<class_441>, param2:class_126) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         for each(_loc4_ in param1)
         {
            if(_loc3_)
            {
               _loc3_ += ", " + param2.var_1638[param2.var_3377[_loc4_.var_2008]];
            }
            else
            {
               _loc3_ = param2.var_1638[param2.var_3377[_loc4_.var_2008]];
            }
         }
         if(!_loc3_)
         {
            _loc3_ = "";
         }
         return _loc3_;
      }
   }
}
