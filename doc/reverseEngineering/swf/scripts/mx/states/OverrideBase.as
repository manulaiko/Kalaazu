package mx.states
{
   import mx.binding.BindingManager;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.OnDemandEventDispatcher;
   
   public class OverrideBase extends OnDemandEventDispatcher implements IOverride
   {
       
      
      protected var applied:Boolean = false;
      
      protected var parentContext:UIComponent;
      
      private var targetProperty:String;
      
      public var isBaseValueDataBound:Boolean;
      
      public function OverrideBase()
      {
         super();
      }
      
      public function initialize() : void
      {
      }
      
      public function apply(param1:UIComponent) : void
      {
      }
      
      public function remove(param1:UIComponent) : void
      {
      }
      
      public function initializeFromObject(param1:Object) : Object
      {
         var _loc2_:* = null;
         for(_loc2_ in param1)
         {
            this[_loc2_] = param1[_loc2_];
         }
         return Object(this);
      }
      
      protected function getOverrideContext(param1:Object, param2:UIComponent) : Object
      {
         if(param1 == null)
         {
            return param2;
         }
         if(param1 is String)
         {
            return param2[param1];
         }
         return param1;
      }
      
      protected function addContextListener(param1:Object) : void
      {
         if(param1 is String && this.parentContext != null)
         {
            this.targetProperty = param1 as String;
            this.parentContext.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.context_propertyChangeHandler);
         }
      }
      
      protected function removeContextListener() : void
      {
         if(this.parentContext != null)
         {
            this.parentContext.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.context_propertyChangeHandler);
         }
      }
      
      protected function context_propertyChangeHandler(param1:PropertyChangeEvent) : void
      {
         if(param1.property == this.targetProperty && param1.newValue != null)
         {
            this.apply(this.parentContext);
            this.removeContextListener();
         }
      }
      
      protected function enableBindings(param1:Object, param2:UIComponent, param3:String, param4:Boolean = true) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this.isBaseValueDataBound && param1 && param2 && Boolean(param3))
         {
            _loc5_ = !(_loc5_ = param1.hasOwnProperty("document") ? param1.document : null) && param2.hasOwnProperty("document") ? param2.document : _loc5_;
            _loc6_ = !(_loc6_ = param1.hasOwnProperty("id") ? param1.id : null) && param1.hasOwnProperty("name") ? param1.name : _loc6_;
            if(Boolean(_loc5_) && Boolean(_loc6_))
            {
               _loc7_ = _loc5_ == param1 ? "this" : _loc6_;
               BindingManager.enableBindings(_loc5_,_loc7_ + "." + param3,param4);
            }
         }
      }
   }
}
