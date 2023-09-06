package fl.controls
{
   import fl.controls.listClasses.ICellRenderer;
   import fl.core.InvalidationType;
   import fl.core.UIComponent;
   import fl.data.DataProvider;
   import fl.data.SimpleCollectionItem;
   import fl.events.ComponentEvent;
   import fl.events.DataChangeEvent;
   import fl.events.ListEvent;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   
   public class ComboBox extends UIComponent implements IFocusManagerComponent
   {
      
      private static var defaultStyles:Object = {
         "upSkin":"ComboBox_upSkin",
         "downSkin":"ComboBox_downSkin",
         "overSkin":"ComboBox_overSkin",
         "disabledSkin":"ComboBox_disabledSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "textPadding":3,
         "buttonWidth":24,
         "disabledAlpha":null,
         "listSkin":null
      };
      
      public static var createAccessibilityImplementation:Function;
      
      protected static const BACKGROUND_STYLES:Object = {
         "overSkin":"overSkin",
         "downSkin":"downSkin",
         "upSkin":"upSkin",
         "disabledSkin":"disabledSkin",
         "repeatInterval":"repeatInterval"
      };
      
      protected static const LIST_STYLES:Object = {
         "upSkin":"comboListUpSkin",
         "overSkin":"comboListOverSkin",
         "downSkin":"comobListDownSkin",
         "disabledSkin":"comboListDisabledSkin",
         "downArrowDisabledSkin":"downArrowDisabledSkin",
         "downArrowDownSkin":"downArrowDownSkin",
         "downArrowOverSkin":"downArrowOverSkin",
         "downArrowUpSkin":"downArrowUpSkin",
         "upArrowDisabledSkin":"upArrowDisabledSkin",
         "upArrowDownSkin":"upArrowDownSkin",
         "upArrowOverSkin":"upArrowOverSkin",
         "upArrowUpSkin":"upArrowUpSkin",
         "thumbDisabledSkin":"thumbDisabledSkin",
         "thumbDownSkin":"thumbDownSkin",
         "thumbOverSkin":"thumbOverSkin",
         "thumbUpSkin":"thumbUpSkin",
         "thumbIcon":"thumbIcon",
         "trackDisabledSkin":"trackDisabledSkin",
         "trackDownSkin":"trackDownSkin",
         "trackOverSkin":"trackOverSkin",
         "trackUpSkin":"trackUpSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval",
         "textFormat":"textFormat",
         "disabledAlpha":"disabledAlpha",
         "skin":"listSkin"
      };
       
      
      protected var isKeyDown:Boolean = false;
      
      protected var _labels:Array;
      
      protected var background:BaseButton;
      
      protected var _dropdownWidth:Number;
      
      protected var inputField:TextInput;
      
      protected var highlightedCell:int = -1;
      
      protected var listOverIndex:uint;
      
      protected var editableValue:String;
      
      protected var _prompt:String;
      
      protected var isOpen:Boolean = false;
      
      protected var list:List;
      
      protected var _rowCount:uint = 5;
      
      protected var _editable:Boolean = false;
      
      private var collectionItemImport:SimpleCollectionItem;
      
      protected var currentIndex:int;
      
      public function ComboBox()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return mergeStyles(defaultStyles,List.getStyleDefinition());
      }
      
      protected function drawList() : void
      {
         list.rowCount = Math.max(0,Math.min(_rowCount,list.dataProvider.length));
      }
      
      public function get imeMode() : String
      {
         return inputField.imeMode;
      }
      
      protected function onInputFieldFocusOut(param1:FocusEvent) : void
      {
         inputField.removeEventListener(ComponentEvent.ENTER,onEnter);
         selectedIndex = selectedIndex;
      }
      
      public function set imeMode(param1:String) : void
      {
         inputField.imeMode = param1;
      }
      
      protected function passEvent(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      protected function calculateAvailableHeight() : Number
      {
         var _loc1_:Number = Number(getStyleValue("contentPadding"));
         return 0 - _loc1_ * 2;
      }
      
      public function get dropdown() : List
      {
         return list;
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         isKeyDown = false;
         if(isOpen)
         {
            if(!param1.relatedObject || !list.contains(param1.relatedObject))
            {
               if(highlightedCell != -1 && highlightedCell != selectedIndex)
               {
                  selectedIndex = highlightedCell;
                  dispatchEvent(new Event(Event.CHANGE));
               }
               close();
            }
         }
         super.focusOutHandler(param1);
      }
      
      public function get selectedLabel() : String
      {
         if(editableValue != null)
         {
            return editableValue;
         }
         if(selectedIndex == -1)
         {
            return null;
         }
         return itemToLabel(selectedItem);
      }
      
      protected function onListChange(param1:Event) : void
      {
         editableValue = null;
         dispatchEvent(param1);
         invalidate(InvalidationType.SELECTED);
         if(isKeyDown)
         {
            return;
         }
         close();
      }
      
      public function get text() : String
      {
         return inputField.text;
      }
      
      protected function onEnter(param1:ComponentEvent) : void
      {
         param1.stopPropagation();
      }
      
      public function sortItemsOn(param1:String, param2:Object = null) : *
      {
         return list.sortItemsOn(param1,param2);
      }
      
      protected function handleDataChange(param1:DataChangeEvent) : void
      {
         invalidate(InvalidationType.DATA);
      }
      
      protected function onToggleListVisibility(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         dispatchEvent(param1);
         if(isOpen)
         {
            close();
         }
         else
         {
            open();
            stage.addEventListener(MouseEvent.MOUSE_UP,onListItemUp,false,0,true);
         }
      }
      
      public function get dropdownWidth() : Number
      {
         return list.width;
      }
      
      protected function highlightCell(param1:int = -1) : void
      {
         var _loc2_:* = null;
         if(highlightedCell > -1)
         {
            _loc2_ = list.itemToCellRenderer(getItemAt(highlightedCell));
            if(_loc2_ != null)
            {
               _loc2_.setMouseState("up");
            }
         }
         if(param1 == -1)
         {
            return;
         }
         list.scrollToIndex(param1);
         list.drawNow();
         _loc2_ = list.itemToCellRenderer(getItemAt(param1));
         if(_loc2_ != null)
         {
            _loc2_.setMouseState("over");
            highlightedCell = param1;
         }
      }
      
      public function removeItemAt(param1:uint) : void
      {
         list.removeItemAt(param1);
         invalidate(InvalidationType.DATA);
      }
      
      override protected function draw() : void
      {
         var _loc1_:* = selectedIndex;
         if(_loc1_ == -1 && (prompt != null || editable || length == 0))
         {
            _loc1_ = Math.max(-1,Math.min(_loc1_,length - 1));
         }
         else
         {
            editableValue = null;
            _loc1_ = Math.max(0,Math.min(_loc1_,length - 1));
         }
         if(list.selectedIndex != _loc1_)
         {
            list.selectedIndex = _loc1_;
            invalidate(InvalidationType.SELECTED,false);
         }
         if(isInvalid(InvalidationType.STYLES))
         {
            setStyles();
            setEmbedFonts();
            invalidate(InvalidationType.SIZE,false);
         }
         if(isInvalid(InvalidationType.SIZE,InvalidationType.DATA,InvalidationType.STATE))
         {
            drawTextFormat();
            drawLayout();
            invalidate(InvalidationType.DATA);
         }
         if(isInvalid(InvalidationType.DATA))
         {
            drawList();
            invalidate(InvalidationType.SELECTED,true);
         }
         if(isInvalid(InvalidationType.SELECTED))
         {
            if(_loc1_ == -1 && editableValue != null)
            {
               inputField.text = editableValue;
            }
            else if(_loc1_ > -1)
            {
               if(length > 0)
               {
                  inputField.horizontalScrollPosition = 0;
                  inputField.text = itemToLabel(list.selectedItem);
               }
            }
            else if(_loc1_ == -1 && _prompt != null)
            {
               showPrompt();
            }
            else
            {
               inputField.text = "";
            }
            if(editable && selectedIndex > -1 && true)
            {
               inputField.setSelection(0,inputField.length);
            }
         }
         drawTextField();
         super.draw();
      }
      
      public function get selectedItem() : Object
      {
         return list.selectedItem;
      }
      
      public function open() : void
      {
         currentIndex = selectedIndex;
         if(isOpen || length == 0)
         {
            return;
         }
         dispatchEvent(new Event(Event.OPEN));
         isOpen = true;
         addEventListener(Event.ENTER_FRAME,addCloseListener,false,0,true);
         positionList();
         list.scrollToSelected();
         stage.addChild(list);
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         background = new BaseButton();
         background.focusEnabled = false;
         copyStylesToChild(background,BACKGROUND_STYLES);
         background.addEventListener(MouseEvent.MOUSE_DOWN,onToggleListVisibility,false,0,true);
         addChild(background);
         inputField = new TextInput();
         inputField.focusTarget = this as IFocusManagerComponent;
         inputField.focusEnabled = false;
         inputField.addEventListener(Event.CHANGE,onTextInput,false,0,true);
         addChild(inputField);
         list = new List();
         list.focusEnabled = false;
         copyStylesToChild(list,LIST_STYLES);
         list.addEventListener(Event.CHANGE,onListChange,false,0,true);
         list.addEventListener(ListEvent.ITEM_CLICK,onListChange,false,0,true);
         list.addEventListener(ListEvent.ITEM_ROLL_OUT,passEvent,false,0,true);
         list.addEventListener(ListEvent.ITEM_ROLL_OVER,passEvent,false,0,true);
         list.verticalScrollBar.addEventListener(Event.SCROLL,passEvent,false,0,true);
      }
      
      public function set text(param1:String) : void
      {
         if(!editable)
         {
            return;
         }
         inputField.text = param1;
      }
      
      public function addItem(param1:Object) : void
      {
         list.addItem(param1);
         invalidate(InvalidationType.DATA);
      }
      
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      public function get labelField() : String
      {
         return list.labelField;
      }
      
      protected function positionList() : void
      {
         var _loc1_:Point = localToGlobal(new Point(0,0));
         list.x = _loc1_.x;
         if(_loc1_.y + height + list.height > stage.stageHeight)
         {
            list.y = _loc1_.y - 0;
         }
         else
         {
            list.y = _loc1_.y + height;
         }
      }
      
      protected function onStageClick(param1:MouseEvent) : void
      {
         if(!isOpen)
         {
            return;
         }
         if(!contains(param1.target as DisplayObject) && !list.contains(param1.target as DisplayObject))
         {
            if(highlightedCell != -1)
            {
               selectedIndex = highlightedCell;
               dispatchEvent(new Event(Event.CHANGE));
            }
            close();
         }
      }
      
      public function set dropdownWidth(param1:Number) : void
      {
         _dropdownWidth = param1;
         invalidate(InvalidationType.SIZE);
      }
      
      public function get prompt() : String
      {
         return _prompt;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         isKeyDown = true;
         if(param1.ctrlKey)
         {
            switch(param1.keyCode)
            {
               case Keyboard.UP:
                  if(highlightedCell > -1)
                  {
                     selectedIndex = highlightedCell;
                     dispatchEvent(new Event(Event.CHANGE));
                  }
                  close();
                  break;
               case Keyboard.DOWN:
                  open();
            }
            return;
         }
         param1.stopPropagation();
         var _loc2_:int = Math.max(calculateAvailableHeight() / 0 << 0,1);
         var _loc3_:uint = selectedIndex;
         var _loc4_:Number = highlightedCell == -1 ? selectedIndex : highlightedCell;
         var _loc5_:int = -1;
         switch(param1.keyCode)
         {
            case Keyboard.SPACE:
               if(isOpen)
               {
                  close();
               }
               else
               {
                  open();
               }
               return;
            case Keyboard.ESCAPE:
               if(isOpen)
               {
                  if(highlightedCell > -1)
                  {
                     selectedIndex = selectedIndex;
                  }
                  close();
               }
               return;
            case Keyboard.UP:
               _loc5_ = Math.max(0,_loc4_ - 1);
               break;
            case Keyboard.DOWN:
               _loc5_ = Math.min(length - 1,_loc4_ + 1);
               break;
            case Keyboard.PAGE_UP:
               _loc5_ = Math.max(_loc4_ - _loc2_,0);
               break;
            case Keyboard.PAGE_DOWN:
               _loc5_ = Math.min(_loc4_ + _loc2_,length - 1);
               break;
            case Keyboard.HOME:
               _loc5_ = 0;
               break;
            case Keyboard.END:
               _loc5_ = length - 1;
               break;
            case Keyboard.ENTER:
               if(_editable && highlightedCell == -1)
               {
                  editableValue = inputField.text;
                  selectedIndex = -1;
               }
               else if(isOpen && highlightedCell > -1)
               {
                  editableValue = null;
                  selectedIndex = highlightedCell;
                  dispatchEvent(new Event(Event.CHANGE));
               }
               dispatchEvent(new ComponentEvent(ComponentEvent.ENTER));
               close();
               return;
            default:
               if(editable)
               {
                  break;
               }
               _loc5_ = list.getNextIndexAtLetter(String.fromCharCode(param1.keyCode),_loc4_);
               break;
         }
         if(_loc5_ > -1)
         {
            if(isOpen)
            {
               highlightCell(_loc5_);
               inputField.text = list.itemToLabel(getItemAt(_loc5_));
            }
            else
            {
               highlightCell();
               selectedIndex = _loc5_;
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
      }
      
      public function get value() : String
      {
         var _loc1_:* = null;
         if(editableValue != null)
         {
            return editableValue;
         }
         _loc1_ = selectedItem;
         if(!_editable && _loc1_.data != null)
         {
            return _loc1_.data;
         }
         return itemToLabel(_loc1_);
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         super.focusInHandler(param1);
         if(editable)
         {
            stage.focus = inputField.textField;
         }
      }
      
      public function set dataProvider(param1:DataProvider) : void
      {
         param1.addEventListener(DataChangeEvent.DATA_CHANGE,handleDataChange,false,0,true);
         list.dataProvider = param1;
         invalidate(InvalidationType.DATA);
      }
      
      public function get rowCount() : uint
      {
         return _rowCount;
      }
      
      public function set restrict(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            param1 = null;
         }
         if(!_editable)
         {
            return;
         }
         inputField.restrict = param1;
      }
      
      public function replaceItemAt(param1:Object, param2:uint) : Object
      {
         return list.replaceItemAt(param1,param2);
      }
      
      public function removeAll() : void
      {
         list.removeAll();
         inputField.text = "";
         invalidate(InvalidationType.DATA);
      }
      
      protected function onTextInput(param1:Event) : void
      {
         param1.stopPropagation();
         if(!_editable)
         {
            return;
         }
         editableValue = inputField.text;
         selectedIndex = -1;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function onInputFieldFocus(param1:FocusEvent) : void
      {
         inputField.addEventListener(ComponentEvent.ENTER,onEnter,false,0,true);
         close();
      }
      
      protected function onListItemUp(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,onListItemUp);
         if(!(param1.target is ICellRenderer) || !list.contains(param1.target as DisplayObject))
         {
            return;
         }
         editableValue = null;
         var _loc2_:* = selectedIndex;
         selectedIndex = param1.target.listData.index;
         if(_loc2_ != selectedIndex)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
         close();
      }
      
      override protected function keyUpHandler(param1:KeyboardEvent) : void
      {
         isKeyDown = false;
      }
      
      protected function drawLayout() : void
      {
         var _loc1_:Number = getStyleValue("buttonWidth") as Number;
         var _loc2_:Number = getStyleValue("textPadding") as Number;
         background.setSize(width,height);
         inputField.x = inputField.y = _loc2_;
         inputField.setSize(width - _loc1_ - _loc2_,height - _loc2_);
         list.width = isNaN(_dropdownWidth) ? width : _dropdownWidth;
         background.enabled = enabled;
         background.drawNow();
      }
      
      public function set selectedItem(param1:Object) : void
      {
         list.selectedItem = param1;
         invalidate(InvalidationType.SELECTED);
      }
      
      public function getItemAt(param1:uint) : Object
      {
         return list.getItemAt(param1);
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            ComboBox.createAccessibilityImplementation(this);
         }
      }
      
      public function itemToLabel(param1:Object) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return list.itemToLabel(param1);
      }
      
      public function addItemAt(param1:Object, param2:uint) : void
      {
         list.addItemAt(param1,param2);
         invalidate(InvalidationType.DATA);
      }
      
      private function addCloseListener(param1:Event) : *
      {
         removeEventListener(Event.ENTER_FRAME,addCloseListener);
         if(!isOpen)
         {
            return;
         }
         stage.addEventListener(MouseEvent.MOUSE_DOWN,onStageClick,false,0,true);
      }
      
      protected function setEmbedFonts() : void
      {
         var _loc1_:Object = getStyleValue("embedFonts");
         if(_loc1_ != null)
         {
            inputField.textField.embedFonts = _loc1_;
         }
      }
      
      public function set rowCount(param1:uint) : void
      {
         _rowCount = param1;
         invalidate(InvalidationType.SIZE);
      }
      
      public function removeItem(param1:Object) : Object
      {
         return list.removeItem(param1);
      }
      
      public function get dataProvider() : DataProvider
      {
         return list.dataProvider;
      }
      
      public function get restrict() : String
      {
         return inputField.restrict;
      }
      
      protected function showPrompt() : void
      {
         inputField.text = _prompt;
      }
      
      public function sortItems(... rest) : *
      {
         return list.sortItems.apply(list,rest);
      }
      
      public function set editable(param1:Boolean) : void
      {
         _editable = param1;
         drawTextField();
      }
      
      public function set labelField(param1:String) : void
      {
         list.labelField = param1;
         invalidate(InvalidationType.DATA);
      }
      
      public function get textField() : TextInput
      {
         return inputField;
      }
      
      public function set prompt(param1:String) : void
      {
         if(param1 == "")
         {
            _prompt = null;
         }
         else
         {
            _prompt = param1;
         }
         invalidate(InvalidationType.STATE);
      }
      
      public function set labelFunction(param1:Function) : void
      {
         list.labelFunction = param1;
         invalidate(InvalidationType.DATA);
      }
      
      protected function setStyles() : void
      {
         copyStylesToChild(background,BACKGROUND_STYLES);
         copyStylesToChild(list,LIST_STYLES);
      }
      
      public function get length() : int
      {
         return list.length;
      }
      
      protected function drawTextFormat() : void
      {
         var _loc1_:TextFormat = getStyleValue(_enabled ? "textFormat" : "disabledTextFormat") as TextFormat;
         if(_loc1_ == null)
         {
            _loc1_ = new TextFormat();
         }
         inputField.textField.defaultTextFormat = _loc1_;
         inputField.textField.setTextFormat(_loc1_);
         setEmbedFonts();
      }
      
      protected function drawTextField() : void
      {
         inputField.setStyle("upSkin","");
         inputField.setStyle("disabledSkin","");
         inputField.enabled = enabled;
         inputField.editable = _editable;
         inputField.textField.selectable = enabled && _editable;
         var _loc1_:* = enabled && _editable;
         inputField.mouseChildren = enabled && _editable;
         inputField.mouseEnabled = _loc1_;
         inputField.focusEnabled = false;
         if(_editable)
         {
            inputField.addEventListener(FocusEvent.FOCUS_IN,onInputFieldFocus,false,0,true);
            inputField.addEventListener(FocusEvent.FOCUS_OUT,onInputFieldFocusOut,false,0,true);
         }
         else
         {
            inputField.removeEventListener(FocusEvent.FOCUS_IN,onInputFieldFocus);
            inputField.removeEventListener(FocusEvent.FOCUS_OUT,onInputFieldFocusOut);
         }
      }
      
      public function get labelFunction() : Function
      {
         return list.labelFunction;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         list.selectedIndex = param1;
         highlightCell();
         invalidate(InvalidationType.SELECTED);
      }
      
      public function get selectedIndex() : int
      {
         return list.selectedIndex;
      }
      
      public function close() : void
      {
         highlightCell();
         highlightedCell = -1;
         if(!isOpen)
         {
            return;
         }
         dispatchEvent(new Event(Event.CLOSE));
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,onStageClick);
         isOpen = false;
         stage.removeChild(list);
      }
   }
}
