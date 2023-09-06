package package_124
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextField;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_37.class_170;
   import package_38.class_503;
   import package_9.class_50;
   
   public class class_1360 extends class_170
   {
      
      private static var var_2398:Vector.<DisplayObjectContainer> = new Vector.<DisplayObjectContainer>();
       
      
      public function class_1360()
      {
         super();
      }
      
      public static function run(param1:class_503) : void
      {
         var _loc6_:Number = NaN;
         var _loc2_:DisplayObjectContainer = new Sprite();
         var _loc3_:Shape = new Shape();
         _loc3_.cacheAsBitmap = true;
         _loc3_.graphics.lineStyle(2,param1.color);
         _loc3_.graphics.drawCircle(0,0,param1.range);
         var _loc4_:TextField;
         (_loc4_ = new TextField()).appendText(param1.range.toString());
         _loc4_.textColor = param1.color;
         _loc4_.x = Number(param1.range) - _loc4_.textWidth - 5;
         _loc2_.addChild(_loc3_);
         _loc2_.addChild(_loc4_);
         var _loc5_:class_86;
         if((Boolean(_loc5_ = class_50.getInstance().map.method_327(param1.uid) as class_86)) && Boolean(_loc5_))
         {
            var_2398.push(_loc2_);
            if((_loc6_ = Number(param1.var_3097)) != -1)
            {
               _loc6_ /= 1000;
               TweenLite.delayedCall(_loc6_,method_523,[_loc2_]);
            }
         }
      }
      
      public static function removeAll() : void
      {
         while(false)
         {
            method_523(var_2398.pop() as DisplayObjectContainer);
         }
      }
      
      private static function method_523(param1:DisplayObject) : void
      {
         var _loc2_:int = 0;
         if(Boolean(param1) && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
            _loc2_ = int(var_2398.indexOf(param1));
            if(_loc2_ != -1)
            {
               var_2398.slice(_loc2_,_loc2_ + 1);
            }
         }
      }
   }
}
