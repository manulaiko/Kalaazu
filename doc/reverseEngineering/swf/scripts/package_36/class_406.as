package package_36
{
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_338;
   
   public class class_406 extends Effect
   {
       
      
      private var var_1231:class_85;
      
      private var _target:class_85;
      
      private var var_1724:String;
      
      public function class_406(param1:class_85, param2:class_85, param3:String)
      {
         super(class_338.const_1444,const_925);
         this.var_1231 = param1;
         this._target = param2;
         this.var_1724 = param3;
      }
      
      public function get attacker() : class_85
      {
         return this.var_1231;
      }
      
      public function get target() : class_85
      {
         return this._target;
      }
      
      public function get method_1509() : String
      {
         return this.var_1724;
      }
      
      override public function isValid() : Boolean
      {
         return super.isValid() && this.var_1231 != null && this._target != null;
      }
   }
}
