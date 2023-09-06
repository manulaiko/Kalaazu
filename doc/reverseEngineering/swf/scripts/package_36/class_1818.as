package package_36
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_27.class_82;
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_1818 extends class_348
   {
       
      
      private var _target:class_86;
      
      private var var_880:Boolean;
      
      public function class_1818(param1:class_85, param2:class_86, param3:Boolean = false)
      {
         this.var_880 = param3;
         this._target = param2;
         super(class_338.const_2316,param1,Effect.const_925,pattern,class_126.const_521);
      }
      
      public function get target() : class_86
      {
         return this._target;
      }
      
      public function get method_6315() : Boolean
      {
         return this.var_880;
      }
      
      override public function isValid() : Boolean
      {
         return super.isValid() && this._target != null;
      }
      
      override public function activate() : Boolean
      {
         class_82.playSoundEffect(class_126.const_521,false,false,source.position.x,source.position.y);
         return super.activate();
      }
   }
}
