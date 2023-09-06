package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.components
{
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
   import spark.components.Label;
   import spark.components.VGroup;
   
   public class ConfigModePopupBase extends DOPopUp
   {
       
      
      private var _1229490301optionsContainer:VGroup;
      
      private var _1456957626resetAndExit:DOButtonBase;
      
      private var _172063912saveAndExit:DOButtonBase;
      
      private var _543040405orLabelF:Label;
      
      public function ConfigModePopupBase()
      {
         super();
      }
      
      protected function creationCompleteHandler() : void
      {
         title = class_88.getItem("popup_title_menu_config_mode");
         this.resetAndExit.label = class_88.getItem("config_mode_reset_and_exit");
         this.saveAndExit.label = class_88.getItem("config_mode_save_and_exit");
         this.orLabelF.text = class_88.getItem("config_mode_or");
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
      
      [Bindable(event="propertyChange")]
      public function get resetAndExit() : DOButtonBase
      {
         return this._1456957626resetAndExit;
      }
      
      public function set resetAndExit(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this._1456957626resetAndExit;
         if(_loc2_ !== param1)
         {
            this._1456957626resetAndExit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"resetAndExit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get saveAndExit() : DOButtonBase
      {
         return this._172063912saveAndExit;
      }
      
      public function set saveAndExit(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this._172063912saveAndExit;
         if(_loc2_ !== param1)
         {
            this._172063912saveAndExit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"saveAndExit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get orLabelF() : Label
      {
         return this._543040405orLabelF;
      }
      
      public function set orLabelF(param1:Label) : void
      {
         var _loc2_:Object = this._543040405orLabelF;
         if(_loc2_ !== param1)
         {
            this._543040405orLabelF = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"orLabelF",_loc2_,param1));
            }
         }
      }
   }
}
