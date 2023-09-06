package mx.accessibility
{
   import flash.accessibility.Accessibility;
   import flash.accessibility.AccessibilityProperties;
   import flash.events.Event;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   public class UIComponentAccProps extends AccessibilityProperties
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var oldToolTip:String;
      
      private var oldErrorString:String;
      
      protected var master:UIComponent;
      
      public function UIComponentAccProps(param1:UIComponent)
      {
         super();
         this.master = param1;
         if(param1.accessibilityProperties)
         {
            silent = param1.accessibilityProperties.silent;
            forceSimple = param1.accessibilityProperties.forceSimple;
            noAutoLabeling = param1.accessibilityProperties.noAutoLabeling;
            if(param1.accessibilityProperties.name)
            {
               name = param1.accessibilityProperties.name;
            }
            if(param1.accessibilityProperties.description)
            {
               description = param1.accessibilityProperties.description;
            }
            if(param1.accessibilityProperties.shortcut)
            {
               shortcut = param1.accessibilityProperties.shortcut;
            }
         }
         if(AccImpl.mx_internal::getMatchingDefinition(this.master,AccImpl.mx_internal::getDefinitions("ScrollBar",this.master.moduleFactory)))
         {
            silent = true;
            return;
         }
         if(this.isFormItemLabel(this.master))
         {
            name = AccImpl.getFormName(this.master);
            silent = true;
            return;
         }
         if(mx_internal::componentShouldBeSilent(param1))
         {
            name = "";
            return;
         }
         if(AccImpl.mx_internal::isFormHeading(this.master) && this.master.tabIndex > 0)
         {
            try
            {
               if(Object(this.master).labelDisplay.tabIndex == -1)
               {
                  Object(this.master).labelDisplay.tabIndex = this.master.tabIndex;
               }
            }
            catch(e:Error)
            {
            }
         }
         var _loc2_:String = AccImpl.getFormName(this.master);
         if(Boolean(_loc2_) && _loc2_.length != 0)
         {
            name = _loc2_ + name;
         }
         if(Boolean(this.master.toolTip) && this.master.toolTip.length != 0)
         {
            if(!param1.accessibilityProperties || param1.accessibilityProperties && !param1.accessibilityProperties.name)
            {
               this.oldToolTip = " " + this.master.toolTip;
               name += this.oldToolTip;
            }
         }
         if(Boolean(this.master.errorString) && this.master.errorString.length != 0)
         {
            this.oldErrorString = " " + this.master.errorString;
            name += this.oldErrorString;
         }
         this.master.addEventListener("toolTipChanged",this.eventHandler);
         this.master.addEventListener("errorStringChanged",this.eventHandler);
      }
      
      public static function enableAccessibility() : void
      {
         UIComponent.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
      }
      
      mx_internal static function createAccessibilityImplementation(param1:UIComponent) : void
      {
         param1.accessibilityProperties = new UIComponentAccProps(param1);
      }
      
      mx_internal static function componentShouldBeSilent(param1:UIComponent) : Boolean
      {
         var _loc2_:Class = Class(AccImpl.mx_internal::getDefinition("spark.components.Group",param1.moduleFactory));
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:UIComponent = AccImpl.mx_internal::findMatchingAncestor(param1,AccImpl.mx_internal::isFormItem);
         if(!_loc3_)
         {
            return false;
         }
         try
         {
            if(param1 is _loc2_ && param1.parent.parent === _loc3_)
            {
               return true;
            }
         }
         catch(e:Error)
         {
         }
         var _loc4_:Class;
         if(!(_loc4_ = Class(AccImpl.mx_internal::getDefinition("spark.components.Image",param1.moduleFactory))))
         {
            return false;
         }
         try
         {
            if(param1 is _loc4_ && param1.parent is _loc2_ && param1.parent.parent.parent === _loc3_)
            {
               return true;
            }
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      protected function isFormItemLabel(param1:UIComponent) : Boolean
      {
         var _loc2_:String = this.master.name;
         if(_loc2_ == "labelDisplay" || _loc2_ == "sequenceLabelDisplay" || _loc2_ == "helpContentGroup" || _loc2_ == "errorTextDisplay")
         {
            return true;
         }
         return Boolean(AccImpl.mx_internal::getMatchingDefinition(this.master,AccImpl.mx_internal::getDefinitions("FormItemLabel",this.master.moduleFactory)));
      }
      
      protected function eventHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case "errorStringChanged":
               if(name && Boolean(this.oldErrorString))
               {
                  _loc2_ = name.indexOf(this.oldErrorString);
                  if(_loc2_ != -1)
                  {
                     name = name.substring(0,_loc2_) + name.substring(_loc2_ + this.oldErrorString.length);
                  }
                  this.oldErrorString = null;
               }
               if(Boolean(this.master.errorString) && this.master.errorString.length != 0)
               {
                  if(!name)
                  {
                     name = "";
                  }
                  this.oldErrorString = " " + this.master.errorString;
                  name += this.oldErrorString;
               }
               Accessibility.updateProperties();
               break;
            case "toolTipChanged":
               if(name && Boolean(this.oldToolTip))
               {
                  _loc2_ = name.indexOf(this.oldToolTip);
                  if(_loc2_ != -1)
                  {
                     name = name.substring(0,_loc2_) + name.substring(_loc2_ + this.oldToolTip.length);
                  }
                  this.oldToolTip = null;
               }
               if(Boolean(this.master.toolTip) && this.master.toolTip.length != 0)
               {
                  if(!this.master.accessibilityProperties || this.master.accessibilityProperties && !this.master.accessibilityProperties.name)
                  {
                     if(!name)
                     {
                        name = "";
                     }
                     this.oldToolTip = " " + this.master.toolTip;
                     name += this.oldToolTip;
                  }
               }
               Accessibility.updateProperties();
         }
      }
   }
}
