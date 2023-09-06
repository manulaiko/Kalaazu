package package_213
{
   import package_189.class_1116;
   import package_37.ICommand;
   import package_37.class_170;
   import package_38.class_876;
   import package_85.class_244;
   
   public class class_1245 extends class_170
   {
       
      
      public function class_1245()
      {
         super();
      }
      
      public static function run(param1:ICommand) : void
      {
         var _loc2_:class_876 = param1 as class_876;
         var _loc3_:class_1116 = new class_1116();
         _loc3_.var_767 = _loc2_.var_767;
         _loc3_.complete = _loc2_.complete;
         var_271.method_2407(class_244.const_2065,_loc3_);
      }
   }
}
