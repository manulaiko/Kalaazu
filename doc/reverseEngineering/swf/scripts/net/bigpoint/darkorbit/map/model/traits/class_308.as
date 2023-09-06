package net.bigpoint.darkorbit.map.model.traits
{
   import package_10.class_20;
   import package_19.class_68;
   import package_19.class_70;
   import package_29.class_267;
   
   public class class_308 extends class_267
   {
       
      
      public const hp:class_20 = new class_20(0);
      
      public const const_3026:class_20 = new class_20(0);
      
      public const const_2381:class_20 = new class_20(0);
      
      public const const_805:class_20 = new class_20(0);
      
      public const shield:class_20 = new class_20(0);
      
      public const maxShield:class_20 = new class_20(0);
      
      private var var_31:class_68;
      
      public var var_1888:int = 0;
      
      public function class_308()
      {
         super();
      }
      
      public function get changed() : class_68
      {
         if(this.var_31 == null)
         {
            this.var_31 = new class_70();
            this.hp.changed.add(this.var_31.dispatch);
            this.const_3026.changed.add(this.var_31.dispatch);
            this.const_2381.changed.add(this.var_31.dispatch);
            this.const_805.changed.add(this.var_31.dispatch);
            this.shield.changed.add(this.var_31.dispatch);
            this.maxShield.changed.add(this.var_31.dispatch);
         }
         return this.var_31;
      }
   }
}
