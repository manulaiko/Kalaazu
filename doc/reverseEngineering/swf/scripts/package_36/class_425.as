package package_36
{
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_338;
   
   public class class_425 extends Effect
   {
       
      
      private var var_1231:class_85;
      
      private var _target:class_85;
      
      private var var_4086:int;
      
      private var var_3424:int;
      
      private var var_2493:Boolean;
      
      public function class_425(param1:class_85, param2:class_85, param3:int, param4:int = 20, param5:Boolean = false)
      {
         super(class_338.const_3080,const_925);
         this.var_1231 = param1;
         this._target = param2;
         this.var_4086 = param3;
         this.var_3424 = param4;
         this.var_2493 = param5;
      }
      
      public function get attacker() : class_85
      {
         return this.var_1231;
      }
      
      public function get target() : class_85
      {
         return this._target;
      }
      
      public function get name_106() : int
      {
         return this.var_4086;
      }
      
      public function get method_2523() : int
      {
         return this.var_3424;
      }
      
      public function get method_1885() : Boolean
      {
         return this.var_2493;
      }
      
      override public function isValid() : Boolean
      {
         return super.isValid() && this.var_1231 != null && this._target != null;
      }
   }
}
