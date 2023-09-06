package flashx.textLayout.compose
{
   import flash.display.Sprite;
   import flash.system.Capabilities;
   import flashx.textLayout.accessibility.TextAccImpl;
   import flashx.textLayout.container.ContainerController;
   import flashx.textLayout.container.ScrollPolicy;
   import flashx.textLayout.edit.ISelectionManager;
   import flashx.textLayout.elements.BackgroundManager;
   import flashx.textLayout.elements.ContainerFormattedElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.events.CompositionCompleteEvent;
   import flashx.textLayout.formats.BlockProgression;
   import flashx.textLayout.tlf_internal;
   
   public class StandardFlowComposer extends FlowComposerBase implements IFlowComposer
   {
       
      
      tlf_internal var _rootElement:ContainerFormattedElement;
      
      private var _controllerList:Array;
      
      private var _composing:Boolean;
      
      private var lastBPDirectionScrollPosition:Number = -Infinity;
      
      public function StandardFlowComposer()
      {
         super();
         this._controllerList = new Array();
         this._composing = false;
      }
      
      private static function clearContainerAccessibilityImplementation(param1:Sprite) : void
      {
         if(param1.accessibilityImplementation)
         {
            if(param1.accessibilityImplementation is TextAccImpl)
            {
               TextAccImpl(param1.accessibilityImplementation).detachListeners();
            }
            param1.accessibilityImplementation = null;
         }
      }
      
      private static function getBPDirectionScrollPosition(param1:String, param2:ContainerController) : Number
      {
         return param1 == BlockProgression.TB ? param2.verticalScrollPosition : param2.horizontalScrollPosition;
      }
      
      public function get composing() : Boolean
      {
         return this._composing;
      }
      
      public function getAbsoluteStart(param1:ContainerController) : int
      {
         var _loc2_:int = this.getControllerIndex(param1);
         var _loc3_:int = this.tlf_internal::_rootElement.getAbsoluteStart();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ += this._controllerList[_loc4_].textLength;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get rootElement() : ContainerFormattedElement
      {
         return this.tlf_internal::_rootElement;
      }
      
      public function setRootElement(param1:ContainerFormattedElement) : void
      {
         if(this.tlf_internal::_rootElement != param1)
         {
            if(param1 is TextFlow && (param1 as TextFlow).flowComposer != this)
            {
               (param1 as TextFlow).flowComposer = this;
            }
            else
            {
               this.tlf_internal::clearCompositionResults();
               this.tlf_internal::detachAllContainers();
               this.tlf_internal::_rootElement = param1;
               _textFlow = !!this.tlf_internal::_rootElement ? this.tlf_internal::_rootElement.getTextFlow() : null;
               this.tlf_internal::attachAllContainers();
            }
         }
      }
      
      tlf_internal function detachAllContainers() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._controllerList.length > 0 && Boolean(_textFlow))
         {
            _loc2_ = this.getControllerAt(0);
            _loc3_ = _loc2_.container;
            if(_loc3_)
            {
               clearContainerAccessibilityImplementation(_loc3_);
            }
         }
         for each(_loc1_ in this._controllerList)
         {
            _loc1_.tlf_internal::clearSelectionShapes();
            _loc1_.tlf_internal::setRootElement(null);
         }
      }
      
      tlf_internal function attachAllContainers() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         for each(_loc1_ in this._controllerList)
         {
            ContainerController(_loc1_).tlf_internal::setRootElement(this.tlf_internal::_rootElement);
         }
         if(this._controllerList.length > 0 && Boolean(_textFlow))
         {
            if(textFlow.configuration.enableAccessibility && false)
            {
               if(_loc4_ = this.getControllerAt(0).container)
               {
                  clearContainerAccessibilityImplementation(_loc4_);
                  _loc4_.accessibilityImplementation = new TextAccImpl(_loc4_,_textFlow);
               }
            }
            _loc3_ = 0;
            while(_loc3_ < this._controllerList.length)
            {
               _loc2_ = this.getControllerAt(_loc3_).container;
               if(_loc2_)
               {
                  _loc2_.focusRect = false;
               }
               _loc3_++;
            }
         }
         this.tlf_internal::clearCompositionResults();
      }
      
      public function get numControllers() : int
      {
         return !!this._controllerList ? this._controllerList.length : 0;
      }
      
      public function addController(param1:ContainerController) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._controllerList.push(ContainerController(param1));
         if(this.numControllers == 1)
         {
            this.tlf_internal::attachAllContainers();
         }
         else
         {
            param1.tlf_internal::setRootElement(this.tlf_internal::_rootElement);
            _loc2_ = param1.container;
            if(_loc2_)
            {
               _loc2_.focusRect = false;
            }
            if(textFlow)
            {
               param1 = this.getControllerAt(this.numControllers - 2);
               _loc3_ = param1.absoluteStart;
               if((_loc4_ = param1.textLength) == 0)
               {
                  if(_loc3_ != textFlow.textLength)
                  {
                     _loc4_++;
                  }
                  else if(_loc3_ != 0)
                  {
                     _loc3_--;
                     _loc4_++;
                  }
               }
               if(_loc4_)
               {
                  textFlow.tlf_internal::damage(_loc3_,_loc4_,FlowDamageType.GEOMETRY,false);
               }
            }
         }
      }
      
      public function addControllerAt(param1:ContainerController, param2:int) : void
      {
         this.tlf_internal::detachAllContainers();
         this._controllerList.splice(param2,0,ContainerController(param1));
         this.tlf_internal::attachAllContainers();
      }
      
      private function fastRemoveController(param1:int) : Boolean
      {
         var _loc3_:* = null;
         if(param1 == -1)
         {
            return true;
         }
         var _loc2_:ContainerController = this._controllerList[param1];
         if(!_loc2_)
         {
            return true;
         }
         if(!_textFlow || _loc2_.absoluteStart == _textFlow.textLength)
         {
            if(param1 == 0)
            {
               _loc3_ = _loc2_.container;
               if(_loc3_)
               {
                  clearContainerAccessibilityImplementation(_loc3_);
               }
            }
            _loc2_.tlf_internal::setRootElement(null);
            this._controllerList.splice(param1,1);
            return true;
         }
         return false;
      }
      
      public function removeController(param1:ContainerController) : void
      {
         var _loc2_:int = this.getControllerIndex(param1);
         if(!this.fastRemoveController(_loc2_))
         {
            this.tlf_internal::detachAllContainers();
            this._controllerList.splice(_loc2_,1);
            this.tlf_internal::attachAllContainers();
         }
      }
      
      public function removeControllerAt(param1:int) : void
      {
         if(!this.fastRemoveController(param1))
         {
            this.tlf_internal::detachAllContainers();
            this._controllerList.splice(param1,1);
            this.tlf_internal::attachAllContainers();
         }
      }
      
      public function removeAllControllers() : void
      {
         this.tlf_internal::detachAllContainers();
         this._controllerList.splice(0,this._controllerList.length);
      }
      
      public function getControllerAt(param1:int) : ContainerController
      {
         return this._controllerList[param1];
      }
      
      public function getControllerIndex(param1:ContainerController) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._controllerList.length)
         {
            if(this._controllerList[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function findControllerIndexAtPosition(param1:int, param2:Boolean = false) : int
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = this._controllerList.length - 1;
         while(_loc3_ <= _loc4_)
         {
            _loc5_ = (_loc3_ + _loc4_) / 2;
            if((_loc6_ = this._controllerList[_loc5_]).absoluteStart <= param1)
            {
               if(param2)
               {
                  if(_loc6_.absoluteStart + _loc6_.textLength >= param1)
                  {
                     while(_loc5_ != 0 && _loc6_.absoluteStart == param1)
                     {
                        _loc5_--;
                        _loc6_ = this._controllerList[_loc5_];
                     }
                     return _loc5_;
                  }
               }
               else
               {
                  if(_loc6_.absoluteStart == param1 && _loc6_.textLength != 0)
                  {
                     while(_loc5_ != 0)
                     {
                        if((_loc6_ = this._controllerList[_loc5_ - 1]).textLength != 0)
                        {
                           break;
                        }
                        _loc5_--;
                     }
                     return _loc5_;
                  }
                  if(_loc6_.absoluteStart + _loc6_.textLength > param1)
                  {
                     return _loc5_;
                  }
               }
               _loc3_ = _loc5_ + 1;
            }
            else
            {
               _loc4_ = _loc5_ - 1;
            }
         }
         return -1;
      }
      
      tlf_internal function clearCompositionResults() : void
      {
         var _loc1_:* = null;
         initializeLines();
         for each(_loc1_ in this._controllerList)
         {
            _loc1_.tlf_internal::clearCompositionResults();
         }
      }
      
      public function updateAllControllers() : Boolean
      {
         return this.updateToController();
      }
      
      public function updateToController(param1:int = 2147483647) : Boolean
      {
         if(this._composing)
         {
            return false;
         }
         var _loc2_:ISelectionManager = textFlow.interactionManager;
         if(_loc2_)
         {
            _loc2_.flushPendingOperations();
         }
         this.internalCompose(-1,param1);
         var _loc3_:Boolean = this.tlf_internal::areShapesDamaged();
         if(_loc3_)
         {
            this.updateCompositionShapes();
         }
         if(_loc2_)
         {
            _loc2_.refreshSelection();
         }
         return _loc3_;
      }
      
      public function setFocus(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:int = this.findControllerIndexAtPosition(param1,param2);
         if(_loc3_ == -1)
         {
            _loc3_ = this.numControllers - 1;
         }
         if(_loc3_ != -1)
         {
            this._controllerList[_loc3_].setFocus();
         }
      }
      
      public function interactionManagerChanged(param1:ISelectionManager) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._controllerList)
         {
            _loc2_.tlf_internal::interactionManagerChanged(param1);
         }
      }
      
      private function updateCompositionShapes() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._controllerList)
         {
            _loc1_.tlf_internal::updateCompositionShapes();
         }
      }
      
      override public function isDamaged(param1:int) : Boolean
      {
         var _loc2_:* = null;
         if(!super.isDamaged(param1))
         {
            if(param1 == _textFlow.textLength)
            {
               _loc2_ = this.getControllerAt(this.numControllers - 1);
               if(Boolean(_loc2_) && (_loc2_.verticalScrollPolicy != ScrollPolicy.OFF || _loc2_.horizontalScrollPolicy != ScrollPolicy.OFF))
               {
                  return true;
               }
            }
            return false;
         }
         return true;
      }
      
      protected function preCompose() : Boolean
      {
         this.rootElement.tlf_internal::preCompose();
         if(numLines == 0)
         {
            initializeLines();
         }
         return this.isDamaged(this.rootElement.getAbsoluteStart() + this.rootElement.textLength);
      }
      
      tlf_internal function getComposeState() : ComposeState
      {
         return ComposeState.tlf_internal::getComposeState();
      }
      
      tlf_internal function releaseComposeState(param1:ComposeState) : void
      {
         ComposeState.tlf_internal::releaseComposeState(param1);
      }
      
      tlf_internal function callTheComposer(param1:int, param2:int) : ContainerController
      {
         if(_damageAbsoluteStart == this.rootElement.getAbsoluteStart() + this.rootElement.textLength)
         {
            return this.getControllerAt(this.numControllers - 1);
         }
         var _loc3_:ComposeState = this.tlf_internal::getComposeState();
         var _loc4_:int = _loc3_.composeTextFlow(textFlow,param1,param2);
         if(_damageAbsoluteStart < _loc4_)
         {
            _damageAbsoluteStart = _loc4_;
         }
         finalizeLinesAfterCompose();
         var _loc5_:ContainerController = _loc3_.startController;
         this.tlf_internal::releaseComposeState(_loc3_);
         if(textFlow.hasEventListener(CompositionCompleteEvent.COMPOSITION_COMPLETE))
         {
            textFlow.dispatchEvent(new CompositionCompleteEvent(CompositionCompleteEvent.COMPOSITION_COMPLETE,false,false,textFlow,0,_loc4_));
         }
         return _loc5_;
      }
      
      private function internalCompose(param1:int = -1, param2:int = -1) : ContainerController
      {
         var bp:String = null;
         var startController:ContainerController = null;
         var damageLimit:int = 0;
         var controller:ContainerController = null;
         var lastVisibleLine:TextFlowLine = null;
         var idx:int = 0;
         var composeToPosition:int = param1;
         var composeToControllerIndex:int = param2;
         var sm:ISelectionManager = textFlow.interactionManager;
         if(sm)
         {
            sm.flushPendingOperations();
         }
         this._composing = true;
         try
         {
            if(this.preCompose())
            {
               if(Boolean(textFlow) && this.numControllers != 0)
               {
                  damageLimit = 0;
                  composeToControllerIndex = Math.min(composeToControllerIndex,this.numControllers - 1);
                  if(composeToPosition != -1 || composeToControllerIndex != -1)
                  {
                     if(composeToControllerIndex < 0)
                     {
                        if(composeToPosition >= 0)
                        {
                           damageLimit = composeToPosition;
                        }
                     }
                     else
                     {
                        controller = this.getControllerAt(composeToControllerIndex);
                        if(controller.textLength != 0)
                        {
                           damageLimit = controller.absoluteStart + controller.textLength;
                        }
                        if(composeToControllerIndex == this.numControllers - 1)
                        {
                           bp = this.rootElement.computedFormat.blockProgression;
                           lastVisibleLine = controller.tlf_internal::getLastVisibleLine();
                           if(Boolean(lastVisibleLine) && getBPDirectionScrollPosition(bp,controller) == this.lastBPDirectionScrollPosition)
                           {
                              damageLimit = lastVisibleLine.absoluteStart + lastVisibleLine.textLength;
                           }
                        }
                     }
                  }
                  this.lastBPDirectionScrollPosition = Number.NEGATIVE_INFINITY;
                  if(_damageAbsoluteStart < damageLimit)
                  {
                     startController = this.tlf_internal::callTheComposer(composeToPosition,composeToControllerIndex);
                     if(startController)
                     {
                        idx = this.getControllerIndex(startController);
                        while(idx < this.numControllers)
                        {
                           this.getControllerAt(idx++).tlf_internal::shapesInvalid = true;
                        }
                     }
                  }
               }
            }
         }
         catch(e:Error)
         {
            _composing = false;
            throw e;
         }
         this._composing = false;
         if(composeToControllerIndex == this.numControllers - 1)
         {
            this.lastBPDirectionScrollPosition = getBPDirectionScrollPosition(bp,controller);
         }
         return startController;
      }
      
      tlf_internal function areShapesDamaged() : Boolean
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._controllerList)
         {
            if(_loc1_.tlf_internal::shapesInvalid)
            {
               return true;
            }
         }
         return false;
      }
      
      public function compose() : Boolean
      {
         return this._composing ? false : this.internalCompose() != null;
      }
      
      public function composeToPosition(param1:int = 2147483647) : Boolean
      {
         return this._composing ? false : this.internalCompose(param1,-1) != null;
      }
      
      public function composeToController(param1:int = 2147483647) : Boolean
      {
         return this._composing ? false : this.internalCompose(-1,param1) != null;
      }
      
      tlf_internal function createBackgroundManager() : BackgroundManager
      {
         return new BackgroundManager();
      }
   }
}
