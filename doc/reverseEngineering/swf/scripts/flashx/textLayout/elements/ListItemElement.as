package flashx.textLayout.elements
{
   import flashx.textLayout.formats.IListMarkerFormat;
   import flashx.textLayout.tlf_internal;
   
   public final class ListItemElement extends ContainerFormattedElement
   {
       
      
      tlf_internal var _listNumberHint:int = 2147483647;
      
      public function ListItemElement()
      {
         super();
      }
      
      override protected function get abstract() : Boolean
      {
         return false;
      }
      
      override tlf_internal function get defaultTypeName() : String
      {
         return "li";
      }
      
      tlf_internal function computedListMarkerFormat() : IListMarkerFormat
      {
         var _loc2_:* = null;
         var _loc1_:IListMarkerFormat = this.tlf_internal::getUserStyleWorker(ListElement.tlf_internal::LIST_MARKER_FORMAT_NAME) as IListMarkerFormat;
         if(_loc1_ == null)
         {
            _loc2_ = this.getTextFlow();
            if(_loc2_)
            {
               _loc1_ = _loc2_.configuration.defaultListMarkerFormat;
            }
         }
         return _loc1_;
      }
      
      tlf_internal function normalizeNeedsInitialParagraph() : Boolean
      {
         var _loc1_:* = {};
         while(_loc1_)
         {
            _loc1_ = _loc1_.getChildAt(0) as FlowGroupElement;
            if(_loc1_ is ParagraphElement)
            {
               return false;
            }
            if(!(_loc1_ is DivElement))
            {
               return true;
            }
         }
         return true;
      }
      
      override tlf_internal function normalizeRange(param1:uint, param2:uint) : void
      {
         var _loc3_:* = null;
         super.tlf_internal::normalizeRange(param1,param2);
         this.tlf_internal::_listNumberHint = int.MAX_VALUE;
         if(this.tlf_internal::normalizeNeedsInitialParagraph())
         {
            _loc3_ = new ParagraphElement();
            _loc3_.replaceChildren(0,0,new SpanElement());
            replaceChildren(0,0,_loc3_);
            _loc3_.tlf_internal::normalizeRange(0,_loc3_.textLength);
         }
      }
      
      tlf_internal function getListItemNumber(param1:IListMarkerFormat = null) : int
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(this.tlf_internal::_listNumberHint == int.MAX_VALUE)
         {
            if(param1 == null)
            {
               param1 = this.tlf_internal::computedListMarkerFormat();
            }
            _loc2_ = param1.counterReset;
            if(Boolean(_loc2_) && _loc2_.hasOwnProperty("ordered"))
            {
               this.tlf_internal::_listNumberHint = _loc2_.ordered;
            }
            else
            {
               _loc4_ = parent.getChildIndex(this);
               this.tlf_internal::_listNumberHint = 0;
               while(_loc4_ > 0)
               {
                  _loc4_--;
                  if(_loc5_ = parent.getChildAt(_loc4_) as ListItemElement)
                  {
                     this.tlf_internal::_listNumberHint = _loc5_.tlf_internal::getListItemNumber();
                     break;
                  }
               }
            }
            _loc3_ = param1.counterIncrement;
            this.tlf_internal::_listNumberHint += Boolean(_loc3_) && _loc3_.hasOwnProperty("ordered") ? _loc3_.ordered : 1;
         }
         return this.tlf_internal::_listNumberHint;
      }
   }
}
