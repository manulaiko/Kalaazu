package net.bigpoint.darkorbit.mvc.common.view.components
{
   import mx.controls.ToolTip;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class DOHtmlTooltip extends ToolTip
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _246668073_htmlText:String;
      
      public function DOHtmlTooltip()
      {
         super();
         this.addEventListener("creationComplete",this.___DOHtmlTooltip_ToolTip1_creationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set htmlText(param1:String) : void
      {
         this._htmlText = param1;
      }
      
      private function creationCompleteHandler() : void
      {
         textField.htmlText = this._htmlText;
         invalidateSize();
      }
      
      public function ___DOHtmlTooltip_ToolTip1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler();
      }
      
      [Bindable(event="propertyChange")]
      private function get _htmlText() : String
      {
         return this._246668073_htmlText;
      }
      
      private function set _htmlText(param1:String) : void
      {
         var _loc2_:Object = this._246668073_htmlText;
         if(_loc2_ !== param1)
         {
            this._246668073_htmlText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_htmlText",_loc2_,param1));
            }
         }
      }
   }
}
