package mx.effects.effectClasses
{
   import mx.core.mx_internal;
   import mx.effects.EffectTargetFilter;
   
   public class HideShowEffectTargetFilter extends EffectTargetFilter
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public var show:Boolean = true;
      
      public function HideShowEffectTargetFilter()
      {
         super();
         filterProperties = ["visible"];
      }
      
      override protected function defaultFilterFunction(param1:Array, param2:Object) : Boolean
      {
         var _loc5_:* = null;
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = param1[_loc4_]).target == param2)
            {
               return _loc5_.end["visible"] == this.show;
            }
            _loc4_++;
         }
         return false;
      }
   }
}
