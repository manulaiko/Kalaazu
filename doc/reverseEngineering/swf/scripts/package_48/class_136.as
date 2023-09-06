package package_48
{
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
   import spark.components.Label;
   import spark.components.VGroup;
   
   public class class_136 extends DOPopUp
   {
       
      
      private var var_4605:Label;
      
      private var _1229490301optionsContainer:VGroup;
      
      public function class_136()
      {
         super();
      }
      
      protected function creationCompleteHandler() : void
      {
         title = class_88.getItem("popup_bswin_title_filter_modules");
         this.toogleLabel.text = class_88.getItem("popup_bswin_message_filter_modules");
      }
      
      [Bindable(event="propertyChange")]
      public function get toogleLabel() : Label
      {
         return this.var_4605;
      }
      
      public function set toogleLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_4605;
         if(_loc2_ !== param1)
         {
            this.var_4605 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toogleLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionsContainer() : VGroup
      {
         return this._1229490301optionsContainer;
      }
      
      public function set optionsContainer(param1:VGroup) : void
      {
         var _loc2_:Object = this._1229490301optionsContainer;
         if(_loc2_ !== param1)
         {
            this._1229490301optionsContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionsContainer",_loc2_,param1));
            }
         }
      }
   }
}
