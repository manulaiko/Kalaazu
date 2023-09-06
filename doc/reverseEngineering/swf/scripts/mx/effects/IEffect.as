package mx.effects
{
   import flash.events.Event;
   
   public interface IEffect extends IAbstractEffect
   {
       
      
      function get className() : String;
      
      function get customFilter() : EffectTargetFilter;
      
      function set customFilter(param1:EffectTargetFilter) : void;
      
      function get duration() : Number;
      
      function set duration(param1:Number) : void;
      
      function get effectTargetHost() : IEffectTargetHost;
      
      function set effectTargetHost(param1:IEffectTargetHost) : void;
      
      function get filter() : String;
      
      function set filter(param1:String) : void;
      
      function get hideFocusRing() : Boolean;
      
      function set hideFocusRing(param1:Boolean) : void;
      
      function get isPlaying() : Boolean;
      
      function get perElementOffset() : Number;
      
      function set perElementOffset(param1:Number) : void;
      
      function get relevantProperties() : Array;
      
      function set relevantProperties(param1:Array) : void;
      
      function get relevantStyles() : Array;
      
      function set relevantStyles(param1:Array) : void;
      
      function get target() : Object;
      
      function set target(param1:Object) : void;
      
      function get targets() : Array;
      
      function set targets(param1:Array) : void;
      
      function get triggerEvent() : Event;
      
      function set triggerEvent(param1:Event) : void;
      
      function get playheadTime() : Number;
      
      function set playheadTime(param1:Number) : void;
      
      function getAffectedProperties() : Array;
      
      function createInstances(param1:Array = null) : Array;
      
      function createInstance(param1:Object = null) : IEffectInstance;
      
      function deleteInstance(param1:IEffectInstance) : void;
      
      function play(param1:Array = null, param2:Boolean = false) : Array;
      
      function pause() : void;
      
      function stop() : void;
      
      function resume() : void;
      
      function reverse() : void;
      
      function end(param1:IEffectInstance = null) : void;
      
      function captureStartValues() : void;
      
      function captureMoreStartValues(param1:Array) : void;
      
      function captureEndValues() : void;
   }
}
