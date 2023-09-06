package package_448
{
   import net.bigpoint.darkorbit.fui.components.core.transitions.ITransitionEffect;
   
   public class class_2507
   {
      
      private static const const_1262:uint = 500;
       
      
      private var _resKey:String;
      
      private var _transitionEffect:ITransitionEffect;
      
      private var _duration:uint = 500;
      
      public function class_2507(param1:String, param2:ITransitionEffect, param3:uint = 500)
      {
         super();
         this._resKey = param1;
         this._transitionEffect = param2;
         this._duration = param3;
      }
      
      public function get resKey() : String
      {
         return this._resKey;
      }
      
      public function get transitionEffect() : ITransitionEffect
      {
         return this._transitionEffect;
      }
      
      public function get duration() : uint
      {
         return this._duration;
      }
   }
}
