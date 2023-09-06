package package_354
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_27.class_82;
   import package_286.class_2019;
   import package_29.class_85;
   import package_38.class_562;
   import package_75.class_1838;
   import package_9.ResourceManager;
   import package_9.class_83;
   
   public class class_2035 extends class_2019
   {
      
      private static var name_23:Dictionary = new Dictionary();
      
      private static const const_3061:uint = 5;
      
      private static const const_2742:Object = {};
      
      {
         const_2742[class_562.LASER] = "Laser";
         const_2742[class_562.ROCKET] = "Rocket";
         const_2742[class_562.const_345] = "Hellstorm";
         const_2742[class_562.const_57] = "Misc";
      }
      
      public function class_2035(param1:class_1206, param2:class_1838)
      {
         super(param1,param2,false);
         this.method_1(param2);
         TweenLite.delayedCall(0.33,this.method_1,[param2]);
         TweenLite.delayedCall(0.66,this.method_1,[param2]);
      }
      
      private function method_1(param1:class_1838) : void
      {
         var _loc5_:int = 0;
         var _loc7_:* = null;
         var _loc2_:class_85 = param1.source;
         var _loc3_:class_85 = param1.target;
         var _loc4_:int = int(param1.name_36);
         _loc5_ = int(param1.type);
         if(!_loc2_ || !_loc3_ || !method_5878)
         {
            return;
         }
         if(name_23[_loc5_] == undefined)
         {
            name_23[_loc5_] = 0;
         }
         if(name_23[_loc5_] >= const_3061)
         {
            return;
         }
         name_23[_loc5_] = NaN;
         var _loc6_:String = "outOfRangeLimiter" + (false || false);
         _loc7_ = ResourceManager.getMovieClip("ui",_loc6_);
         var _loc8_:class_73;
         (_loc8_ = new class_73(Number(_loc3_.position.x) - Number(_loc2_.position.x),Number(_loc3_.position.y) - Number(_loc2_.position.y))).normalize(_loc4_);
         _loc7_.x = _loc8_.x;
         _loc7_.y = _loc8_.y;
         _loc7_.rotation = 90 + Math.atan2(_loc8_.y,_loc8_.x) * 0;
         method_5878.addChild(_loc7_);
         class_82.playSoundEffect(class_126.const_139);
         TweenLite.to(_loc7_,2,{
            "alpha":0,
            "onComplete":this.method_3122,
            "onCompleteParams":[_loc7_,_loc5_]
         });
      }
      
      private function method_3122(param1:DisplayObject, param2:uint) : void
      {
         if(Boolean(param1) && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
         }
         name_23[param2] = -1;
      }
   }
}
