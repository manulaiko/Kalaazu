package mx.effects
{
   import flash.events.Event;
   import mx.effects.effectClasses.PropertyChanges;
   
   public interface IEffectInstance
   {
       
      
      function get className() : String;
      
      function get duration() : Number;
      
      function set duration(param1:Number) : void;
      
      function get effect() : IEffect;
      
      function set effect(param1:IEffect) : void;
      
      function get effectTargetHost() : IEffectTargetHost;
      
      function set effectTargetHost(param1:IEffectTargetHost) : void;
      
      function get hideFocusRing() : Boolean;
      
      function set hideFocusRing(param1:Boolean) : void;
      
      function get playheadTime() : Number;
      
      function set playheadTime(param1:Number) : void;
      
      function get propertyChanges() : PropertyChanges;
      
      function set propertyChanges(param1:PropertyChanges) : void;
      
      function get repeatCount() : int;
      
      function set repeatCount(param1:int) : void;
      
      function get repeatDelay() : int;
      
      function set repeatDelay(param1:int) : void;
      
      function get startDelay() : int;
      
      function set startDelay(param1:int) : void;
      
      function get suspendBackgroundProcessing() : Boolean;
      
      function set suspendBackgroundProcessing(param1:Boolean) : void;
      
      function get target() : Object;
      
      function set target(param1:Object) : void;
      
      function get triggerEvent() : Event;
      
      function set triggerEvent(param1:Event) : void;
      
      function initEffect(param1:Event) : void;
      
      function startEffect() : void;
      
      function play() : void;
      
      function pause() : void;
      
      function stop() : void;
      
      function resume() : void;
      
      function reverse() : void;
      
      function end() : void;
      
      function finishEffect() : void;
      
      function finishRepeat() : void;
   }
}
