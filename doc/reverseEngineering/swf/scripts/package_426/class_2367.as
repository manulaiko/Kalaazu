package package_426
{
   import com.greensock.TweenLite;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import package_289.class_2366;
   import package_359.class_2082;
   
   public class class_2367 implements class_2366
   {
       
      
      private var var_1643:class_308;
      
      private var var_127:class_2082;
      
      public function class_2367()
      {
         super();
      }
      
      public function method_1804(param1:class_306, param2:class_2082, param3:Object) : void
      {
         this.var_1643 = param1.owner.method_1954(class_308) as class_308;
         this.var_1643.changed.add(this.update);
         this.var_127 = param2;
         this.update();
      }
      
      private function update() : void
      {
         if(this.var_127.method_4434("glow"))
         {
            TweenLite.to(this.var_127.method_4434("glow"),0.25,{"alpha":Number(this.var_1643.hp.value) / Number(this.var_1643.const_3026.value)});
         }
      }
   }
}
