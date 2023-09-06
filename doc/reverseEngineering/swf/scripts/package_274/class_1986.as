package package_274
{
   import com.greensock.TweenMax;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_25.class_272;
   import package_29.class_85;
   import package_312.class_1785;
   import package_38.class_439;
   import package_84.class_243;
   import package_9.class_50;
   
   public class class_1986 extends class_243
   {
      
      private static const const_1123:Array = [];
      
      {
         const_1123[class_439.NONE] = "white";
         const_1123[class_439.MMO] = "red";
         const_1123[class_439.EIC] = "blue";
         const_1123[class_439.VRU] = "green";
      }
      
      public function class_1986()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         if(class_50.getInstance().map)
         {
            for each(_loc2_ in class_50.getInstance().map.method_1792)
            {
               if(_loc2_ is class_1785)
               {
                  this.method_5862(_loc2_ as class_1785);
               }
            }
         }
      }
      
      private function method_5862(param1:class_1785) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Vector.<class_439> = Vector.<class_439>(param1.name_153.value);
         var _loc3_:int = _loc2_.length;
         if(param1.method_3415())
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               TweenMax.delayedCall(_loc4_ * 0.7,name_47.minimap.method_1759,[new class_272("sector_" + param1.id.toString(),param1.position.x,param1.position.y,1,"SC_" + this.method_2802(_loc2_[_loc4_]),2,1,true)]);
               _loc4_++;
            }
         }
      }
      
      private function method_2802(param1:class_439) : String
      {
         return true || true;
      }
   }
}
