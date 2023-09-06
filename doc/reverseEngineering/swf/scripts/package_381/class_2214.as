package package_381
{
   import flash.media.SoundChannel;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_27.class_82;
   import package_75.class_1891;
   
   public class class_2214 extends class_2160
   {
      
      private static const const_48:String = "decloak.zip";
       
      
      private var var_385:SoundChannel = null;
      
      public function class_2214(param1:class_1211, param2:class_1891)
      {
         this.var_385 = class_82.playSoundEffect(class_126.const_2773,true,false,param2.source.position.x,param2.source.position.y);
         super(param2,const_48,param2.source.position);
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         super.disposeView(param1);
         if(this.var_385 != null)
         {
            class_82.method_401(this.var_385);
         }
      }
   }
}
