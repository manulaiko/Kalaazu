package package_354
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_14.class_52;
   import package_286.class_2024;
   import package_35.class_348;
   import package_36.class_399;
   import package_9.class_50;
   
   public class class_2039 extends class_2024 implements class_52
   {
       
      
      private var _mapView:class_1206;
      
      public function class_2039(param1:class_1206, param2:class_348)
      {
         this._mapView = param1;
         super(param1,param2);
      }
      
      override protected function get method_3013() : String
      {
         return "blitzUltimate";
      }
      
      override protected function method_30() : void
      {
         this.addChild(var_1714);
         this.scaleX = 0.3;
         this.scaleY = 0.3;
         TweenLite.to(this,1.8,{
            "scaleX":1,
            "scaleY":1
         });
         TweenLite.delayedCall(1.8,this.method_1049);
         class_50.method_5621(this);
      }
      
      private function method_1049() : void
      {
         if(class_50.getInstance().map)
         {
            class_50.getInstance().map.effects.method_269(new class_399(ship,false,true));
         }
         this.disposeView();
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenMax.killDelayedCallsTo(this.method_1049);
         class_50.removeObserver(this);
         super.disposeView(param1);
      }
      
      public function updateTimer(param1:Number) : void
      {
         if(ship)
         {
            ship.rotation.degrees += 15;
         }
      }
   }
}
