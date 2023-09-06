package package_443
{
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import package_27.class_82;
   import package_373.class_2134;
   import package_45.class_366;
   import package_9.class_50;
   
   public class class_2465 implements class_2461, IDisposable
   {
       
      
      private var var_176:class_306;
      
      private var var_195:class_366;
      
      private var var_127:class_2134;
      
      private var var_2845:uint;
      
      public function class_2465()
      {
         super();
      }
      
      public function initialize(param1:class_306, param2:class_2134, param3:Object) : void
      {
         this.var_176 = param1;
         this.var_127 = param2;
         this.var_195 = param1.owner as class_366;
      }
      
      public function decorate() : void
      {
         if(this.var_195)
         {
            this.var_195.const_381.add(this.method_2041);
         }
         if(class_50.getInstance().map.method_5762 > 10000)
         {
            class_82.playSoundEffect(class_126.const_2261,false,false,this.var_195.x,this.var_195.y);
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this.var_195)
         {
            this.var_195.const_381.remove(this.method_2041);
         }
         clearTimeout(this.var_2845);
      }
      
      private function method_2041(param1:Number = 0) : void
      {
         clearTimeout(this.var_2845);
         this.var_127.method_6420("jump");
         class_82.playSoundEffect(class_126.const_2212,false,false,this.var_195.x,this.var_195.y);
         if(param1 > 0)
         {
            this.var_2845 = setTimeout(this.var_127.method_5838,param1 * 1000);
         }
      }
   }
}
