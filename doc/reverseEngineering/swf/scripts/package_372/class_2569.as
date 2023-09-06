package package_372
{
   import package_364.class_2390;
   import package_376.class_2144;
   
   public class class_2569 extends class_2225
   {
       
      
      private var _light:class_2390;
      
      public function class_2569(param1:class_2390)
      {
         super(param1);
         this._light = param1;
      }
      
      public function get light() : class_2390
      {
         return this._light;
      }
      
      override public function method_2995(param1:class_2144) : void
      {
         if(param1.method_4368(this))
         {
            super.method_2995(param1);
            param1.method_2774(this._light);
         }
      }
   }
}
