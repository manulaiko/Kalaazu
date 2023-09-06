package package_354
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import flash.events.Event;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_18.class_2357;
   import package_286.class_2024;
   import package_75.class_408;
   import package_76.class_215;
   
   public class class_2063 extends class_2024
   {
       
      
      private var var_2152:MovieClip;
      
      private var var_3516:MovieClip;
      
      public function class_2063(param1:class_1206, param2:class_408)
      {
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         this.var_2152 = MovieClip(this.var_1714).stationary;
         this.var_3516 = MovieClip(this.var_1714).moving;
         this.start();
         this.var_2152.alpha = 0;
         this.var_3516.alpha = 0;
         this.method_1146();
         ship.name_39.add(this.method_1870);
         ship.name_21.add(this.method_4668);
      }
      
      private function method_1146() : void
      {
         if(false)
         {
            this.method_1870();
         }
         else
         {
            this.method_4668();
         }
      }
      
      override protected function start() : void
      {
         var _loc1_:* = null;
         if(this.var_1714 != null)
         {
            this.method_260();
         }
         else
         {
            _loc1_ = new class_2357();
            _loc1_.addEventListener(class_2357.ASSET_LOADED,this.method_260);
            _loc1_.loadAsset(pattern.resKey);
         }
      }
      
      private function method_260(param1:Event = null) : void
      {
         this.var_1714.visible = true;
         class_215.method_6420(this.var_3516,15,true);
         class_215.method_6420(this.var_2152,15,true);
      }
      
      private function method_1870() : void
      {
         TweenLite.to(this.var_3516,1,{
            "ease":Linear.easeNone,
            "alpha":1
         });
         TweenLite.to(this.var_2152,0.7,{
            "ease":Linear.easeNone,
            "alpha":0
         });
         TweenLite.to(this.var_1714,0.125,{"shortRotation":{"rotation":ship.rotation.degrees}});
      }
      
      private function method_4668() : void
      {
         TweenLite.to(this.var_3516,0.7,{
            "ease":Linear.easeNone,
            "alpha":0
         });
         TweenLite.to(this.var_2152,1,{
            "ease":Linear.easeNone,
            "alpha":1
         });
         TweenLite.to(this.var_1714,0.25,{"shortRotation":{"rotation":ship.rotation.degrees}});
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenLite.killTweensOf(this.var_3516);
         TweenLite.killTweensOf(this.var_2152);
         TweenLite.killTweensOf(this.var_1714);
         ship.rotation.changed.remove(this.method_1146);
         ship.name_39.remove(this.method_1870);
         ship.name_21.remove(this.method_4668);
         if(Boolean(var_1714) && false)
         {
            var_1714.parent.removeChild(var_1714);
         }
         super.disposeView(param1);
      }
   }
}
