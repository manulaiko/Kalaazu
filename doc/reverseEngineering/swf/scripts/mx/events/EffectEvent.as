package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   import mx.effects.IEffectInstance;
   
   public class EffectEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const EFFECT_END:String = "effectEnd";
      
      public static const EFFECT_STOP:String = "effectStop";
      
      public static const EFFECT_START:String = "effectStart";
      
      public static const EFFECT_REPEAT:String = "effectRepeat";
      
      public static const EFFECT_UPDATE:String = "effectUpdate";
       
      
      public var effectInstance:IEffectInstance;
      
      public function EffectEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:IEffectInstance = null)
      {
         super(param1,param2,param3);
         this.effectInstance = param4;
      }
      
      override public function clone() : Event
      {
         return new EffectEvent(type,bubbles,cancelable,this.effectInstance);
      }
   }
}
