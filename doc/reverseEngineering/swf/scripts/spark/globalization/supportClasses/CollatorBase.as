package spark.globalization.supportClasses
{
   import flash.globalization.Collator;
   import flash.globalization.CollatorMode;
   import mx.core.mx_internal;
   import mx.utils.ObjectUtil;
   import spark.globalization.LastOperationStatus;
   
   public class CollatorBase extends GlobalizationBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const IGNORE_CASE:String = "ignoreCase";
      
      private static const IGNORE_CHARACTER_WIDTH:String = "ignoreCharacterWidth";
      
      private static const IGNORE_DIACRITICS:String = "ignoreDiacritics";
      
      private static const IGNORE_KANA_TYPE:String = "ignoreKanaType";
      
      private static const IGNORE_SYMBOLS:String = "ignoreSymbols";
      
      private static const NUMERIC_COMPARISON:String = "numericComparison";
       
      
      private var _g11nWorkingInstance:Collator;
      
      private var initialMode:String = null;
      
      public function CollatorBase(param1:String)
      {
         super();
         this.initialMode = param1;
      }
      
      public static function getAvailableLocaleIDNames() : Vector.<String>
      {
         var _loc1_:Vector.<String> = Collator.getAvailableLocaleIDNames();
         return !!_loc1_ ? _loc1_ : new Vector.<String>["en-US"]();
      }
      
      private function get g11nWorkingInstance() : Collator
      {
         if(!this._g11nWorkingInstance)
         {
            mx_internal::ensureStyleSource();
         }
         return this._g11nWorkingInstance;
      }
      
      private function set g11nWorkingInstance(param1:Collator) : void
      {
         this._g11nWorkingInstance = param1;
      }
      
      [Bindable("change")]
      override public function get actualLocaleIDName() : String
      {
         if(this.g11nWorkingInstance)
         {
            return this.g11nWorkingInstance.actualLocaleIDName;
         }
         if(mx_internal::localeStyle === undefined || mx_internal::localeStyle === null)
         {
            mx_internal::fallbackLastOperationStatus = LastOperationStatus.LOCALE_UNDEFINED_ERROR;
            return undefined;
         }
         mx_internal::fallbackLastOperationStatus = LastOperationStatus.NO_ERROR;
         return "en-US";
      }
      
      [Bindable("change")]
      override public function get lastOperationStatus() : String
      {
         return !!this.g11nWorkingInstance ? this.g11nWorkingInstance.lastOperationStatus : mx_internal::fallbackLastOperationStatus;
      }
      
      [Bindable("change")]
      override mx_internal function get useFallback() : Boolean
      {
         return this.g11nWorkingInstance == null;
      }
      
      [Bindable("change")]
      public function get ignoreCase() : Boolean
      {
         return mx_internal::getBasicProperty(mx_internal::properties,IGNORE_CASE);
      }
      
      public function set ignoreCase(param1:Boolean) : void
      {
         mx_internal::setBasicProperty(mx_internal::properties,IGNORE_CASE,param1);
      }
      
      [Bindable("change")]
      public function get ignoreCharacterWidth() : Boolean
      {
         return mx_internal::getBasicProperty(mx_internal::properties,IGNORE_CHARACTER_WIDTH);
      }
      
      public function set ignoreCharacterWidth(param1:Boolean) : void
      {
         mx_internal::setBasicProperty(mx_internal::properties,IGNORE_CHARACTER_WIDTH,param1);
      }
      
      [Bindable("change")]
      public function get ignoreDiacritics() : Boolean
      {
         return mx_internal::getBasicProperty(mx_internal::properties,IGNORE_DIACRITICS);
      }
      
      public function set ignoreDiacritics(param1:Boolean) : void
      {
         mx_internal::setBasicProperty(mx_internal::properties,IGNORE_DIACRITICS,param1);
      }
      
      [Bindable("change")]
      public function get ignoreKanaType() : Boolean
      {
         return mx_internal::getBasicProperty(mx_internal::properties,IGNORE_KANA_TYPE);
      }
      
      public function set ignoreKanaType(param1:Boolean) : void
      {
         mx_internal::setBasicProperty(mx_internal::properties,IGNORE_KANA_TYPE,param1);
      }
      
      [Bindable("change")]
      public function get ignoreSymbols() : Boolean
      {
         return mx_internal::getBasicProperty(mx_internal::properties,IGNORE_SYMBOLS);
      }
      
      public function set ignoreSymbols(param1:Boolean) : void
      {
         mx_internal::setBasicProperty(mx_internal::properties,IGNORE_SYMBOLS,param1);
      }
      
      [Bindable("change")]
      public function get numericComparison() : Boolean
      {
         return mx_internal::getBasicProperty(mx_internal::properties,NUMERIC_COMPARISON);
      }
      
      public function set numericComparison(param1:Boolean) : void
      {
         mx_internal::setBasicProperty(mx_internal::properties,NUMERIC_COMPARISON,param1);
      }
      
      override mx_internal function createWorkingInstance() : void
      {
         if(mx_internal::localeStyle === undefined || mx_internal::localeStyle === null)
         {
            mx_internal::fallbackLastOperationStatus = LastOperationStatus.LOCALE_UNDEFINED_ERROR;
            this.g11nWorkingInstance = null;
            mx_internal::properties = null;
            return;
         }
         if(mx_internal::enforceFallback)
         {
            this.fallbackInstantiate();
            this.g11nWorkingInstance = null;
            return;
         }
         this.g11nWorkingInstance = new Collator(mx_internal::localeStyle,this.initialMode);
         if(Boolean(this.g11nWorkingInstance) && this.g11nWorkingInstance.lastOperationStatus != LastOperationStatus.UNSUPPORTED_ERROR)
         {
            mx_internal::properties = this.g11nWorkingInstance;
            mx_internal::propagateBasicProperties(this.g11nWorkingInstance);
            return;
         }
         this.fallbackInstantiate();
         this.g11nWorkingInstance = null;
         if(mx_internal::fallbackLastOperationStatus == LastOperationStatus.NO_ERROR)
         {
            mx_internal::fallbackLastOperationStatus = LastOperationStatus.USING_FALLBACK_WARNING;
         }
      }
      
      [Bindable("change")]
      public function compare(param1:String, param2:String) : int
      {
         if(this.g11nWorkingInstance)
         {
            if(param1 === null && param2 === null)
            {
               return 0;
            }
            if(param1 === null)
            {
               return 1;
            }
            if(param2 === null)
            {
               return -1;
            }
            return this.g11nWorkingInstance.compare(param1,param2);
         }
         if(mx_internal::localeStyle === undefined || mx_internal::localeStyle === null)
         {
            mx_internal::fallbackLastOperationStatus = LastOperationStatus.LOCALE_UNDEFINED_ERROR;
            return undefined;
         }
         mx_internal::fallbackLastOperationStatus = LastOperationStatus.NO_ERROR;
         return ObjectUtil.stringCompare(param1,param2,mx_internal::properties.ignoreCase);
      }
      
      [Bindable("change")]
      public function equals(param1:String, param2:String) : Boolean
      {
         if(this.g11nWorkingInstance)
         {
            if(param1 === null && param2 === null)
            {
               return true;
            }
            if(param1 === null || param2 === null)
            {
               return false;
            }
            return this.g11nWorkingInstance.equals(param1,param2);
         }
         if(mx_internal::localeStyle === undefined || mx_internal::localeStyle === null)
         {
            mx_internal::fallbackLastOperationStatus = LastOperationStatus.LOCALE_UNDEFINED_ERROR;
            return undefined;
         }
         mx_internal::fallbackLastOperationStatus = LastOperationStatus.NO_ERROR;
         return ObjectUtil.stringCompare(param1,param2,mx_internal::properties.ignoreCase) == 0;
      }
      
      private function fallbackInstantiate() : void
      {
         var _loc1_:Boolean = this.initialMode == CollatorMode.MATCHING || this.initialMode == CollatorMode.SORTING;
         mx_internal::fallbackLastOperationStatus = _loc1_ ? "null" : LastOperationStatus.INVALID_ATTR_VALUE;
         mx_internal::properties = {
            "ignoreCase":this.initialMode == CollatorMode.MATCHING,
            "ignoreCharacterWidth":false,
            "ignoreDiacritics":false,
            "ignoreKanaType":false,
            "ignoreSymbols":false,
            "numericComparison":false
         };
         mx_internal::propagateBasicProperties(mx_internal::properties);
      }
   }
}
