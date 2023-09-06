package flashx.textLayout.edit
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.IME;
   import flash.text.engine.TextLine;
   import flash.text.ime.CompositionAttributeRange;
   import flash.text.ime.IIMEClient;
   import flashx.textLayout.compose.IFlowComposer;
   import flashx.textLayout.compose.TextFlowLine;
   import flashx.textLayout.container.ContainerController;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.elements.TextRange;
   import flashx.textLayout.formats.BlockProgression;
   import flashx.textLayout.formats.IMEStatus;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.formats.TextLayoutFormat;
   import flashx.textLayout.operations.ApplyFormatToElementOperation;
   import flashx.textLayout.operations.FlowOperation;
   import flashx.textLayout.operations.InsertTextOperation;
   import flashx.textLayout.tlf_internal;
   import flashx.textLayout.utils.GeometryUtil;
   import flashx.undo.UndoManager;
   
   class IMEClient implements IIMEClient
   {
       
      
      private var _editManager:EditManager;
      
      private var _undoManager:UndoManager;
      
      private var _imeAnchorPosition:int;
      
      private var _imeLength:int;
      
      private var _controller:ContainerController;
      
      private var _closing:Boolean;
      
      function IMEClient(param1:EditManager)
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         super();
         this._editManager = param1;
         this._imeAnchorPosition = this._editManager.absoluteStart;
         if(this._editManager.textFlow)
         {
            _loc2_ = this._editManager.textFlow.flowComposer;
            if(_loc2_)
            {
               _loc3_ = _loc2_.findControllerIndexAtPosition(this._imeAnchorPosition);
               this._controller = _loc2_.getControllerAt(_loc3_);
               if(this._controller)
               {
                  this._controller.tlf_internal::setFocus();
               }
            }
         }
         this._closing = false;
         if(this._editManager.undoManager == null)
         {
            this._undoManager = new UndoManager();
            this._editManager.tlf_internal::setUndoManager(this._undoManager);
         }
      }
      
      public function selectionChanged() : void
      {
         if(this._editManager.absoluteStart > this._imeAnchorPosition + this._imeLength || this._editManager.absoluteEnd < this._imeAnchorPosition)
         {
            this.compositionAbandoned();
         }
      }
      
      private function doIMEClauseOperation(param1:SelectionState, param2:int) : void
      {
         var _loc3_:FlowLeafElement = this._editManager.textFlow.findLeaf(param1.absoluteStart);
         var _loc4_:int = _loc3_.getAbsoluteStart();
         var _loc5_:TextLayoutFormat;
         (_loc5_ = new TextLayoutFormat()).setStyle(IMEStatus.IME_CLAUSE,param2.toString());
         this._editManager.doOperation(new ApplyFormatToElementOperation(param1,_loc3_,_loc5_,param1.absoluteStart - _loc4_,param1.absoluteEnd - _loc4_));
      }
      
      private function doIMEStatusOperation(param1:SelectionState, param2:CompositionAttributeRange) : void
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            _loc3_ = "null";
         }
         else if(!param2.converted)
         {
            if(!param2.selected)
            {
               _loc3_ = "null";
            }
            else
            {
               _loc3_ = "null";
            }
         }
         else if(!param2.selected)
         {
            _loc3_ = "null";
         }
         else
         {
            _loc3_ = "null";
         }
         var _loc4_:FlowLeafElement;
         var _loc5_:int = (_loc4_ = this._editManager.textFlow.findLeaf(param1.absoluteStart)).getAbsoluteStart();
         var _loc6_:TextLayoutFormat;
         (_loc6_ = new TextLayoutFormat()).setStyle(IMEStatus.IME_STATUS,_loc3_);
         this._editManager.doOperation(new ApplyFormatToElementOperation(param1,_loc4_,_loc6_,param1.absoluteStart - _loc5_,param1.absoluteEnd - _loc5_));
      }
      
      private function deleteIMEText(param1:TextFlow) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:FlowLeafElement = param1.getFirstLeaf();
         while(_loc2_)
         {
            if(_loc2_.getStyle(IMEStatus.IME_STATUS) !== undefined || _loc2_.getStyle(IMEStatus.IME_CLAUSE) !== undefined)
            {
               _loc3_ = new TextLayoutFormat(_loc2_.format);
               _loc3_.setStyle(IMEStatus.IME_STATUS,undefined);
               _loc3_.setStyle(IMEStatus.IME_CLAUSE,undefined);
               _loc2_.format = _loc3_;
               _loc4_ = _loc2_.getAbsoluteStart();
               ModelEdit.deleteText(param1,_loc4_,_loc4_ + _loc2_.textLength,false);
               _loc2_ = param1.findLeaf(_loc4_);
            }
            else
            {
               _loc2_ = _loc2_.getNextLeaf();
            }
         }
      }
      
      private function rollBackIMEChanges() : void
      {
         var _loc1_:FlowOperation = this._editManager.undoManager.peekUndo() as FlowOperation;
         if(this._imeLength > 0 && _loc1_ && _loc1_.endGeneration == this._editManager.textFlow.generation && _loc1_.canUndo())
         {
            if(this._editManager.undoManager)
            {
               this._editManager.undoManager.undo();
            }
            this._editManager.undoManager.popRedo();
         }
         else
         {
            this._editManager.undoManager.popUndo();
            this.deleteIMEText(this._editManager.textFlow);
         }
         this._imeLength = 0;
      }
      
      public function updateComposition(param1:String, param2:Vector.<CompositionAttributeRange>, param3:int, param4:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(this._imeLength > 0)
         {
            this.rollBackIMEChanges();
         }
         if(param1.length > 0)
         {
            _loc5_ = this._editManager.getSelectionState().pointFormat;
            _loc6_ = new SelectionState(this._editManager.textFlow,this._imeAnchorPosition,this._imeAnchorPosition + this._imeLength,_loc5_);
            this._editManager.tlf_internal::beginIMEOperation();
            if(this._editManager.absoluteStart != this._editManager.absoluteEnd)
            {
               this._editManager.deleteText();
            }
            _loc7_ = new InsertTextOperation(_loc6_,param1);
            this._imeLength = param1.length;
            this._editManager.doOperation(_loc7_);
            if(Boolean(param2) && param2.length > 0)
            {
               _loc10_ = param2.length;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  _loc12_ = param2[_loc11_];
                  _loc13_ = new SelectionState(this._editManager.textFlow,this._imeAnchorPosition + _loc12_.relativeStart,this._imeAnchorPosition + _loc12_.relativeEnd);
                  this.doIMEClauseOperation(_loc13_,_loc11_);
                  this.doIMEStatusOperation(_loc13_,_loc12_);
                  _loc11_++;
               }
            }
            else
            {
               _loc13_ = new SelectionState(this._editManager.textFlow,this._imeAnchorPosition,this._imeAnchorPosition + this._imeLength,_loc5_);
               this.doIMEClauseOperation(_loc13_,0);
               this.doIMEStatusOperation(_loc13_,null);
            }
            _loc8_ = this._imeAnchorPosition + param3;
            _loc9_ = this._imeAnchorPosition + param4;
            if(this._editManager.absoluteStart != _loc8_ || this._editManager.absoluteEnd != _loc9_)
            {
               this._editManager.selectRange(this._imeAnchorPosition + param3,this._imeAnchorPosition + param4);
            }
            this._editManager.tlf_internal::endIMEOperation();
         }
      }
      
      public function confirmComposition(param1:String = null, param2:Boolean = false) : void
      {
         this.endIMESession();
      }
      
      public function compositionAbandoned() : void
      {
         var _loc1_:Function = IME["compositionAbandoned"];
         if(IME["compositionAbandoned"] !== undefined)
         {
            _loc1_();
         }
      }
      
      private function endIMESession() : void
      {
         if(!this._editManager || this._closing)
         {
            return;
         }
         this._closing = true;
         if(this._imeLength > 0)
         {
            this.rollBackIMEChanges();
         }
         if(this._undoManager)
         {
            this._editManager.tlf_internal::setUndoManager(null);
         }
         this._editManager.tlf_internal::endIMESession();
         this._editManager = null;
      }
      
      public function getTextBounds(param1:int, param2:int) : Rectangle
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         if(param1 >= 0 && param1 < this._editManager.textFlow.textLength && param2 >= 0 && param2 < this._editManager.textFlow.textLength)
         {
            if(param1 != param2)
            {
               _loc3_ = GeometryUtil.getHighlightBounds(new TextRange(this._editManager.textFlow,param1,param2));
               if(_loc3_.length > 0)
               {
                  _loc4_ = _loc3_[0].rect;
                  _loc6_ = (_loc5_ = _loc3_[0].textLine).localToGlobal(_loc4_.topLeft);
                  _loc7_ = _loc5_.localToGlobal(_loc4_.bottomRight);
                  if(_loc5_.parent)
                  {
                     _loc8_ = _loc5_.parent.globalToLocal(_loc6_);
                     _loc9_ = _loc5_.parent.globalToLocal(_loc7_);
                     return new Rectangle(_loc8_.x,_loc8_.y,_loc9_.x - _loc8_.x,_loc9_.y - _loc8_.y);
                  }
               }
            }
            else
            {
               if((_loc11_ = (_loc10_ = this._editManager.textFlow.flowComposer).findLineIndexAtPosition(param1)) == _loc10_.numLines)
               {
                  _loc11_--;
               }
               if(_loc10_.getLineAt(_loc11_).controller == this._controller)
               {
                  _loc12_ = _loc10_.getLineAt(_loc11_);
                  _loc13_ = _loc11_ != 0 ? _loc10_.getLineAt(_loc11_ - 1) : null;
                  _loc14_ = _loc11_ != _loc10_.numLines - 1 ? _loc10_.getLineAt(_loc11_ + 1) : null;
                  return _loc12_.tlf_internal::computePointSelectionRectangle(param1,this._controller.container,_loc13_,_loc14_,true);
               }
            }
         }
         return new Rectangle(0,0,0,0);
      }
      
      public function get compositionStartIndex() : int
      {
         return this._imeAnchorPosition;
      }
      
      public function get compositionEndIndex() : int
      {
         return this._imeAnchorPosition + this._imeLength;
      }
      
      public function get verticalTextLayout() : Boolean
      {
         return this._editManager.textFlow.computedFormat.blockProgression == BlockProgression.RL;
      }
      
      public function get selectionActiveIndex() : int
      {
         return this._editManager.activePosition;
      }
      
      public function get selectionAnchorIndex() : int
      {
         return this._editManager.anchorPosition;
      }
      
      public function selectRange(param1:int, param2:int) : void
      {
         this._editManager.selectRange(param1,param2);
      }
      
      public function setFocus() : void
      {
         if(this._controller && this._controller.container && this._controller.container.stage && this._controller.container.stage.focus != this._controller.container)
         {
            this._controller.tlf_internal::setFocus();
         }
      }
      
      public function getTextInRange(param1:int, param2:int) : String
      {
         var _loc4_:int = 0;
         var _loc3_:TextFlow = this._editManager.textFlow;
         if(param1 < -1 || param2 < -1 || param1 > _loc3_.textLength - 1 || param2 > _loc3_.textLength - 1)
         {
            return null;
         }
         if(param2 < param1)
         {
            _loc4_ = param2;
            param2 = param1;
            param1 = _loc4_;
         }
         if(param1 == -1)
         {
            param1 = 0;
         }
         return _loc3_.getText(param1,param2);
      }
   }
}
