package package_354
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_181.class_1104;
   import package_27.class_82;
   import package_286.class_1734;
   import package_35.Effect;
   import package_75.class_1489;
   import package_9.ResourceManager;
   
   public class class_2040 extends class_1734
   {
       
      
      public function class_2040(param1:class_1206, param2:Effect, param3:Boolean = true)
      {
         super(param1,param2,param3);
      }
      
      override protected function method_30() : void
      {
         var _loc1_:class_1489 = effect as class_1489;
         this.method_1656(method_3528.fxLayer,_loc1_.patterns.concat(),_loc1_.x,_loc1_.y);
      }
      
      private function method_1656(param1:Sprite, param2:Vector.<String>, param3:int, param4:int) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         if(param2.length > 0)
         {
            _loc6_ = param2[0];
            if(!ResourceManager.isLoaded(_loc6_))
            {
               ResourceManager.loadAndCall(_loc6_,this.method_1656,arguments);
               return;
            }
            _loc7_ = param2.shift();
            _loc9_ = int(((_loc8_ = new class_1104(ResourceManager.getMovieClip(_loc7_,"mc"),_loc7_)) as class_1104).framesLoaded);
            _loc8_.x = param3;
            _loc8_.y = param4;
            param1.addChild(_loc8_);
            _loc10_ = _loc9_ / 30;
            TweenLite.to(_loc8_,_loc10_,{
               "ease":Linear.easeNone,
               "frame":_loc9_,
               "onComplete":this.method_695,
               "onCompleteParams":[_loc8_,param2,param3,param4]
            });
            class_82.playSoundEffect(class_126.const_1374);
         }
      }
      
      private function method_695(param1:DisplayObject, param2:Vector.<String>, param3:int, param4:int) : void
      {
         var _loc5_:Sprite;
         (_loc5_ = param1.parent as Sprite).removeChild(param1);
         this.method_1656(_loc5_,param2,param3,param4);
      }
   }
}
