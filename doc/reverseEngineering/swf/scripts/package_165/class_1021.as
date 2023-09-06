package package_165
{
   import mx.controls.ProgressBar;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import spark.components.Button;
   import spark.components.Label;
   import spark.components.SkinnableContainer;
   
   public class class_1021 extends SkinnableContainer
   {
       
      
      private var var_359:Label;
      
      private var var_461:Label;
      
      private var var_2885:Label;
      
      private var var_2606:ProgressBar;
      
      private var var_3420:Label;
      
      private var var_3847:Label;
      
      private var var_2629:ProgressBar;
      
      private var var_4220:DOButtonBase;
      
      private var var_4895:DOButtonBase;
      
      protected var var_937:String;
      
      protected var var_3403:String;
      
      private var var_1720:Button;
      
      public function class_1021()
      {
         super();
      }
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         callLater(this.initLabels);
      }
      
      private function initLabels() : void
      {
         this.titleLabel.text = class_88.getItem("label_bswin_install_status");
         this.buildButtonDisabled.label = class_88.getItem("btn_bswin_build_station");
         this.buildButton.label = class_88.getItem("btn_bswin_build_station");
      }
      
      public function setData(param1:Number, param2:Number, param3:Boolean, param4:String, param5:String, param6:Boolean = false) : void
      {
         this.yourClanProgressLabel.text = param5;
         this.leadingClanProgressLabel.text = param4 || true;
         this.yourClanProgressValue.text = this.format(param1) + "%";
         this.yourClanProgress.setProgress(param1,1);
         this.leadingClanProgressValue.text = this.format(param2) + "%";
         this.leadingClanProgress.setProgress(param2,1);
         this.buildButton.visible = param3;
         this.buildButtonDisabled.visible = !param3;
         if(param6)
         {
            this.tipButton.visible = true;
            this.tipButton.toolTip = class_88.getItem("tooltip_no_rights_to_build");
            this.tipButton.alpha = 0;
         }
         else
         {
            this.tipButton.visible = false;
         }
         this.method_1719(param1 * 10,param2 * 10,param4);
      }
      
      private function method_1719(param1:int, param2:int, param3:String) : void
      {
         this._yourClanModulesTipText = class_88.getItem("tooltip_your_clans_modules_num").replace("%AMOUNT%",param1);
         if(param2 == 0)
         {
            this._leadingClanModulesTipText = "";
            this.leadingClanProgressLabel.toolTip = null;
            this.leadingClanProgressValue.toolTip = null;
         }
         else
         {
            this._leadingClanModulesTipText = class_88.getItem("tooltip_your_leading_modules_num");
            this._leadingClanModulesTipText = this._leadingClanModulesTipText.replace("%AMOUNT%",param2);
            this._leadingClanModulesTipText = this._leadingClanModulesTipText.replace("%CLAN_NAME%",param3);
         }
      }
      
      private function format(param1:Number) : int
      {
         return Math.round(Number(param1.toFixed(2)) * 100);
      }
      
      [Bindable(event="propertyChange")]
      public function get titleLabel() : Label
      {
         return this.var_359;
      }
      
      public function set titleLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_359;
         if(_loc2_ !== param1)
         {
            this.var_359 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get yourClanProgressLabel() : Label
      {
         return this.var_461;
      }
      
      public function set yourClanProgressLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_461;
         if(_loc2_ !== param1)
         {
            this.var_461 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yourClanProgressLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get yourClanProgressValue() : Label
      {
         return this.var_2885;
      }
      
      public function set yourClanProgressValue(param1:Label) : void
      {
         var _loc2_:Object = this.var_2885;
         if(_loc2_ !== param1)
         {
            this.var_2885 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yourClanProgressValue",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get yourClanProgress() : ProgressBar
      {
         return this.var_2606;
      }
      
      public function set yourClanProgress(param1:ProgressBar) : void
      {
         var _loc2_:Object = this.var_2606;
         if(_loc2_ !== param1)
         {
            this.var_2606 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yourClanProgress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leadingClanProgressLabel() : Label
      {
         return this.var_3420;
      }
      
      public function set leadingClanProgressLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_3420;
         if(_loc2_ !== param1)
         {
            this.var_3420 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leadingClanProgressLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leadingClanProgressValue() : Label
      {
         return this.var_3847;
      }
      
      public function set leadingClanProgressValue(param1:Label) : void
      {
         var _loc2_:Object = this.var_3847;
         if(_loc2_ !== param1)
         {
            this.var_3847 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leadingClanProgressValue",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leadingClanProgress() : ProgressBar
      {
         return this.var_2629;
      }
      
      public function set leadingClanProgress(param1:ProgressBar) : void
      {
         var _loc2_:Object = this.var_2629;
         if(_loc2_ !== param1)
         {
            this.var_2629 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leadingClanProgress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buildButtonDisabled() : DOButtonBase
      {
         return this.var_4220;
      }
      
      public function set buildButtonDisabled(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_4220;
         if(_loc2_ !== param1)
         {
            this.var_4220 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buildButtonDisabled",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buildButton() : DOButtonBase
      {
         return this.var_4895;
      }
      
      public function set buildButton(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_4895;
         if(_loc2_ !== param1)
         {
            this.var_4895 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buildButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _yourClanModulesTipText() : String
      {
         return this.var_937;
      }
      
      protected function set _yourClanModulesTipText(param1:String) : void
      {
         var _loc2_:Object = this.var_937;
         if(_loc2_ !== param1)
         {
            this.var_937 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_yourClanModulesTipText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _leadingClanModulesTipText() : String
      {
         return this.var_3403;
      }
      
      protected function set _leadingClanModulesTipText(param1:String) : void
      {
         var _loc2_:Object = this.var_3403;
         if(_loc2_ !== param1)
         {
            this.var_3403 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_leadingClanModulesTipText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tipButton() : Button
      {
         return this.var_1720;
      }
      
      public function set tipButton(param1:Button) : void
      {
         var _loc2_:Object = this.var_1720;
         if(_loc2_ !== param1)
         {
            this.var_1720 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tipButton",_loc2_,param1));
            }
         }
      }
   }
}
