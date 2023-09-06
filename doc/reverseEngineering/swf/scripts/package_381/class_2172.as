package package_381
{
   import flash.media.SoundChannel;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_27.class_82;
   import package_75.class_1866;
   
   public class class_2172 extends class_2160
   {
      
      private static const const_48:String = "protection.zip";
       
      
      private var var_385:SoundChannel = null;
      
      private var _effect:class_1866;
      
      public function class_2172(param1:class_1211, param2:class_1866)
      {
         this._effect = param2;
         super(param2,const_48,param2.source.position);
      }
      
      override protected function method_1460() : void
      {
         this.var_385 = class_82.playSoundEffect(class_126.const_2773,false,false,this._effect.source.position.x,this._effect.source.position.y);
         super.method_1460();
      }
      
      override protected function method_2298() : void
      {
         if(this.var_385 != null)
         {
            class_82.method_401(this.var_385);
         }
         super.method_2298();
      }
   }
}
