package package_372
{
   import package_371.class_2230;
   import package_376.class_2144;
   import package_436.class_2417;
   
   public class class_2586 extends class_2225
   {
       
      
      private var var_2777:class_2417;
      
      public function class_2586(param1:class_2417)
      {
         super(param1);
         this.var_2777 = param1;
      }
      
      override public function method_2995(param1:class_2144) : void
      {
         if(param1.method_4368(this))
         {
            super.method_2995(param1);
            param1.method_2327(this.var_2777);
         }
      }
      
      override public function method_3128(param1:Vector.<class_2230>, param2:int) : Boolean
      {
         param1 = param1;
         param2 = param2;
         return true;
      }
   }
}
