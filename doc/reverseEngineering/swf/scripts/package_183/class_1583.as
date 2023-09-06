package package_183
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_1583 extends Condition
   {
       
      
      private var var_1447:int;
      
      private var var_4167:int;
      
      private var var_1851:int;
      
      private var var_1624:int;
      
      private var var_2745:int;
      
      public function class_1583()
      {
         super();
      }
      
      override protected function method_153(param1:Vector.<String>) : void
      {
         var _loc2_:Vector.<String> = param1;
         var _loc3_:class_126 = class_126.instance;
         this.var_1447 = parseInt(_loc2_.shift());
         this.var_4167 = parseInt(_loc2_.shift());
         this.var_1851 = parseInt(_loc2_.shift());
         this.var_1624 = parseInt(_loc2_.shift());
         this.var_2745 = parseInt(_loc2_.shift());
         var _loc4_:* = "q2_condition_undefined";
         if(this.var_2745 == 0)
         {
            _loc4_ += "_any";
         }
         else
         {
            _loc4_ += "_spec";
         }
         if(this.var_1851 == 0 && this.var_4167 == 0 && this.var_1447 == 0)
         {
            _loc4_ += "_any";
         }
         else
         {
            if(this.var_1851 > 0)
            {
               _loc4_ += "_npc";
            }
            if(this.var_4167 > 0)
            {
               _loc4_ += "_ship";
            }
            if(this.var_1447 > 0)
            {
               _loc4_ += "_faction";
            }
         }
         if(_target == 0)
         {
            _loc4_ += "_challenge";
         }
         else
         {
            var_106 = "/" + _target;
         }
         _description = class_88.getItem(_loc4_);
         var _loc5_:uint = uint(class_126.instance.method_3780[this.var_2745]);
         _description = description.replace(/%ore%/,class_126.instance.method_6484[_loc5_]);
         _description = description.replace(/%npc%/,class_126.instance.method_1789[this.var_1851]);
         _description = description.replace(/%ship%/,class_126.instance.method_1221[this.var_4167]);
         _description = description.replace(/%faction%/,class_126.instance.method_2919[this.var_1447]);
      }
      
      override public function get method_1303() : String
      {
         return String(_current);
      }
   }
}
