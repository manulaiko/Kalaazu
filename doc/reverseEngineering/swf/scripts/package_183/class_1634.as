package package_183
{
   import com.bigpoint.utils.class_122;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1634 extends Condition
   {
       
      
      public function class_1634()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc14_:* = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc2_:* = "q2_condition_undefined";
         _loc3_ = class_126.getInstance();
         var _loc4_:Vector.<String> = param1;
         _loc5_ = int(_loc4_.shift());
         var _loc6_:int = int(_loc4_.shift());
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Vector.<int> = new Vector.<int>();
         var _loc10_:Vector.<int> = new Vector.<int>();
         while(_loc4_.length >= 2)
         {
            _loc17_ = int(_loc4_.shift());
            switch(_loc17_)
            {
               case 1:
                  _loc7_ += 1;
                  _loc9_.push(int(_loc4_.shift()));
                  break;
               case 2:
                  _loc8_ += 1;
                  _loc10_.push(int(_loc4_.shift()));
                  break;
            }
         }
         _loc11_ = "";
         if(_loc5_ > 0)
         {
            _loc11_ = _loc3_.method_1221[_loc5_];
            _loc2_ += "_ship";
         }
         else
         {
            _loc2_ += "_anyship";
         }
         _loc12_ = "";
         if(_loc6_ > 0)
         {
            _loc12_ = _loc3_.method_2919[_loc6_];
            _loc2_ += "_faction";
         }
         else
         {
            _loc2_ += "_anyfaction";
         }
         var _loc13_:* = [];
         _loc14_ = "";
         if(_loc7_ > 0)
         {
            _loc2_ += "_laser";
            for each(_loc18_ in _loc9_)
            {
               _loc13_.push(_loc3_.var_680[_loc18_]);
            }
            _loc14_ = _loc13_.join(", ");
         }
         var _loc15_:* = [];
         var _loc16_:String = "";
         if(_loc8_ > 0)
         {
            _loc2_ += "_rocket";
            for each(_loc19_ in _loc10_)
            {
               _loc15_.push(_loc3_.var_2195[_loc19_]);
            }
            _loc16_ = _loc15_.join(", ");
         }
         var_106 = "/" + class_122.round(_target);
         _description = class_88.getItem(_loc2_);
         _description = _description.replace(/%ship%/,_loc11_);
         _description = _description.replace(/%faction%/,_loc12_);
         _description = _description.replace(/%laser%/,_loc14_);
         _description = _description.replace(/%rocket%/,_loc16_);
         if(_loc5_ > 0)
         {
            var_3277 = method_6395(_loc3_.method_758[_loc5_] + "_icon.png");
         }
      }
      
      override public function get method_1303() : String
      {
         return String(_current);
      }
   }
}
