package package_101
{
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_100.class_270;
   import package_27.class_82;
   import package_9.ResourceManager;
   
   public class class_271 extends class_270
   {
       
      
      public var destinationMarkerVisible:Boolean = true;
      
      private var var_2564:Bitmap;
      
      private var var_1117:Shape;
      
      private var var_3524:MovieClip = null;
      
      private var var_968:Number;
      
      public function class_271()
      {
         this.var_2564 = ResourceManager.getBitmap("minimap","mapIcon_finish");
         super(new Sprite(),false,false,1);
      }
      
      override protected function update() : void
      {
         var triangleSize:int = 0;
         super.update();
         this.shape.graphics.clear();
         if(Boolean(this.destinationMarkerVisible) && this.hero.destination != null)
         {
            this.var_2564.x = Number(this.hero.destination.x) * Number(_scale) - Number(this.var_2564.width) / 2;
            this.var_2564.y = Number(this.hero.destination.y) * Number(_scale) - Number(this.var_2564.height) / 2;
            this.shape.addChild(this.var_2564);
            this.shape.graphics.lineStyle(1,6649302,1,true);
            this.shape.graphics.moveTo(Number(this.hero.position.x) * Number(_scale),Number(this.hero.position.y) * Number(_scale));
            this.shape.graphics.lineTo(Number(this.hero.destination.x) * Number(_scale),Number(this.hero.destination.y) * Number(_scale));
         }
         else if(this.var_2564.parent)
         {
            this.var_2564.parent.removeChild(this.var_2564);
         }
         with(this.shape.graphics)
         {
            lineStyle(0.5,15658734,0.3515625);
            moveTo(Number(hero.position.x) * Number(_scale) - 1000,Number(hero.position.y) * Number(_scale));
            lineTo(Number(hero.position.x) * Number(_scale) + 1000,Number(hero.position.y) * Number(_scale));
            moveTo(Number(hero.position.x) * Number(_scale),Number(hero.position.y) * Number(_scale) - 1000);
            lineTo(Number(hero.position.x) * Number(_scale),Number(hero.position.y) * Number(_scale) + 1000);
         }
         if(!this.var_1117)
         {
            this.var_1117 = new Shape();
            triangleSize = 11;
            this.var_1117.graphics.beginFill(16777215,1);
            this.var_1117.graphics.moveTo(0,0.5 * triangleSize);
            this.var_1117.graphics.lineTo(0.25 * triangleSize,-0.5 * triangleSize);
            this.var_1117.graphics.lineTo(-0.25 * triangleSize,-0.5 * triangleSize);
            this.var_1117.graphics.lineTo(0,0.5 * triangleSize);
            this.var_1117.graphics.endFill();
            this.shape.addChild(this.var_1117);
         }
         this.var_1117.x = Number(this.hero.position.x) * Number(_scale);
         this.var_1117.y = Number(this.hero.position.y) * Number(_scale);
         this.var_1117.visible = false;
         if(Number(owner.position.x) * Number(_scale) < 0.5 * Number(this.var_1117.width))
         {
            this.var_1117.x = 0.5 * Number(this.var_1117.width);
            this.var_1117.rotation = 90;
            this.var_1117.visible = true;
         }
         if(Number(owner.position.x) * Number(_scale) > Number(var_3334) - 0.5 * Number(this.var_1117.width))
         {
            this.var_1117.x = Number(var_3334) - 0.5 * Number(this.var_1117.width);
            this.var_1117.rotation = 270;
            this.var_1117.visible = true;
         }
         if(Number(owner.position.y) * Number(_scale) < 0.5 * Number(this.var_1117.height))
         {
            this.var_1117.y = 0.5 * Number(this.var_1117.height);
            this.var_1117.rotation = 180;
            this.var_1117.visible = true;
         }
         if(Number(owner.position.y) * Number(_scale) > Number(var_3540) - 0.5 * Number(this.var_1117.height))
         {
            this.var_1117.y = Number(var_3540) - 0.5 * Number(this.var_1117.height);
            this.var_1117.rotation = 0;
            this.var_1117.visible = true;
         }
         this.method_2521();
      }
      
      private function get hero() : class_86
      {
         return owner as class_86;
      }
      
      private function get shape() : Sprite
      {
         return _icon as Sprite;
      }
      
      public function method_813(param1:Boolean = false) : void
      {
         if(this.var_3524 == null)
         {
            this.var_3524 = ResourceManager.getMovieClip("minimap","doubleMinimapReveal");
            this.var_968 = this.var_3524.width;
         }
         this.shape.addChild(this.var_3524);
         this.method_2521();
         this.var_3524.alpha = 0;
         TweenLite.to(this.var_3524,param1 ? 0 : 1,{"alpha":0.3});
         class_82.playSoundEffect(class_126.const_1312,false,false,this.hero.x,this.hero.y);
      }
      
      private function method_2521() : void
      {
         if(Boolean(this.var_3524) && Boolean(this.var_3524.parent))
         {
            TweenLite.killTweensOf(this.var_3524);
            this.var_3524.alpha = 0.3;
            this.var_3524.x = Number(this.hero.x) * Number(_scale);
            this.var_3524.y = Number(this.hero.y) * Number(_scale);
            var _loc1_:* = Number(_scale) * 1700 / (0.5 * Number(this.var_968)) * 2;
            this.var_3524.scaleY = Number(_scale) * 1700 / (0.5 * Number(this.var_968)) * 2;
            this.var_3524.scaleX = _loc1_;
         }
      }
      
      public function method_6432() : void
      {
         if(this.var_3524 != null)
         {
            TweenLite.to(this.var_3524,1,{
               "alpha":0,
               "scaleX":0,
               "scaleY":0,
               "onComplete":this.var_3524.parent.removeChild,
               "onCompleteParams":[this.var_3524]
            });
            this.var_3524 = null;
         }
      }
   }
}
