package mx.effects
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.FocusEvent;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   import mx.core.EventPriority;
   import mx.core.FlexGlobals;
   import mx.core.IDeferredInstantiationUIComponent;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.IVisualElement;
   import mx.core.IVisualElementContainer;
   import mx.core.UIComponent;
   import mx.core.UIComponentCachePolicy;
   import mx.core.mx_internal;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.MoveEvent;
   import mx.events.ResizeEvent;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class EffectManager extends EventDispatcher
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var effectsPlaying:Array = [];
      
      private static var effectTriggersForEvent:Object = {};
      
      private static var eventsForEffectTriggers:Object = {};
      
      private static var targetsInfo:Array = [];
      
      private static var eventHandlingSuspendCount:Number = 0;
      
      private static var weakKeys:Dictionary;
      
      private static var _resourceManager:IResourceManager;
      
      private static var effects:Dictionary = new Dictionary(true);
       
      
      public function EffectManager()
      {
         super();
      }
      
      mx_internal static function set lastEffectCreated(param1:Effect) : void
      {
         weakKeys = new Dictionary(true);
         weakKeys[param1] = true;
      }
      
      mx_internal static function get lastEffectCreated() : Effect
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:* = weakKeys;
         for(_loc1_ in _loc3_)
         {
            return _loc1_;
         }
         return null;
      }
      
      private static function get resourceManager() : IResourceManager
      {
         if(!_resourceManager)
         {
            _resourceManager = ResourceManager.getInstance();
         }
         return _resourceManager;
      }
      
      public static function suspendEventHandling() : void
      {
         ++eventHandlingSuspendCount;
      }
      
      public static function resumeEventHandling() : void
      {
         --eventHandlingSuspendCount;
      }
      
      public static function endEffectsForTarget(param1:IUIComponent) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if((_loc4_ = mx_internal::effectsPlaying[_loc3_].instance).target == param1)
            {
               _loc4_.end();
            }
            _loc3_--;
         }
      }
      
      mx_internal static function setStyle(param1:String, param2:*) : void
      {
         var _loc3_:String = "null";
         if(_loc3_ != null && _loc3_ != "")
         {
            param2.addEventListener(_loc3_,EffectManager.mx_internal::eventHandler,false,EventPriority.EFFECT);
         }
      }
      
      mx_internal static function createEffectForType(param1:Object, param2:String) : Effect
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc3_:* = "null";
         if(_loc3_ == "")
         {
            _loc3_ = param2 + "Effect";
         }
         var _loc4_:Object;
         if(!(_loc4_ = param1.getStyle(_loc3_)))
         {
            return null;
         }
         if(_loc4_ is Class)
         {
            return new (_loc6_ = Class(_loc4_))(param1);
         }
         try
         {
            if(_loc4_ is String)
            {
               if(!(_loc8_ = param1.parentDocument))
               {
                  _loc8_ = FlexGlobals.topLevelApplication;
               }
               _loc7_ = _loc8_[_loc4_];
            }
            else if(_loc4_ is Effect)
            {
               _loc7_ = Effect(_loc4_);
            }
            if(_loc7_)
            {
               _loc7_.target = param1;
               return _loc7_;
            }
         }
         catch(e:Error)
         {
         }
         if(param1 is UIComponent && Boolean(param1.moduleFactory))
         {
            if((_loc9_ = param1.moduleFactory.info()["currentDomain"]).hasDefinition("mx.effects." + _loc4_))
            {
               _loc5_ = Class(_loc9_.getDefinition("mx.effects." + _loc4_));
            }
         }
         if(!_loc5_)
         {
            _loc5_ = Class(param1.systemManager.getDefinitionByName("mx.effects." + _loc4_));
         }
         if(_loc5_)
         {
            return new _loc5_(param1);
         }
         return null;
      }
      
      private static function animateSameProperty(param1:Effect, param2:Effect, param3:EffectInstance) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(param1.target == param3.target)
         {
            _loc4_ = param1.getAffectedProperties();
            _loc5_ = param2.getAffectedProperties();
            _loc6_ = _loc4_.length;
            _loc7_ = _loc5_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc7_)
               {
                  if(_loc4_[_loc8_] == _loc5_[_loc9_])
                  {
                     return true;
                  }
                  _loc9_++;
               }
               _loc8_++;
            }
         }
         return false;
      }
      
      mx_internal static function startBitmapEffect(param1:IUIComponent) : void
      {
         cacheOrUncacheTargetAsBitmap(param1,true,true);
      }
      
      mx_internal static function endBitmapEffect(param1:IUIComponent) : void
      {
         cacheOrUncacheTargetAsBitmap(param1,false,true);
      }
      
      mx_internal static function startVectorEffect(param1:IUIComponent) : void
      {
         cacheOrUncacheTargetAsBitmap(param1,true,false);
      }
      
      mx_internal static function endVectorEffect(param1:IUIComponent) : void
      {
         cacheOrUncacheTargetAsBitmap(param1,false,false);
      }
      
      private static function cacheOrUncacheTargetAsBitmap(param1:IUIComponent, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         _loc4_ = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            if(targetsInfo[_loc5_].target == param1)
            {
               _loc6_ = targetsInfo[_loc5_];
               break;
            }
            _loc5_++;
         }
         if(!_loc6_)
         {
            _loc6_ = {
               "target":param1,
               "bitmapEffectsCount":0,
               "vectorEffectsCount":0
            };
            targetsInfo.push(_loc6_);
         }
         if(param2)
         {
            if(param3)
            {
               ++_loc6_.bitmapEffectsCount;
               if(_loc6_.vectorEffectsCount == 0 && param1 is IDeferredInstantiationUIComponent)
               {
                  IDeferredInstantiationUIComponent(param1).cacheHeuristic = true;
               }
            }
            else if(_loc6_.vectorEffectsCount++ == 0 && param1 is IDeferredInstantiationUIComponent && IDeferredInstantiationUIComponent(param1).cachePolicy == UIComponentCachePolicy.AUTO)
            {
               param1.cacheAsBitmap = false;
            }
         }
         else
         {
            if(param3)
            {
               if(_loc6_.bitmapEffectsCount != 0)
               {
                  --_loc6_.bitmapEffectsCount;
               }
               if(param1 is IDeferredInstantiationUIComponent)
               {
                  IDeferredInstantiationUIComponent(param1).cacheHeuristic = false;
               }
            }
            else if(_loc6_.vectorEffectsCount != 0)
            {
               if(--_loc6_.vectorEffectsCount == 0 && _loc6_.bitmapEffectsCount != 0)
               {
                  _loc4_ = int(_loc6_.bitmapEffectsCount);
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_)
                  {
                     if(param1 is IDeferredInstantiationUIComponent)
                     {
                        IDeferredInstantiationUIComponent(param1).cacheHeuristic = true;
                     }
                     _loc5_++;
                  }
               }
            }
            if(_loc6_.bitmapEffectsCount == 0 && _loc6_.vectorEffectsCount == 0)
            {
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  if(targetsInfo[_loc5_].target == param1)
                  {
                     targetsInfo.splice(_loc5_,1);
                     break;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      mx_internal static function registerEffectTrigger(param1:String, param2:String) : void
      {
         var _loc3_:Number = NaN;
         if(param1 != "")
         {
            if(param2 == "")
            {
               _loc3_ = param1.length;
               if(_loc3_ > 6 && param1.substring(_loc3_ - 6) == "Effect")
               {
                  param2 = param1.substring(0,_loc3_ - 6);
               }
            }
            if(param2 != "")
            {
               effectTriggersForEvent[param2] = param1;
               eventsForEffectTriggers[param1] = param2;
            }
         }
      }
      
      mx_internal static function getEventForEffectTrigger(param1:String) : String
      {
         var effectTrigger:String = param1;
         if(eventsForEffectTriggers)
         {
            try
            {
               return eventsForEffectTriggers[effectTrigger];
            }
            catch(e:Error)
            {
               return "";
            }
         }
         else
         {
            return "";
         }
      }
      
      mx_internal static function eventHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(!(param1.currentTarget is IFlexDisplayObject))
         {
            return;
         }
         if(eventHandlingSuspendCount > 0)
         {
            return;
         }
         if(param1 is FocusEvent && (param1.type == FocusEvent.FOCUS_OUT || param1.type == FocusEvent.FOCUS_IN))
         {
            _loc2_ = FocusEvent(param1);
            if(Boolean(_loc2_.relatedObject) && (_loc2_.currentTarget.contains(_loc2_.relatedObject) || _loc2_.currentTarget == _loc2_.relatedObject))
            {
               return;
            }
         }
         if((param1.type == Event.ADDED || param1.type == Event.REMOVED) && param1.target != param1.currentTarget)
         {
            return;
         }
         if(param1.type == Event.REMOVED)
         {
            if(param1.target is UIComponent)
            {
               if(UIComponent(param1.target).initialized == false)
               {
                  return;
               }
               if(UIComponent(param1.target).mx_internal::isEffectStarted)
               {
                  _loc4_ = 0;
                  while(_loc4_ < UIComponent(param1.target).mx_internal::_effectsStarted.length)
                  {
                     if(UIComponent(param1.target).mx_internal::_effectsStarted[_loc4_].triggerEvent.type == Event.REMOVED)
                     {
                        return;
                     }
                     _loc4_++;
                  }
               }
            }
            _loc3_ = param1.target as DisplayObject;
            if(_loc3_ != null)
            {
               if((_loc5_ = _loc3_.parent as DisplayObjectContainer) != null)
               {
                  if((_loc6_ = _loc5_.getChildIndex(_loc3_)) >= 0)
                  {
                     if(_loc3_ is UIComponent)
                     {
                        UIComponent(_loc3_).callLater(removedEffectHandler,[_loc3_,_loc5_,_loc6_,param1]);
                     }
                  }
               }
            }
         }
         else
         {
            createAndPlayEffect(param1,param1.currentTarget);
         }
      }
      
      private static function createAndPlayEffect(param1:Event, param2:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc3_:* = mx_internal::createEffectForType(param2,param1.type);
         if(!_loc3_)
         {
            return;
         }
         if(_loc3_ is Zoom && param1.type == MoveEvent.MOVE)
         {
            _loc9_ = resourceManager.getString("effects","incorrectTrigger");
            throw new Error(_loc9_);
         }
         if(param2.initialized == false)
         {
            if((_loc10_ = param1.type) == MoveEvent.MOVE || _loc10_ == ResizeEvent.RESIZE || _loc10_ == FlexEvent.SHOW || _loc10_ == FlexEvent.HIDE || _loc10_ == Event.CHANGE)
            {
               _loc3_ = null;
               return;
            }
         }
         if(_loc3_.target is IUIComponent)
         {
            if((Boolean(_loc11_ = IUIComponent(_loc3_.target).tweeningProperties)) && _loc11_.length > 0)
            {
               _loc12_ = _loc3_.getAffectedProperties();
               _loc4_ = _loc11_.length;
               _loc6_ = _loc12_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_)
                  {
                     if(_loc11_[_loc5_] == _loc12_[_loc7_])
                     {
                        _loc3_ = null;
                        return;
                     }
                     _loc7_++;
                  }
                  _loc5_++;
               }
            }
         }
         if(_loc3_.target is UIComponent && Boolean(UIComponent(_loc3_.target).mx_internal::isEffectStarted))
         {
            _loc13_ = _loc3_.getAffectedProperties();
            _loc5_ = 0;
            while(_loc5_ < _loc13_.length)
            {
               if((_loc14_ = _loc3_.target.getEffectsForProperty(_loc13_[_loc5_])).length > 0)
               {
                  if(param1.type == ResizeEvent.RESIZE)
                  {
                     return;
                  }
                  _loc7_ = 0;
                  while(_loc7_ < _loc14_.length)
                  {
                     _loc15_ = _loc14_[_loc7_];
                     if(param1.type == FlexEvent.SHOW && _loc15_.mx_internal::hideOnEffectEnd)
                     {
                        _loc15_.target.removeEventListener(FlexEvent.SHOW,_loc15_.mx_internal::eventHandler);
                        _loc15_.mx_internal::hideOnEffectEnd = false;
                     }
                     _loc15_.end();
                     _loc7_++;
                  }
               }
               _loc5_++;
            }
         }
         _loc3_.triggerEvent = param1;
         _loc3_.addEventListener(EffectEvent.EFFECT_END,EffectManager.mx_internal::effectEndHandler);
         mx_internal::lastEffectCreated = _loc3_;
         var _loc8_:Array;
         _loc4_ = (_loc8_ = _loc3_.play()).length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            mx_internal::effectsPlaying.push(new EffectNode(_loc3_,_loc8_[_loc5_]));
            _loc5_++;
         }
         if(_loc3_.suspendBackgroundProcessing)
         {
            UIComponent.suspendBackgroundProcessing();
         }
      }
      
      private static function removedEffectHandler(param1:DisplayObject, param2:DisplayObjectContainer, param3:int, param4:Event) : void
      {
         suspendEventHandling();
         if(param2 is IVisualElementContainer && param1 is IVisualElement)
         {
            IVisualElementContainer(param2).addElementAt(param1 as IVisualElement,param3);
         }
         else
         {
            param2.addChildAt(param1,param3);
         }
         resumeEventHandling();
         createAndPlayEffect(param4,param1);
      }
      
      mx_internal static function effectEndHandler(param1:EffectEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:IEffectInstance = param1.effectInstance;
         var _loc3_:int = 0;
         var _loc4_:int = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            if(mx_internal::effectsPlaying[_loc4_].instance == _loc2_)
            {
               mx_internal::effectsPlaying.splice(_loc4_,1);
               break;
            }
            _loc4_--;
         }
         if(Object(_loc2_).hideOnEffectEnd == true)
         {
            _loc2_.target.removeEventListener(FlexEvent.SHOW,Object(_loc2_).eventHandler);
            _loc2_.target.setVisible(false,true);
         }
         if(Boolean(_loc2_.triggerEvent) && _loc2_.triggerEvent.type == Event.REMOVED)
         {
            if((_loc5_ = _loc2_.target as DisplayObject) != null)
            {
               if((_loc6_ = _loc5_.parent as DisplayObjectContainer) != null)
               {
                  suspendEventHandling();
                  if(_loc6_ is IVisualElementContainer && _loc5_ is IVisualElement)
                  {
                     IVisualElementContainer(_loc6_).removeElement(_loc5_ as IVisualElement);
                  }
                  else
                  {
                     _loc6_.removeChild(_loc5_);
                  }
                  resumeEventHandling();
               }
            }
         }
         if(_loc2_.suspendBackgroundProcessing)
         {
            UIComponent.resumeBackgroundProcessing();
         }
      }
      
      mx_internal static function effectStarted(param1:EffectInstance) : void
      {
         effects[param1] = 1;
      }
      
      mx_internal static function effectFinished(param1:EffectInstance) : void
      {
         delete effects[param1];
      }
      
      mx_internal static function effectsInEffect() : Boolean
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:* = effects;
         for(_loc1_ in _loc3_)
         {
            return true;
         }
         return false;
      }
   }
}

import mx.effects.Effect;
import mx.effects.EffectInstance;

class EffectNode
{
    
   
   public var factory:Effect;
   
   public var instance:EffectInstance;
   
   function EffectNode(param1:Effect, param2:EffectInstance)
   {
      super();
      this.factory = param1;
      this.instance = param2;
   }
}
