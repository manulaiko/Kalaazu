package net.bigpoint.darkorbit.fui.system.utils
{
   import flash.display.DisplayObjectContainer;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   
   public class FuiComponentSelectorUtil
   {
       
      
      public function FuiComponentSelectorUtil()
      {
         super();
      }
      
      public static function selectComponent(param1:String, param2:DisplayObjectContainer) : Coreponent
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:Array = param1.split(".");
         _loc3_ = param2.getChildByName(_loc4_.shift()) as Coreponent;
         for each(_loc5_ in _loc4_)
         {
            if(!_loc3_)
            {
               break;
            }
            _loc3_ = _loc3_.getChildByName(_loc5_) as Coreponent;
         }
         return _loc3_;
      }
   }
}
