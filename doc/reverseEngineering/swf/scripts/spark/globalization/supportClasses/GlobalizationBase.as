package spark.globalization.supportClasses
{
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import mx.core.FlexGlobals;
   import mx.core.mx_internal;
   import mx.styles.AdvancedStyleClient;
   import spark.globalization.LastOperationStatus;
   
   public class GlobalizationBase extends AdvancedStyleClient
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var basicProperties:Object = null;
      
      mx_internal var properties:Object = null;
      
      mx_internal var localeStyle;
      
      mx_internal var fallbackLastOperationStatus:String = "noError";
      
      private var _enforceFallback:Boolean = false;
      
      public function GlobalizationBase()
      {
         super();
      }
      
      [Bindable("change")]
      public function get actualLocaleIDName() : String
      {
         throw new IllegalOperationError();
      }
      
      mx_internal function get enforceFallback() : Boolean
      {
         return this._enforceFallback;
      }
      
      mx_internal function set enforceFallback(param1:Boolean) : void
      {
         if(this._enforceFallback == param1)
         {
            return;
         }
         this._enforceFallback = param1;
         if(this.mx_internal::localeStyle == null)
         {
            return;
         }
         this.mx_internal::createWorkingInstance();
         this.mx_internal::update();
      }
      
      [Bindable("change")]
      public function get lastOperationStatus() : String
      {
         throw new IllegalOperationError();
      }
      
      [Bindable("change")]
      mx_internal function get useFallback() : Boolean
      {
         throw new IllegalOperationError();
      }
      
      override public function getStyle(param1:String) : *
      {
         if(param1 != "locale")
         {
            return super.getStyle(param1);
         }
         if(this.mx_internal::localeStyle !== undefined && this.mx_internal::localeStyle !== null)
         {
            return this.mx_internal::localeStyle;
         }
         if(styleParent)
         {
            return styleParent.getStyle(param1);
         }
         if(false)
         {
            return FlexGlobals.topLevelApplication.getStyle(param1);
         }
         return undefined;
      }
      
      override public function setStyle(param1:String, param2:*) : void
      {
         super.setStyle(param1,param2);
         if(param1 != "locale")
         {
            return;
         }
         this.localeChanged();
      }
      
      override public function styleChanged(param1:String) : void
      {
         this.localeChanged();
         super.styleChanged(param1);
      }
      
      mx_internal function createWorkingInstance() : void
      {
         throw new IllegalOperationError();
      }
      
      mx_internal function ensureStyleSource() : void
      {
         if(!styleParent && (this.mx_internal::localeStyle === undefined || this.mx_internal::localeStyle === null))
         {
            if(false)
            {
               FlexGlobals.topLevelApplication.addStyleClient(this);
            }
         }
      }
      
      mx_internal function propagateBasicProperties(param1:Object) : void
      {
         var _loc2_:* = null;
         if(this.basicProperties)
         {
            for(_loc2_ in this.basicProperties)
            {
               param1[_loc2_] = this.basicProperties[_loc2_];
            }
         }
      }
      
      mx_internal function getBasicProperty(param1:Object, param2:String) : *
      {
         this.mx_internal::ensureStyleSource();
         if(param1)
         {
            return param1[param2];
         }
         if(this.mx_internal::properties)
         {
            return this.mx_internal::properties[param2];
         }
         if(this.mx_internal::localeStyle === undefined || this.mx_internal::localeStyle === null)
         {
            this.mx_internal::fallbackLastOperationStatus = LastOperationStatus.LOCALE_UNDEFINED_ERROR;
         }
         return undefined;
      }
      
      mx_internal function setBasicProperty(param1:Object, param2:String, param3:*) : void
      {
         this.mx_internal::fallbackLastOperationStatus = LastOperationStatus.NO_ERROR;
         if(this.basicProperties)
         {
            if(this.basicProperties[param2] == param3)
            {
               return;
            }
         }
         else
         {
            this.basicProperties = new Object();
         }
         this.basicProperties[param2] = param3;
         if(param1)
         {
            param1[param2] = param3;
         }
         this.mx_internal::update();
      }
      
      mx_internal function update() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function localeChanged() : void
      {
         var _loc1_:* = super.getStyle("locale");
         if(this.mx_internal::localeStyle === _loc1_)
         {
            return;
         }
         this.mx_internal::localeStyle = _loc1_;
         this.mx_internal::createWorkingInstance();
         this.mx_internal::update();
      }
   }
}
