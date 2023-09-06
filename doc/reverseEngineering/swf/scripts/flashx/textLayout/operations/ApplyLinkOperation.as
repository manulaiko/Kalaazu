package flashx.textLayout.operations
{
   import flashx.textLayout.edit.IMemento;
   import flashx.textLayout.edit.ModelEdit;
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.edit.TextFlowEdit;
   import flashx.textLayout.elements.FlowLeafElement;
   import flashx.textLayout.elements.LinkElement;
   
   public class ApplyLinkOperation extends FlowTextOperation
   {
       
      
      private var _hrefString:String;
      
      private var _target:String;
      
      private var _extendToLinkBoundary:Boolean;
      
      private var _memento:IMemento;
      
      private var _linkElement:LinkElement;
      
      public function ApplyLinkOperation(param1:SelectionState, param2:String, param3:String, param4:Boolean)
      {
         super(param1);
         this._hrefString = param2;
         this._target = param3;
         this._extendToLinkBoundary = param4;
      }
      
      public function get href() : String
      {
         return this._hrefString;
      }
      
      public function set href(param1:String) : void
      {
         this._hrefString = param1;
      }
      
      public function get target() : String
      {
         return this._target;
      }
      
      public function set target(param1:String) : void
      {
         this._target = param1;
      }
      
      public function get extendToLinkBoundary() : Boolean
      {
         return this._extendToLinkBoundary;
      }
      
      public function set extendToLinkBoundary(param1:Boolean) : void
      {
         this._extendToLinkBoundary = param1;
      }
      
      public function get newLinkElement() : LinkElement
      {
         return this._linkElement;
      }
      
      override public function doOperation() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         if(absoluteStart == absoluteEnd)
         {
            return false;
         }
         if(this._extendToLinkBoundary)
         {
            _loc1_ = textFlow.findLeaf(absoluteStart);
            _loc2_ = _loc1_.getParentByType(LinkElement) as LinkElement;
            if(_loc2_)
            {
               absoluteStart = _loc2_.getAbsoluteStart();
            }
            _loc1_ = textFlow.findLeaf(absoluteEnd - 1);
            _loc2_ = _loc1_.getParentByType(LinkElement) as LinkElement;
            if(_loc2_)
            {
               absoluteEnd = _loc2_.getAbsoluteStart() + _loc2_.textLength;
            }
         }
         this._memento = ModelEdit.saveCurrentState(textFlow,absoluteStart,absoluteEnd);
         if(Boolean(this._hrefString) && this._hrefString != "")
         {
            _loc3_ = TextFlowEdit.makeLink(textFlow,absoluteStart,absoluteEnd,this._hrefString,this._target);
            if(!_loc3_)
            {
               this._memento = null;
               return false;
            }
            _loc1_ = textFlow.findLeaf(absoluteStart);
            this._linkElement = _loc1_.getParentByType(LinkElement) as LinkElement;
         }
         else
         {
            TextFlowEdit.removeLink(textFlow,absoluteStart,absoluteEnd);
         }
         return true;
      }
      
      override public function undo() : SelectionState
      {
         if(this._memento)
         {
            this._memento.undo();
         }
         return originalSelectionState;
      }
      
      override public function redo() : SelectionState
      {
         if(absoluteStart != absoluteEnd && Boolean(this._memento))
         {
            if(this._hrefString != "")
            {
               TextFlowEdit.makeLink(textFlow,absoluteStart,absoluteEnd,this._hrefString,this._target);
            }
            else
            {
               TextFlowEdit.removeLink(textFlow,absoluteStart,absoluteEnd);
            }
         }
         return originalSelectionState;
      }
   }
}
