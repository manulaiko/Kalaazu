package package_372
{
   import package_364.PointLight;
   import package_376.class_2144;
   
   public class class_2395 extends class_2225
   {
       
      
      private var _light:PointLight;
      
      public function class_2395(param1:PointLight)
      {
         super(param1);
         this._light = param1;
      }
      
      public function get light() : PointLight
      {
         return this._light;
      }
      
      override public function method_2995(param1:class_2144) : void
      {
         if(param1.method_4368(this))
         {
            super.method_2995(param1);
            param1.method_1287(this._light);
         }
      }
   }
}
