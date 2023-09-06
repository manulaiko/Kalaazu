package package_354
{
   import com.greensock.TweenLite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_27.class_82;
   import package_286.class_2019;
   import package_35.class_348;
   
   public class class_2073 extends class_2019
   {
       
      
      public function class_2073(param1:class_1206, param2:class_348)
      {
         super(param1,param2,true,true,true);
         this.fps = 15;
      }
      
      override protected function method_30() : void
      {
         this.method_6420();
         class_82.playSoundEffect(class_126.const_2157);
         var_1714.alpha = 0;
         TweenLite.to(var_1714,0.25,{
            "alpha":1,
            "onComplete":this.method_1670
         });
      }
      
      private function method_1670() : void
      {
         TweenLite.to(var_1714,0.25,{
            "delay":1,
            "alpha":0,
            "onComplete":this.disposeView
         });
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenLite.killTweensOf(var_1714);
         super.disposeView(param1);
      }
   }
}
