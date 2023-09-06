package package_381
{
   import com.greensock.TweenLite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_10.class_305;
   import package_27.class_82;
   import package_29.class_85;
   import package_36.class_406;
   
   public class class_2217 extends class_2160
   {
      
      private static const const_48:String = "chasing_shot.zip";
       
      
      private var var_1231:class_85;
      
      private var _target:class_85;
      
      private var var_2437:class_305;
      
      public function class_2217(param1:class_1211, param2:class_406)
      {
         this.var_1231 = param2.attacker;
         this._target = param2.target;
         if(this.var_1231)
         {
            this.var_2437 = new class_305(this.var_1231.position.x,this.var_1231.position.y,this.var_1231.position.z);
         }
         else
         {
            this.var_2437 = new class_305(0,0,0);
         }
         super(param2,const_48,this.var_2437);
         if(this.var_1231 == null || this._target == null)
         {
            this.disposeView();
         }
      }
      
      override protected function method_1460() : void
      {
         super.method_1460();
         TweenLite.to(this.var_2437,1,{
            "dynamicProps":{
               "x":this.method_5139,
               "y":this.method_3079
            },
            "onComplete":this.disposeView
         });
         class_82.playSoundEffect(class_126.const_1325,false,false,this.var_1231.position.x,this.var_1231.position.y,true);
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenLite.killTweensOf(view);
         super.disposeView(param1);
      }
      
      private function method_5139() : Number
      {
         return this._target.position.x;
      }
      
      private function method_3079() : Number
      {
         return this._target.position.y;
      }
   }
}
