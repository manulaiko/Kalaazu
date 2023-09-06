package package_381
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_10.class_305;
   import package_22.class_1079;
   import package_22.class_198;
   import package_27.class_82;
   import package_36.class_207;
   import package_9.class_50;
   
   public class class_2211 extends class_2160
   {
       
      
      private var _effect:class_207;
      
      private var var_2771:class_1079;
      
      public function class_2211(param1:class_1211, param2:class_207)
      {
         this._effect = param2;
         this.var_2771 = class_198.var_4854[param2.shockwaveId];
         super(param2,this.var_2771.resKey + ".zip",new class_305(param2.x,param2.y));
      }
      
      override protected function method_1460() : void
      {
         super.method_1460();
         class_82.playSoundEffect(class_126.const_2472,false,false,this._effect.x,this._effect.y);
         class_50.getInstance().method_370(16777215,0.75,0.25,2);
         if(this.var_2771.shakeScreen)
         {
            class_50.getInstance().shakeScreen();
         }
      }
   }
}
