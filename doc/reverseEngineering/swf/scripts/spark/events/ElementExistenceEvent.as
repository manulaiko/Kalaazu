package spark.events
{
   import flash.events.Event;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   
   public class ElementExistenceEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const ELEMENT_ADD:String = "elementAdd";
      
      public static const ELEMENT_REMOVE:String = "elementRemove";
       
      
      public var index:int;
      
      public var element:IVisualElement;
      
      public function ElementExistenceEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:IVisualElement = null, param5:int = -1)
      {
         super(param1,param2,param3);
         this.element = param4;
         this.index = param5;
      }
      
      override public function clone() : Event
      {
         return new ElementExistenceEvent(type,bubbles,cancelable,this.element,this.index);
      }
   }
}
