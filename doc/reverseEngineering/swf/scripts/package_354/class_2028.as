package package_354
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_27.class_82;
   import package_286.class_1734;
   import package_75.class_367;
   
   public class class_2028 extends class_1734
   {
       
      
      private var _view:class_1206;
      
      public function class_2028(param1:class_1206, param2:class_367)
      {
         super(param1,param2);
         this._view = param1;
      }
      
      private function get method_2366() : class_367
      {
         return effect as class_367;
      }
      
      override protected function method_30() : void
      {
         this.addChild(clip);
         this.start();
      }
      
      override protected function start() : void
      {
         this.clip.visible = true;
         this.method_2138();
         var _loc1_:Number = Number(MovieClip(this.clip).framesLoaded) / 20;
         TweenMax.to(this.clip,_loc1_,{
            "ease":Linear.easeNone,
            "frame":MovieClip(this.clip).framesLoaded,
            "onComplete":disposeView
         });
         class_82.playSoundEffect(class_126.const_592,false,false,x,y,true);
      }
      
      private function method_2138() : void
      {
         if(this._view != null)
         {
            this.x = this.method_2366.x;
            this.y = this.method_2366.y;
         }
         if(parent == null && this._view != null)
         {
            this._view.fxLayer.addChild(this);
         }
      }
   }
}
