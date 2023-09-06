package package_36
{
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_338;
   
   public class class_1835 extends Effect
   {
       
      
      public var attacker:class_85 = null;
      
      public var target:class_85 = null;
      
      public var var_3196:int = 0;
      
      public var var_1286:Boolean = false;
      
      public var var_2935:Boolean = false;
      
      public var debug:Boolean = false;
      
      public function class_1835(param1:class_85 = null, param2:class_85 = null, param3:int = 0, param4:Boolean = false, param5:Boolean = false)
      {
         super(class_338.LASER,const_925);
         this.attacker = param1;
         this.target = param2;
         this.var_3196 = param3;
         this.var_1286 = param4;
         this.var_2935 = param5;
      }
      
      override public function isValid() : Boolean
      {
         return super.isValid() && this.attacker != null && this.target != null && this.attacker.method_1954(class_299) != null;
      }
      
      override public function activate() : Boolean
      {
         var _loc1_:class_299 = this.attacker.method_1954(class_299) as class_299;
         if(_loc1_)
         {
            _loc1_.laser.fire.dispatch();
         }
         return super.activate();
      }
   }
}
