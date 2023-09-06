package mx.binding
{
   import flash.utils.Dictionary;
   import mx.collections.errors.ItemPendingError;
   import mx.core.mx_internal;
   
   public class Binding
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var allowedErrors:Object = mx_internal::generateAllowedErrors();
       
      
      mx_internal var _isEnabled:Boolean;
      
      mx_internal var isExecuting:Boolean;
      
      mx_internal var isHandlingEvent:Boolean;
      
      mx_internal var disabledRequests:Dictionary;
      
      private var hasHadValue:Boolean;
      
      public var uiComponentWatcher:int;
      
      public var twoWayCounterpart:Binding;
      
      public var isTwoWayPrimary:Boolean;
      
      private var wrappedFunctionSuccessful:Boolean;
      
      mx_internal var document:Object;
      
      mx_internal var srcFunc:Function;
      
      mx_internal var destFunc:Function;
      
      mx_internal var destString:String;
      
      mx_internal var srcString:String;
      
      private var lastValue:Object;
      
      public function Binding(param1:Object, param2:Function, param3:Function, param4:String, param5:String = null)
      {
         super();
         this.mx_internal::document = param1;
         this.mx_internal::srcFunc = param2;
         this.mx_internal::destFunc = param3;
         this.mx_internal::destString = param4;
         this.mx_internal::srcString = param5;
         if(this.mx_internal::srcFunc == null)
         {
            this.mx_internal::srcFunc = this.defaultSrcFunc;
         }
         if(this.mx_internal::destFunc == null)
         {
            this.mx_internal::destFunc = this.defaultDestFunc;
         }
         this.mx_internal::_isEnabled = true;
         this.mx_internal::isExecuting = false;
         this.mx_internal::isHandlingEvent = false;
         this.hasHadValue = false;
         this.uiComponentWatcher = -1;
         BindingManager.addBinding(param1,param4,this);
      }
      
      mx_internal static function generateAllowedErrors() : Object
      {
         var _loc1_:* = {};
         _loc1_[1507] = 1;
         _loc1_[2005] = 1;
         return _loc1_;
      }
      
      mx_internal function get isEnabled() : Boolean
      {
         return this.mx_internal::_isEnabled;
      }
      
      mx_internal function set isEnabled(param1:Boolean) : void
      {
         this.mx_internal::_isEnabled = param1;
         if(param1)
         {
            this.processDisabledRequests();
         }
      }
      
      private function defaultDestFunc(param1:Object) : void
      {
         var _loc2_:Array = this.mx_internal::destString.split(".");
         var _loc3_:Object = this.mx_internal::document;
         var _loc4_:Number = 0;
         if(_loc2_[0] == "this")
         {
            _loc4_++;
         }
         while(_loc4_ < _loc2_.length - 1)
         {
            _loc3_ = _loc3_[_loc2_[_loc4_++]];
         }
         _loc3_[_loc2_[_loc4_]] = param1;
      }
      
      private function defaultSrcFunc() : Object
      {
         return this.mx_internal::document[this.mx_internal::srcString];
      }
      
      public function execute(param1:Object = null) : void
      {
         var o:Object = param1;
         if(!this.mx_internal::isEnabled)
         {
            if(o != null)
            {
               this.registerDisabledExecute(o);
            }
            return;
         }
         if(this.twoWayCounterpart && !this.twoWayCounterpart.hasHadValue && this.twoWayCounterpart.isTwoWayPrimary)
         {
            this.twoWayCounterpart.execute();
            this.hasHadValue = true;
            return;
         }
         if(this.mx_internal::isExecuting || this.twoWayCounterpart && this.twoWayCounterpart.mx_internal::isExecuting)
         {
            this.hasHadValue = true;
            return;
         }
         try
         {
            this.mx_internal::isExecuting = true;
            this.wrapFunctionCall(this,this.innerExecute,o);
         }
         catch(error:Error)
         {
            if(true)
            {
               throw error;
            }
         }
         finally
         {
            this.mx_internal::isExecuting = false;
         }
      }
      
      private function registerDisabledExecute(param1:Object) : void
      {
         if(param1 != null)
         {
            this.mx_internal::disabledRequests = this.mx_internal::disabledRequests != null ? this.mx_internal::disabledRequests : new Dictionary(true);
            this.mx_internal::disabledRequests[param1] = true;
         }
      }
      
      private function processDisabledRequests() : void
      {
         var _loc1_:* = null;
         if(this.mx_internal::disabledRequests != null)
         {
            for(_loc1_ in this.mx_internal::disabledRequests)
            {
               this.execute(_loc1_);
            }
            this.mx_internal::disabledRequests = null;
         }
      }
      
      protected function wrapFunctionCall(param1:Object, param2:Function, param3:Object = null, ... rest) : Object
      {
         var var_5:Object = null;
         var thisArg:Object = param1;
         var wrappedFunction:Function = param2;
         var object:Object = param3;
         var args:Array = rest;
         this.wrappedFunctionSuccessful = false;
         try
         {
            var_5 = wrappedFunction.apply(thisArg,args);
            this.wrappedFunctionSuccessful = true;
            return var_5;
         }
         catch(itemPendingError:ItemPendingError)
         {
            itemPendingError.addResponder(new EvalBindingResponder(this,object));
            if(BindingManager.debugDestinationStrings[mx_internal::destString])
            {
               trace("Binding: destString = " + mx_internal::destString + ", error = " + itemPendingError);
            }
         }
         catch(rangeError:RangeError)
         {
            if(BindingManager.debugDestinationStrings[mx_internal::destString])
            {
               trace("Binding: destString = " + mx_internal::destString + ", error = " + rangeError);
            }
         }
         catch(error:Error)
         {
            if(error.errorID != 1006 && error.errorID != 1009 && error.errorID != 1010 && error.errorID != 1055 && error.errorID != 1069)
            {
               throw error;
            }
            if(BindingManager.debugDestinationStrings[mx_internal::destString])
            {
               trace("Binding: destString = " + mx_internal::destString + ", error = " + error);
            }
         }
         return null;
      }
      
      private function nodeSeqEqual(param1:XMLList, param2:XMLList) : Boolean
      {
         var _loc4_:Number = 0;
         var _loc3_:uint = param1.length();
         if(_loc3_ == param2.length())
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_ && param1[_loc4_] === param2[_loc4_])
            {
               _loc4_++;
            }
            return _loc4_ == _loc3_;
         }
         return false;
      }
      
      private function innerExecute() : void
      {
         var _loc1_:Object = this.wrapFunctionCall(this.mx_internal::document,this.mx_internal::srcFunc);
         if(BindingManager.debugDestinationStrings[this.mx_internal::destString])
         {
            trace("Binding: destString = " + this.mx_internal::destString + ", srcFunc result = " + _loc1_);
         }
         if(this.hasHadValue || this.wrappedFunctionSuccessful)
         {
            if(!(this.lastValue is XML && Boolean(this.lastValue.hasComplexContent()) && this.lastValue === _loc1_) && !(this.lastValue is XMLList && this.lastValue.hasComplexContent() && _loc1_ is XMLList && this.nodeSeqEqual(this.lastValue as XMLList,_loc1_ as XMLList)))
            {
               this.mx_internal::destFunc.call(this.mx_internal::document,_loc1_);
               this.lastValue = _loc1_;
               this.hasHadValue = true;
            }
         }
      }
      
      public function watcherFired(param1:Boolean, param2:int) : void
      {
         var commitEvent:Boolean = param1;
         var cloneIndex:int = param2;
         if(this.mx_internal::isHandlingEvent)
         {
            return;
         }
         try
         {
            this.mx_internal::isHandlingEvent = true;
            this.execute(cloneIndex);
         }
         finally
         {
            this.mx_internal::isHandlingEvent = false;
         }
      }
   }
}
