package package_75
{
   import package_19.class_68;
   import package_19.class_70;
   import package_29.class_85;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_2488 extends class_348
   {
       
      
      private var var_1251:class_68;
      
      private var _scale:Number;
      
      public function class_2488(param1:class_85, param2:Number = 1)
      {
         this.var_1251 = new class_70(int);
         this._scale = param2;
         super(class_338.const_2445,param1,const_2311,null);
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
      
      public function get method_3617() : class_68
      {
         return this.var_1251;
      }
      
      public function method_330(param1:int) : void
      {
         this.method_3617.dispatch(param1);
      }
   }
}
