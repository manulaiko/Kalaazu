package package_36
{
   import package_22.class_222;
   import package_22.class_339;
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_338;
   
   public class class_184 extends Effect
   {
       
      
      private var _target:class_85;
      
      private var _z:int;
      
      private var _x:int;
      
      private var _y:int;
      
      private var var_2302:class_222;
      
      public function class_184(param1:int, param2:int, param3:int, param4:class_222, param5:class_85 = null)
      {
         super(class_338.const_2456,const_925,!!param4 ? new class_339(class_338.const_2456,param4.resKey,50) : null);
         this._x = param1;
         this._y = param2;
         this._z = param3;
         this.var_2302 = param4;
         this._target = param5;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function get name_25() : class_222
      {
         return this.var_2302;
      }
      
      override public function get method_5314() : Boolean
      {
         return true;
      }
      
      public function get target() : class_85
      {
         return this._target;
      }
      
      public function get z() : int
      {
         return this._z;
      }
   }
}
