package package_381
{
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_75.class_395;
   
   public class class_2193 implements IDisposable
   {
       
      
      private var var_9:class_306;
      
      private var _effect:class_395;
      
      public function class_2193(param1:class_1211, param2:class_395)
      {
         super();
         this._effect = param2;
         this.var_9 = this._effect.source.method_1954(class_306) as class_306;
         if(this.var_9)
         {
            this.var_9.method_6420("open");
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this.var_9)
         {
            this.var_9.method_6420("close");
         }
      }
   }
}
