package package_124
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.net.class_1486;
   import net.bigpoint.darkorbit.net.class_74;
   import net.bigpoint.darkorbit.net.class_97;
   import package_37.class_170;
   import package_38.class_603;
   import package_38.class_695;
   
   public class class_1306 extends class_170
   {
       
      
      public function class_1306()
      {
         super();
      }
      
      public static function run(param1:class_695) : void
      {
         class_97.getInstance().method_5080(["0",class_74.const_2873,class_74.const_3191,class_74.const_75,param1.name_128,param1.var_3280,param1.var_15,1,"_red"]);
         var _loc2_:Vector.<int> = new Vector.<int>();
         _loc2_.push(param1.name_150);
         class_1486.getInstance().method_1485(new class_603(class_126.const_3217,param1.name_128,_loc2_));
      }
   }
}
