package spark.components.supportClasses
{
   import flash.events.Event;
   import flash.events.EventPhase;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import mx.collections.IList;
   import mx.core.ISelectableList;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.managers.IFocusManagerComponent;
   import spark.components.ButtonBarButton;
   import spark.components.IItemRenderer;
   import spark.events.IndexChangeEvent;
   import spark.events.RendererExistenceEvent;
   
   public class ButtonBarBase extends ListBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      private var enableFocusHighlight:Boolean = true;
      
      private var inCollectionChangeHandler:Boolean = false;
      
      private var inKeyUpHandler:Boolean = false;
      
      private var pressedIndex:Number;
      
      private var _iconField:String = "icon";
      
      private var iconFieldOrFunctionChanged:Boolean;
      
      private var _iconFunction:Function;
      
      private var requireSelectionChanged:Boolean;
      
      public function ButtonBarBase()
      {
         super();
         tabChildren = false;
         tabEnabled = true;
         tabFocusEnabled = true;
         mx_internal::setCurrentCaretIndex(0);
      }
      
      override public function set dataProvider(param1:IList) : void
      {
         if(dataProvider is ISelectableList)
         {
            dataProvider.removeEventListener(FlexEvent.VALUE_COMMIT,this.dataProvider_changeHandler);
            dataProvider.removeEventListener(IndexChangedEvent.CHANGE,this.dataProvider_changeHandler);
         }
         if(param1 is ISelectableList)
         {
            param1.addEventListener(FlexEvent.VALUE_COMMIT,this.dataProvider_changeHandler,false,0,true);
            param1.addEventListener(IndexChangedEvent.CHANGE,this.dataProvider_changeHandler,false,0,true);
         }
         super.dataProvider = param1;
         if(param1 is ISelectableList)
         {
            selectedIndex = ISelectableList(dataProvider).selectedIndex;
         }
      }
      
      public function get iconField() : String
      {
         return this._iconField;
      }
      
      public function set iconField(param1:String) : void
      {
         if(param1 == this._iconField)
         {
            return;
         }
         this._iconField = param1;
         this.iconFieldOrFunctionChanged = true;
         invalidateProperties();
      }
      
      public function get iconFunction() : Function
      {
         return this._iconFunction;
      }
      
      public function set iconFunction(param1:Function) : void
      {
         if(param1 == this._iconFunction)
         {
            return;
         }
         this._iconFunction = param1;
         this.iconFieldOrFunctionChanged = true;
         invalidateProperties();
      }
      
      override public function set requireSelection(param1:Boolean) : void
      {
         if(param1 == requireSelection)
         {
            return;
         }
         super.requireSelection = param1;
         this.requireSelectionChanged = true;
         invalidateProperties();
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            ButtonBarBase.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override protected function dataProvider_collectionChangeHandler(param1:Event) : void
      {
         this.inCollectionChangeHandler = true;
         super.dataProvider_collectionChangeHandler(param1);
         this.inCollectionChangeHandler = false;
      }
      
      override protected function adjustSelection(param1:int, param2:Boolean = false) : void
      {
         if(this.inCollectionChangeHandler && dataProvider is ISelectableList)
         {
            return;
         }
         super.adjustSelection(param1,param2);
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         super.commitProperties();
         if(this.requireSelectionChanged && Boolean(dataGroup))
         {
            this.requireSelectionChanged = false;
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = dataGroup.getElementAt(_loc2_) as ButtonBarButton;
               if(_loc3_)
               {
                  _loc3_.allowDeselection = !requireSelection;
               }
               _loc2_++;
            }
         }
         if(this.iconFieldOrFunctionChanged)
         {
            this.updateRendererIcons();
            this.iconFieldOrFunctionChanged = false;
         }
         this.enableFocusHighlight = true;
      }
      
      private function getItemRenderer(param1:int) : IVisualElement
      {
         if(!dataGroup || param1 < 0 || param1 >= dataGroup.numElements)
         {
            return null;
         }
         return dataGroup.getElementAt(param1);
      }
      
      override protected function itemShowingCaret(param1:int, param2:Boolean) : void
      {
         var _loc4_:Boolean = false;
         super.itemShowingCaret(param1,param2);
         var _loc3_:IVisualElement = this.getItemRenderer(param1);
         if(_loc3_)
         {
            _loc4_ = Boolean(focusManager) && focusManager.getFocus() == this;
            _loc3_.depth = param2 ? 1 : 0;
            if(_loc3_ is IItemRenderer)
            {
               IItemRenderer(_loc3_).showsCaret = param2 && this.enableFocusHighlight && _loc4_;
            }
         }
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         var _loc2_:IVisualElement = this.getItemRenderer(caretIndex);
         if(_loc2_)
         {
            _loc2_.depth = param1 ? 1 : 0;
            if(_loc2_ is IItemRenderer)
            {
               IItemRenderer(_loc2_).showsCaret = param1;
            }
         }
      }
      
      override protected function itemSelected(param1:int, param2:Boolean) : void
      {
         super.itemSelected(param1,param2);
         var _loc3_:IItemRenderer = this.getItemRenderer(param1) as IItemRenderer;
         if(_loc3_)
         {
            if(param2)
            {
               mx_internal::setCurrentCaretIndex(param1);
            }
            _loc3_.selected = param2;
         }
         if(dataProvider is ISelectableList && param2)
         {
            ISelectableList(dataProvider).selectedIndex = param1;
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         if(!param1 || param1 == "styleName" || param1 == "iconPlacement")
         {
            this.iconFieldOrFunctionChanged = true;
            invalidateProperties();
         }
         super.styleChanged(param1);
      }
      
      override public function updateRenderer(param1:IVisualElement, param2:int, param3:Object) : void
      {
         this.itemToIcon(param1,param3);
         super.updateRenderer(param1,param2,param3);
      }
      
      private function itemToIcon(param1:IVisualElement, param2:Object) : void
      {
         if(!(param1 is ButtonBase))
         {
            return;
         }
         var _loc3_:String = getStyle("iconPlacement");
         if(_loc3_)
         {
            ButtonBase(param1).setStyle("iconPlacement",_loc3_);
         }
         if(this._iconFunction != null)
         {
            ButtonBase(param1).setStyle("icon",this._iconFunction(param2));
            return;
         }
         if(this._iconField && this._iconField.length > 0 && param2 is Object)
         {
            try
            {
               if(param2[this._iconField] != null)
               {
                  ButtonBase(param1).setStyle("icon",param2[this._iconField]);
                  return;
               }
            }
            catch(e:Error)
            {
            }
         }
         ButtonBase(param1).clearStyle("icon");
      }
      
      private function updateRendererIcons() : void
      {
         var _loc3_:* = null;
         if(!dataGroup)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = dataGroup.getElementAt(_loc2_) as IItemRenderer;
            if(Boolean(_loc3_) && Boolean(_loc3_.data))
            {
               this.itemToIcon(_loc3_,_loc3_.data);
            }
            _loc2_++;
         }
      }
      
      private function dataProvider_changeHandler(param1:Event) : void
      {
         var _loc2_:int = int(ISelectableList(dataProvider).selectedIndex);
         if(selectedIndex != _loc2_)
         {
            selectedIndex = _loc2_;
            commitSelection(false);
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
         }
      }
      
      override protected function dataGroup_rendererAddHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererAddHandler(param1);
         var _loc2_:IVisualElement = param1.renderer;
         if(_loc2_)
         {
            _loc2_.addEventListener(MouseEvent.CLICK,this.item_clickHandler);
            if(_loc2_ is IFocusManagerComponent)
            {
               IFocusManagerComponent(_loc2_).focusEnabled = false;
            }
            if(_loc2_ is ButtonBarButton)
            {
               ButtonBarButton(_loc2_).allowDeselection = !requireSelection;
            }
         }
      }
      
      override protected function dataGroup_rendererRemoveHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererRemoveHandler(param1);
         var _loc2_:IVisualElement = param1.renderer;
         if(_loc2_)
         {
            _loc2_.removeEventListener(MouseEvent.CLICK,this.item_clickHandler);
         }
      }
      
      private function item_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.currentTarget is IItemRenderer)
         {
            _loc2_ = int(IItemRenderer(param1.currentTarget).itemIndex);
         }
         else
         {
            _loc2_ = dataGroup.getElementIndex(param1.currentTarget as IVisualElement);
         }
         var _loc3_:int = selectedIndex;
         if(_loc2_ == selectedIndex)
         {
            if(!requireSelection)
            {
               mx_internal::setSelectedIndex(NO_SELECTION,true);
            }
         }
         else
         {
            mx_internal::setSelectedIndex(_loc2_,true);
         }
         if(this.enableFocusHighlight && selectedIndex != _loc3_)
         {
            this.enableFocusHighlight = this.inKeyUpHandler;
         }
      }
      
      private function adjustCaretIndex(param1:int) : void
      {
         if(!dataGroup || caretIndex < 0)
         {
            return;
         }
         var _loc2_:int = caretIndex;
         var _loc3_:int = 0;
         if(arrowKeysWrapFocus)
         {
            mx_internal::setCurrentCaretIndex((caretIndex + param1 + _loc3_) % _loc3_);
         }
         else
         {
            mx_internal::setCurrentCaretIndex(Math.min(_loc3_ - 1,Math.max(0,caretIndex + param1)));
         }
         if(_loc2_ != caretIndex)
         {
            dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CARET_CHANGE,false,false,_loc2_,caretIndex));
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc3_:* = null;
         if(param1.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         if(!enabled || !dataGroup || param1.isDefaultPrevented())
         {
            return;
         }
         if(!isNaN(this.pressedIndex))
         {
            param1.preventDefault();
            return;
         }
         super.keyDownHandler(param1);
         var _loc2_:uint = uint(mx_internal::mapKeycodeForLayoutDirection(param1,true));
         switch(_loc2_)
         {
            case Keyboard.UP:
            case Keyboard.LEFT:
               this.adjustCaretIndex(-1);
               param1.preventDefault();
               break;
            case Keyboard.DOWN:
            case Keyboard.RIGHT:
               this.adjustCaretIndex(1);
               param1.preventDefault();
               break;
            case Keyboard.SPACE:
               _loc3_ = this.getItemRenderer(caretIndex) as IItemRenderer;
               if(Boolean(_loc3_) && (!_loc3_.selected && requireSelection || !requireSelection))
               {
                  _loc3_.dispatchEvent(param1);
                  this.pressedIndex = caretIndex;
                  break;
               }
         }
      }
      
      override protected function keyUpHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:* = null;
         if(param1.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         if(!enabled)
         {
            return;
         }
         super.keyUpHandler(param1);
         switch(param1.keyCode)
         {
            case Keyboard.SPACE:
               this.inKeyUpHandler = true;
               if(!isNaN(this.pressedIndex))
               {
                  _loc2_ = this.getItemRenderer(this.pressedIndex) as IItemRenderer;
                  if(Boolean(_loc2_) && (!_loc2_.selected && requireSelection || !requireSelection))
                  {
                     _loc2_.dispatchEvent(param1);
                     this.pressedIndex = NaN;
                  }
               }
               this.inKeyUpHandler = false;
         }
      }
   }
}
