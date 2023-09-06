package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1620 extends Condition
   {
       
      
      private var var_361:int;
      
      private var var_1595:String = "";
      
      public function class_1620()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Vector.<String> = param1;
         this.var_361 = parseInt(_loc2_.shift());
         var _loc3_:Array = class_126.instance.method_1789;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_ = parseInt(_loc2_[_loc5_]);
            if(_loc3_[_loc4_] != null)
            {
               this.var_1595 += ", " + _loc3_[_loc4_];
            }
            _loc5_++;
         }
         this.var_1595 = this.var_1595.substring(2);
         var _loc6_:* = "q2_condition_undefined";
         if(_target == 0)
         {
            _loc6_ += "_none";
         }
         else
         {
            var_106 = "/" + _target;
         }
         if(name_62)
         {
            _loc6_ += "_challenge";
         }
         _description = class_88.getItem(_loc6_);
         _description = description.replace(/%npcs%/,this.var_1595);
         _description = description.replace(/%count%/,_target);
         if(this.var_361 > 0)
         {
            var_3277 = method_6395(class_126.instance.method_3582[_loc4_] + "_icon.png");
         }
      }
      
      override public function get method_1303() : String
      {
         if(_target == 0)
         {
            return "";
         }
         return String(_current);
      }
   }
}
