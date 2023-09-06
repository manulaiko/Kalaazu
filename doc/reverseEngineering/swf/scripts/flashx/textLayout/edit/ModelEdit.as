package flashx.textLayout.edit
{
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.FlowGroupElement;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.ListItemElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.tlf_internal;
   
   public class ModelEdit
   {
       
      
      public function ModelEdit()
      {
         super();
      }
      
      public static function splitElement(param1:TextFlow, param2:FlowGroupElement, param3:int) : IMemento
      {
         return SplitMemento.perform(param1,param2,param3,true);
      }
      
      public static function joinElement(param1:TextFlow, param2:FlowGroupElement, param3:FlowGroupElement) : IMemento
      {
         return JoinMemento.perform(param1,param2,param3,true);
      }
      
      public static function addElement(param1:TextFlow, param2:FlowElement, param3:FlowGroupElement, param4:int) : IMemento
      {
         return AddElementMemento.perform(param1,param2,param3,param4,true);
      }
      
      public static function moveElement(param1:TextFlow, param2:FlowElement, param3:FlowGroupElement, param4:int) : IMemento
      {
         return MoveElementMemento.perform(param1,param2,param3,param4,true);
      }
      
      public static function removeElements(param1:TextFlow, param2:FlowGroupElement, param3:int, param4:int) : IMemento
      {
         return RemoveElementsMemento.perform(param1,param2,param3,param4,true);
      }
      
      public static function deleteText(param1:TextFlow, param2:int, param3:int, param4:Boolean) : IMemento
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(param3 == param1.textLength - 1)
         {
            _loc8_ = param1.getChildAt(param1.numChildren - 1);
            if(param2 <= _loc8_.getAbsoluteStart())
            {
               param3 = param1.textLength;
            }
         }
         if(param3 >= param1.textLength)
         {
            _loc10_ = (_loc9_ = param1.getLastLeaf()).getParagraph();
            _loc7_ = new ParagraphElement();
            _loc11_ = new SpanElement();
            _loc7_.replaceChildren(0,0,_loc11_);
            _loc7_.format = _loc10_.format;
            _loc11_.format = _loc9_.format;
            param3 = param1.textLength;
         }
         if(param4)
         {
            _loc5_ = new MementoList(param1);
            if(_loc7_)
            {
               _loc5_.push(addElement(param1,_loc7_,param1,param1.numChildren));
            }
            _loc12_ = new DeleteTextMemento(param1,param2,param3);
            _loc5_.push(_loc12_);
            _loc6_ = TextFlowEdit.tlf_internal::deleteRange(param1,param2,param3);
            _loc5_.push(TextFlowEdit.joinNextParagraph(_loc6_,false));
            checkNormalize(param1,_loc12_.commonRoot,_loc5_);
         }
         else
         {
            if(_loc7_)
            {
               param1.replaceChildren(param1.numChildren,param1.numChildren,_loc7_);
            }
            _loc6_ = TextFlowEdit.tlf_internal::deleteRange(param1,param2,param3);
            TextFlowEdit.joinNextParagraph(_loc6_,false);
         }
         if(param1.interactionManager)
         {
            param1.interactionManager.notifyInsertOrDelete(param2,-(param3 - param2));
         }
         return _loc5_;
      }
      
      private static function checkNormalize(param1:TextFlow, param2:FlowGroupElement, param3:MementoList) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param2 is ListItemElement && (param2 as ListItemElement).tlf_internal::normalizeNeedsInitialParagraph())
         {
            (_loc5_ = new ParagraphElement()).replaceChildren(0,0,new SpanElement());
            param3.push(ModelEdit.addElement(param1,_loc5_,param2,0));
         }
         var _loc4_:int = 0;
         while(_loc4_ < param2.numChildren)
         {
            if(_loc6_ = param2.getChildAt(_loc4_) as FlowGroupElement)
            {
               checkNormalize(param1,_loc6_,param3);
            }
            _loc4_++;
         }
      }
      
      public static function saveCurrentState(param1:TextFlow, param2:int, param3:int) : IMemento
      {
         return new TextRangeMemento(param1,param2,param3);
      }
   }
}

import flashx.textLayout.elements.TextFlow;

class BaseMemento
{
    
   
   protected var _textFlow:TextFlow;
   
   function BaseMemento(param1:TextFlow)
   {
      super();
      this._textFlow = param1;
   }
}

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.TextFlow;

class DeleteTextMemento extends BaseMemento implements IMemento
{
    
   
   private var _commonRootMark:ElementMark;
   
   private var _startChildIndex:int;
   
   private var _endChildIndex:int;
   
   private var _originalChildren:Array;
   
   private var _absoluteStart:int;
   
   protected var scrapChildren:Array;
   
   protected var replaceCount:int;
   
   function DeleteTextMemento(param1:TextFlow, param2:int, param3:int)
   {
      var _loc6_:int = 0;
      var _loc7_:* = null;
      var _loc8_:int = 0;
      var _loc9_:* = null;
      var _loc10_:int = 0;
      var _loc11_:* = null;
      super(param1);
      var _loc4_:FlowLeafElement;
      var _loc5_:FlowGroupElement = (_loc4_ = param1.findLeaf(param2)).getParagraph().parent;
      while(Boolean(_loc5_) && (_loc5_.getAbsoluteStart() + _loc5_.textLength < param3 || _loc5_.getAbsoluteStart() == param2 && _loc5_.getAbsoluteStart() + _loc5_.textLength == param3))
      {
         _loc5_ = _loc5_.parent;
      }
      if(_loc5_)
      {
         _loc6_ = _loc5_.getAbsoluteStart();
         this._startChildIndex = _loc5_.findChildIndexAtPosition(param2 - _loc6_);
         this._endChildIndex = _loc5_.findChildIndexAtPosition(param3 - _loc6_ - 1);
         if(this._endChildIndex < 0)
         {
            this._endChildIndex = _loc5_.numChildren - 1;
         }
         _loc8_ = (_loc7_ = _loc5_.getChildAt(this._startChildIndex)).getAbsoluteStart();
         _loc10_ = (_loc9_ = _loc5_.getChildAt(this._endChildIndex)).getAbsoluteStart() + _loc9_.textLength;
         this.replaceCount = 0;
         if(this._startChildIndex == this._endChildIndex)
         {
            if(_loc8_ < param2 || _loc10_ > param3)
            {
               this.replaceCount = 1;
            }
         }
         else
         {
            if(_loc8_ < param2)
            {
               ++this.replaceCount;
            }
            if(_loc10_ > param3)
            {
               ++this.replaceCount;
            }
         }
         _loc11_ = _loc5_.deepCopy(_loc8_ - _loc6_,_loc10_ - _loc6_) as FlowGroupElement;
         this.scrapChildren = _loc11_.mxmlChildren;
      }
      this._commonRootMark = new ElementMark(_loc5_,0);
      this._absoluteStart = param2;
   }
   
   public function undo() : *
   {
      var _loc4_:* = null;
      var _loc1_:FlowGroupElement = this.commonRoot;
      this._originalChildren = [];
      var _loc2_:int = int(this._startChildIndex);
      while(_loc2_ < this._startChildIndex + this.replaceCount)
      {
         this._originalChildren.push(_loc1_.getChildAt(_loc2_));
         _loc2_++;
      }
      var _loc3_:* = [];
      for each(_loc4_ in this.scrapChildren)
      {
         _loc3_.push(_loc4_.deepCopy());
      }
      _loc1_.replaceChildren(this._startChildIndex,this._startChildIndex + this.replaceCount,_loc3_);
   }
   
   public function redo() : *
   {
      this.commonRoot.replaceChildren(this._startChildIndex,this._startChildIndex + this.scrapChildren.length,this._originalChildren);
   }
   
   public function get commonRoot() : FlowGroupElement
   {
      return this._commonRootMark.findElement(_textFlow) as FlowGroupElement;
   }
}

import flashx.textLayout.edit.IMemento;
import flashx.textLayout.elements.TextFlow;

class TextRangeMemento extends DeleteTextMemento implements IMemento
{
    
   
   function TextRangeMemento(param1:TextFlow, param2:int, param3:int)
   {
      super(param1,param2,param3);
      replaceCount = scrapChildren.length;
   }
}

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SubParagraphGroupElementBase;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

class InternalSplitFGEMemento extends BaseMemento implements IMemento
{
    
   
   private var _target:ElementMark;
   
   private var _undoTarget:ElementMark;
   
   private var _newSibling:FlowGroupElement;
   
   private var _skipUndo:Boolean;
   
   function InternalSplitFGEMemento(param1:TextFlow, param2:ElementMark, param3:ElementMark, param4:FlowGroupElement)
   {
      super(param1);
      this._target = param2;
      this._undoTarget = param3;
      this._newSibling = param4;
      this._skipUndo = param4 is SubParagraphGroupElementBase;
   }
   
   public static function perform(param1:TextFlow, param2:FlowElement, param3:int, param4:Boolean) : *
   {
      var _loc7_:* = null;
      var _loc5_:ElementMark = new ElementMark(param2,param3);
      var _loc6_:FlowGroupElement = performInternal(param1,_loc5_);
      if(param4)
      {
         _loc7_ = new ElementMark(_loc6_,0);
         return new InternalSplitFGEMemento(param1,_loc5_,_loc7_,_loc6_);
      }
      return _loc6_;
   }
   
   public static function performInternal(param1:TextFlow, param2:ElementMark) : *
   {
      var _loc6_:* = null;
      var _loc3_:FlowGroupElement = param2.findElement(param1) as FlowGroupElement;
      var _loc4_:int = param2.elemStart == _loc3_.textLength ? _loc3_.numChildren - 1 : _loc3_.findChildIndexAtPosition(param2.elemStart);
      var _loc5_:FlowElement;
      if((_loc5_ = _loc3_.getChildAt(_loc4_)).parentRelativeStart == param2.elemStart)
      {
         _loc6_ = _loc3_.splitAtIndex(_loc4_);
      }
      else
      {
         _loc6_ = _loc3_.splitAtPosition(param2.elemStart) as FlowGroupElement;
      }
      if(_loc3_ is ParagraphElement)
      {
         if(_loc3_.textLength <= 1)
         {
            _loc3_.tlf_internal::normalizeRange(0,_loc3_.textLength);
            _loc3_.getLastLeaf().tlf_internal::quickCloneTextLayoutFormat(_loc6_.getFirstLeaf());
         }
         else if(_loc6_.textLength <= 1)
         {
            _loc6_.tlf_internal::normalizeRange(0,_loc6_.textLength);
            _loc6_.getFirstLeaf().tlf_internal::quickCloneTextLayoutFormat(_loc3_.getLastLeaf());
         }
      }
      return _loc6_;
   }
   
   public function get newSibling() : FlowGroupElement
   {
      return this._newSibling;
   }
   
   public function undo() : *
   {
      if(this._skipUndo)
      {
         return;
      }
      var _loc1_:FlowGroupElement = this._undoTarget.findElement(_textFlow) as FlowGroupElement;
      var _loc2_:FlowGroupElement = _loc1_.getPreviousSibling() as FlowGroupElement;
      _loc1_.parent.removeChild(_loc1_);
      var _loc3_:FlowLeafElement = _loc2_.getLastLeaf();
      _loc2_.replaceChildren(_loc2_.numChildren,_loc2_.numChildren,_loc1_.mxmlChildren);
      if(_loc2_ is ParagraphElement && _loc3_.textLength == 0)
      {
         _loc2_.removeChild(_loc3_);
      }
   }
   
   public function redo() : *
   {
      return performInternal(_textFlow,this._target);
   }
}

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.edit.ModelEdit;
import flashx.textLayout.elements.ContainerFormattedElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.ListItemElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

class SplitMemento extends BaseMemento implements IMemento
{
    
   
   private var _mementoList:Array;
   
   private var _target:ElementMark;
   
   function SplitMemento(param1:TextFlow, param2:ElementMark, param3:Array)
   {
      super(param1);
      this._target = param2;
      this._mementoList = param3;
   }
   
   public static function perform(param1:TextFlow, param2:FlowGroupElement, param3:int, param4:Boolean) : *
   {
      var _loc5_:ElementMark = new ElementMark(param2,param3);
      var _loc6_:* = [];
      var _loc7_:FlowGroupElement = performInternal(param1,_loc5_,param4 ? _loc6_ : null);
      if(param4)
      {
         return new SplitMemento(param1,_loc5_,_loc6_);
      }
      return _loc7_;
   }
   
   private static function testValidLeadingParagraph(param1:FlowGroupElement) : Boolean
   {
      if(param1 is ListItemElement)
      {
         return !(param1 as ListItemElement).tlf_internal::normalizeNeedsInitialParagraph();
      }
      while(Boolean(param1) && !(param1 is ParagraphElement))
      {
         param1 = param1.getChildAt(0) as FlowGroupElement;
      }
      return param1 is ParagraphElement;
   }
   
   public static function performInternal(param1:TextFlow, param2:ElementMark, param3:Array) : FlowGroupElement
   {
      var _loc6_:* = null;
      var _loc8_:* = null;
      var _loc9_:int = 0;
      var _loc10_:* = null;
      var _loc4_:FlowGroupElement = param2.findElement(param1) as FlowGroupElement;
      var _loc5_:FlowGroupElement = (param2.elemStart == _loc4_.textLength ? _loc4_.getLastLeaf() : _loc4_.findLeaf(param2.elemStart)).parent;
      var _loc7_:int = param2.elemStart;
      while(true)
      {
         _loc9_ = _loc7_ - (_loc5_.getAbsoluteStart() - _loc4_.getAbsoluteStart());
         _loc10_ = InternalSplitFGEMemento.perform(param1,_loc5_,_loc9_,true);
         if(param3)
         {
            param3.push(_loc10_);
         }
         _loc6_ = _loc10_.newSibling;
         if(_loc5_ is ParagraphElement && param2.elemStart != _loc4_.textLength)
         {
            _loc7_++;
         }
         else if(_loc5_ is ContainerFormattedElement)
         {
            if(!testValidLeadingParagraph(_loc5_))
            {
               _loc8_ = ModelEdit.addElement(param1,new ParagraphElement(),_loc5_,0);
               if(param3)
               {
                  param3.push(_loc8_);
               }
               _loc7_++;
            }
            if(!testValidLeadingParagraph(_loc6_))
            {
               _loc8_ = ModelEdit.addElement(param1,new ParagraphElement(),_loc6_,0);
               if(param3)
               {
                  param3.push(_loc8_);
               }
            }
         }
         if(_loc5_ == _loc4_)
         {
            break;
         }
         _loc5_ = _loc5_.parent;
      }
      return _loc6_;
   }
   
   public function undo() : *
   {
      var _loc1_:* = null;
      this._mementoList.reverse();
      for each(_loc1_ in this._mementoList)
      {
         _loc1_.undo();
      }
      this._mementoList.reverse();
   }
   
   public function redo() : *
   {
      return performInternal(_textFlow,this._target,null);
   }
}

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.edit.TextFlowEdit;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

class JoinMemento extends BaseMemento implements IMemento
{
    
   
   private var _element1:ElementMark;
   
   private var _element2:ElementMark;
   
   private var _joinPosition:int;
   
   private var _removeParentChain:IMemento;
   
   function JoinMemento(param1:TextFlow, param2:ElementMark, param3:ElementMark, param4:int, param5:IMemento)
   {
      super(param1);
      this._element1 = param2;
      this._element2 = param3;
      this._joinPosition = param4;
      this._removeParentChain = param5;
   }
   
   public static function perform(param1:TextFlow, param2:FlowGroupElement, param3:FlowGroupElement, param4:Boolean) : *
   {
      var _loc5_:int = param2.textLength - 1;
      var _loc6_:ElementMark = new ElementMark(param2,0);
      var _loc7_:ElementMark = new ElementMark(param3,0);
      performInternal(param1,_loc6_,_loc7_);
      var _loc8_:IMemento = TextFlowEdit.tlf_internal::removeEmptyParentChain(param3);
      if(param4)
      {
         return new JoinMemento(param1,_loc6_,_loc7_,_loc5_,_loc8_);
      }
      return null;
   }
   
   public static function performInternal(param1:TextFlow, param2:ElementMark, param3:ElementMark) : void
   {
      var _loc4_:FlowGroupElement = param2.findElement(param1) as FlowGroupElement;
      var _loc5_:FlowGroupElement = param3.findElement(param1) as FlowGroupElement;
      moveChildren(_loc5_,_loc4_);
   }
   
   private static function moveChildren(param1:FlowGroupElement, param2:FlowGroupElement) : void
   {
      var _loc3_:Array = param1.mxmlChildren;
      param1.replaceChildren(0,param1.numChildren);
      param2.replaceChildren(param2.numChildren,param2.numChildren,_loc3_);
   }
   
   public function undo() : *
   {
      this._removeParentChain.undo();
      var _loc1_:FlowGroupElement = this._element1.findElement(_textFlow) as FlowGroupElement;
      var _loc2_:FlowGroupElement = this._element2.findElement(_textFlow) as FlowGroupElement;
      var _loc3_:FlowGroupElement = _loc1_.splitAtPosition(this._joinPosition) as FlowGroupElement;
      moveChildren(_loc3_,_loc2_);
      _loc3_.parent.removeChild(_loc3_);
   }
   
   public function redo() : *
   {
      performInternal(_textFlow,this._element1,this._element2);
      this._removeParentChain.redo();
   }
}

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.TextFlow;

class AddElementMemento extends BaseMemento implements IMemento
{
    
   
   private var _target:ElementMark;
   
   private var _targetIndex:int;
   
   private var _elemToAdd:FlowElement;
   
   function AddElementMemento(param1:TextFlow, param2:FlowElement, param3:ElementMark, param4:int)
   {
      super(param1);
      this._target = param3;
      this._targetIndex = param4;
      this._elemToAdd = param2;
   }
   
   public static function perform(param1:TextFlow, param2:FlowElement, param3:FlowGroupElement, param4:int, param5:Boolean) : *
   {
      var _loc6_:FlowElement = param2;
      if(param5)
      {
         param2 = _loc6_.deepCopy();
      }
      var _loc8_:FlowGroupElement;
      var _loc7_:ElementMark;
      (_loc8_ = (_loc7_ = new ElementMark(param3,0)).findElement(param1) as FlowGroupElement).addChildAt(param4,_loc6_);
      if(param5)
      {
         return new AddElementMemento(param1,param2,_loc7_,param4);
      }
      return null;
   }
   
   public function undo() : *
   {
      var _loc1_:FlowGroupElement = this._target.findElement(_textFlow) as FlowGroupElement;
      _loc1_.removeChildAt(this._targetIndex);
   }
   
   public function redo() : *
   {
      var _loc1_:FlowGroupElement = this._target.findElement(_textFlow) as FlowGroupElement;
      return perform(_textFlow,this._elemToAdd,_loc1_,this._targetIndex,false);
   }
}

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.TextFlow;

class MoveElementMemento extends BaseMemento implements IMemento
{
    
   
   private var _target:ElementMark;
   
   private var _targetIndex:int;
   
   private var _elemBeforeMove:ElementMark;
   
   private var _elemAfterMove:ElementMark;
   
   private var _source:ElementMark;
   
   private var _sourceIndex:int;
   
   function MoveElementMemento(param1:TextFlow, param2:ElementMark, param3:ElementMark, param4:ElementMark, param5:int, param6:ElementMark, param7:int)
   {
      super(param1);
      this._elemBeforeMove = param2;
      this._elemAfterMove = param3;
      this._target = param4;
      this._targetIndex = param5;
      this._source = param6;
      this._sourceIndex = param7;
   }
   
   public static function perform(param1:TextFlow, param2:FlowElement, param3:FlowGroupElement, param4:int, param5:Boolean) : *
   {
      var _loc6_:ElementMark = new ElementMark(param3,0);
      var _loc7_:ElementMark = new ElementMark(param2,0);
      var _loc8_:FlowGroupElement;
      var _loc9_:int = (_loc8_ = param2.parent).getChildIndex(param2);
      var _loc10_:ElementMark = new ElementMark(_loc8_,0);
      param3.addChildAt(param4,param2);
      if(param5)
      {
         return new MoveElementMemento(param1,_loc7_,new ElementMark(param2,0),_loc6_,param4,_loc10_,_loc9_);
      }
      return param2;
   }
   
   public function undo() : *
   {
      var _loc1_:FlowElement = this._elemAfterMove.findElement(_textFlow);
      _loc1_.parent.removeChildAt(_loc1_.parent.getChildIndex(_loc1_));
      var _loc2_:FlowGroupElement = this._source.findElement(_textFlow) as FlowGroupElement;
      _loc2_.addChildAt(this._sourceIndex,_loc1_);
   }
   
   public function redo() : *
   {
      var _loc1_:FlowGroupElement = this._target.findElement(_textFlow) as FlowGroupElement;
      var _loc2_:FlowElement = this._elemBeforeMove.findElement(_textFlow) as FlowElement;
      return perform(_textFlow,_loc2_,_loc1_,this._targetIndex,false);
   }
}

import flashx.textLayout.edit.ElementMark;
import flashx.textLayout.edit.IMemento;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.TextFlow;

class RemoveElementsMemento extends BaseMemento implements IMemento
{
    
   
   private var _elements:Array;
   
   private var _elemParent:ElementMark;
   
   private var _startIndex:int;
   
   private var _numElements:int;
   
   function RemoveElementsMemento(param1:TextFlow, param2:ElementMark, param3:int, param4:int, param5:Array)
   {
      super(param1);
      this._elemParent = param2;
      this._startIndex = param3;
      this._numElements = param4;
      this._elements = param5;
   }
   
   public static function perform(param1:TextFlow, param2:FlowGroupElement, param3:int, param4:int, param5:Boolean) : *
   {
      var _loc6_:ElementMark = new ElementMark(param2,0);
      var _loc7_:Array = param2.mxmlChildren.slice(param3,param3 + param4);
      param2.replaceChildren(param3,param3 + param4);
      if(param5)
      {
         return new RemoveElementsMemento(param1,_loc6_,param3,param4,_loc7_);
      }
      return _loc7_;
   }
   
   public function undo() : *
   {
      var _loc1_:FlowGroupElement = this._elemParent.findElement(_textFlow) as FlowGroupElement;
      _loc1_.replaceChildren(this._startIndex,this._startIndex,this._elements);
      this._elements = null;
      return _loc1_.mxmlChildren.slice(this._startIndex,this._startIndex + this._numElements);
   }
   
   public function redo() : *
   {
      var _loc1_:FlowGroupElement = this._elemParent.findElement(_textFlow) as FlowGroupElement;
      this._elements = perform(_textFlow,_loc1_,this._startIndex,this._numElements,false);
   }
}
