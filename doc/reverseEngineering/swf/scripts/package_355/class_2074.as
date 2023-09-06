package package_355
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_11.class_39;
   import package_27.class_82;
   import package_286.class_2019;
   import package_36.class_399;
   import package_76.class_215;
   import package_9.ResourceManager;
   
   public class class_2074 extends class_2019
   {
      
      private static const const_3129:int = 455;
       
      
      public function class_2074(param1:class_1206, param2:class_399)
      {
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         if(!ResourceManager.isLoaded("lensFlash"))
         {
            ResourceManager.loadAndCall("lensFlash",this.method_30,arguments);
            return;
         }
         if(!ResourceManager.isLoaded("shockwaves"))
         {
            ResourceManager.loadAndCall("shockwaves",this.method_30,arguments);
            return;
         }
         this.start();
      }
      
      override protected function start() : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("shockwaves"));
         _loc2_ = ResourceManager.getBitmap("lensFlash","lensFlash");
         _loc2_.x = -_loc2_.width * 0.5;
         _loc2_.y = -_loc2_.height * 0.5;
         addChild(_loc2_);
         TweenLite.to(_loc2_,0.25,{
            "alpha":0,
            "onComplete":this.removeFromParent,
            "onCompleteParams":[_loc2_]
         });
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this.method_2147.method_942)
         {
            _loc4_ = 1;
         }
         else if(this.method_2147.method_4989)
         {
            _loc4_ = 4;
         }
         else
         {
            _loc4_ = 5;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            TweenMax.delayedCall(!!this.method_2147.method_4989 ? _loc3_ * 0.3 : _loc3_,this.method_6397,[_loc1_,this,_loc5_,this.method_2147.method_942,this.method_2147.method_4989]);
            _loc3_ += 0.1;
            _loc5_++;
         }
         if(this.method_2147.method_942)
         {
            _loc6_ = MovieClip(_loc1_.getEmbeddedMovieClip("blitzUltimate"));
         }
         else
         {
            _loc6_ = MovieClip(_loc1_.getEmbeddedMovieClip("blitz"));
         }
         class_215.method_6420(_loc6_,15,true);
         _loc6_.scaleX = 0.1;
         _loc6_.scaleY = 0.1;
         addChild(_loc6_);
         if(this.method_2147.method_942)
         {
            TweenLite.to(_loc6_,1.5,{
               "scaleX":1.5,
               "scaleY":1.5,
               "onComplete":this.removeFromParent,
               "onCompleteParams":[_loc6_]
            });
         }
         else
         {
            TweenLite.to(_loc6_,1.5,{
               "scaleX":3.5,
               "scaleY":3.5,
               "onComplete":this.removeFromParent,
               "onCompleteParams":[_loc6_]
            });
         }
         TweenMax.delayedCall(0.75,this.method_4775,[_loc6_]);
         if(this.method_2147.method_942)
         {
            class_82.playSoundEffect(class_126.const_2529,false,false,x,y);
         }
         else
         {
            class_82.playSoundEffect(class_126.const_1932,false,false,x,y);
         }
      }
      
      private function removeFromParent(param1:DisplayObject) : void
      {
         TweenMax.killTweensOf(param1);
         class_215.removeDisplayObject(param1);
      }
      
      private function method_4775(param1:MovieClip) : void
      {
         TweenLite.to(param1,0.25,{
            "alpha":0,
            "onComplete":disposeView
         });
      }
      
      private function method_6397(param1:class_39, param2:Sprite, param3:int, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:* = null;
         if(!param4)
         {
            _loc6_ = MovieClip(param1.getEmbeddedMovieClip("shockring0"));
            if(param5 && param3 < 2)
            {
               _loc6_ = MovieClip(param1.getEmbeddedMovieClip("shockring0Red"));
            }
         }
         else
         {
            _loc6_ = MovieClip(param1.getEmbeddedMovieClip("shockringUltimate"));
         }
         var _loc7_:Number = const_3129 / (_loc6_.width / 2);
         _loc6_.scaleX = 0.1;
         _loc6_.scaleY = 0.1;
         if(param4)
         {
            _loc6_.alpha = 0.7;
         }
         else
         {
            _loc6_.alpha = 0.3;
         }
         param2.addChild(_loc6_);
         TweenLite.to(_loc6_,1.5,{
            "scaleX":(param5 ? 9 : _loc7_),
            "scaleY":(param5 ? 9 : _loc7_),
            "alpha":0,
            "onComplete":this.removeFromParent,
            "onCompleteParams":[_loc6_]
         });
      }
      
      private function get method_2147() : class_399
      {
         return effect as class_399;
      }
   }
}
