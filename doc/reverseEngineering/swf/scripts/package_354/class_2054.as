package package_354
{
   import com.greensock.TweenMax;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_286.class_2019;
   import package_75.class_1893;
   
   public class class_2054 extends class_2019
   {
       
      
      public function class_2054(param1:class_1206, param2:class_1893)
      {
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         this.method_4023();
         method_6420();
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenMax.killTweensOf(this.method_4023);
         TweenMax.killTweensOf(this.method_2304);
         super.disposeView(param1);
      }
      
      private function method_2304() : void
      {
         TweenMax.to(var_1714,1,{"alpha":0});
         TweenMax.delayedCall(7,this.method_4023);
      }
      
      private function method_4023() : void
      {
         TweenMax.to(var_1714,1,{"alpha":1});
         TweenMax.delayedCall(2,this.method_2304);
      }
   }
}
