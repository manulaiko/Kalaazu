package package_433
{
   import package_199.class_2123;
   import package_293.class_1751;
   import package_374.AbstractMethodError;
   
   public class class_2411
   {
       
      
      public function class_2411()
      {
         super();
      }
      
      public function method_5147(param1:class_1751, param2:class_1751, param3:Object, param4:String) : void
      {
         throw new AbstractMethodError();
      }
      
      public function create() : class_2411
      {
         throw new AbstractMethodError();
      }
      
      protected function method_3186(param1:String, param2:String, param3:class_1751, param4:class_1751, param5:Object, param6:String) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         _loc8_ = param6 == class_2582.const_582 ? param4 : param3;
         _loc7_ = (_loc9_ = param6 == class_2582.const_582 ? param3 : param4).name;
         param5[_loc8_.name] = _loc8_;
         param5[param2] = _loc9_;
         _loc9_.method_4647(param2,param1,false);
         _loc9_.dispatchEvent(new class_2123(class_2123.const_147,_loc9_,_loc7_));
      }
   }
}
