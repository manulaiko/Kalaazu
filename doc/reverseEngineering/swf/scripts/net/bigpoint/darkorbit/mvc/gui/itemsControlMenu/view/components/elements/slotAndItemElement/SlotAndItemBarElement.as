package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement
{
   import com.bigpoint.utils.class_129;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.getTimer;
   import mx.utils.MatrixUtil;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.TextureAtlasBitmapFont;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.vo.ItemVO;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.abstract.AbstractMenuElement;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.counterDots.CounterDots;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.dragPreview.DragPreview;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.dragPreview.DragPreviewRounded;
   import package_11.class_39;
   import package_242.DragEvent;
   import package_242.IDraggable;
   import package_242.class_1894;
   import package_26.class_333;
   import package_335.class_1896;
   
   public class SlotAndItemBarElement extends AbstractMenuElement implements IDraggable
   {
      
      private static const LINKAGE:String = "slotAndItemBarElement";
      
      private static const DRAG_DELAY:int = 60;
      
      public static const ITEM_CLICKED:String = "itemClicked";
      
      public static const ITEM_DOUBLECLICKED:String = "itemDoubleClicked";
      
      public static const DEFAULT_SIZE:int = 39;
      
      private static const COUNTER_FONT_CONTAINER:String = "counterFontContainer";
      
      private static const COUNTER_BAR:String = "counterBar";
      
      private static const COUNTER_DOTS:String = "counterDots";
      
      private static const ACTIVE_OVERLAY:String = "activeOverlay";
      
      private static const COOLDOWN_TIMER_OVERLAY:String = "cooldownTimerOverlay";
      
      private static const ACTIVE_TIME_COUNTER_F:String = "activeTimerCounterF";
      
      private static const BRIGHT_BACKGROUND:String = "brightBackground";
      
      private static const BLOCKED_STATE:String = "blockedState";
      
      private static const RED_BLINK:String = "noSwitchingAmmoWarn";
      
      private static const SELECTED_STATE_ROUND:String = "selectedStateRound";
      
      private static const ROLL_OVER_STATE_ROUND:String = "rollOverStateRound";
      
      private static const MOUSE_DOWN_STATE_ROUND:String = "mouseDownStateRound";
      
      private static const BACKGROUND_ROUND:String = "backgroundRound";
      
      private static const BRIGHT_BACKGROUND_ROUND:String = "brightBackgroundRound";
      
      private static const BLOCKED_STATE_ROUND:String = "blockedStateRound";
      
      private static const RED_BLINK_ROUND:String = "noSwitchingAmmoWarnRound";
       
      
      public var atlasBitmapFont:TextureAtlasBitmapFont;
      
      public var counterFontContainer:Sprite;
      
      public var counterBar:ProgressBar;
      
      public var counterDots:CounterDots;
      
      public var activeOverlay:Sprite;
      
      public var cooldownTimerOverlay:TimerOverlay;
      
      public var activeTimerCounterF:TextField;
      
      public var brightBackground:Sprite;
      
      public var blockedState:Sprite;
      
      public var noSwitchingAmmoWarn:Sprite;
      
      public var selectedStateRound:Sprite;
      
      public var rollOverStateRound:Sprite;
      
      public var mouseDownStateRound:Sprite;
      
      public var backgroundRound:Sprite;
      
      public var brightBackgroundRound:Sprite;
      
      public var blockedStateRound:Sprite;
      
      public var noSwitchingAmmoWarnRound:Sprite;
      
      private var _itemVO:ItemVO;
      
      private var _dragStartTime:Number;
      
      private var _tooltipHook:class_333;
      
      private var _tooltipText:String;
      
      private var _categoryMode:Boolean;
      
      public function SlotAndItemBarElement(param1:class_39, param2:ItemVO, param3:BitmapData, param4:String, param5:Boolean = false)
      {
         super(param1,this.symbolLinkage);
         this.updateMode(param5);
         method_5256(new <DisplayObject>[this.counterFontContainer,this.counterBar,this.counterDots,this.activeTimerCounterF,this.activeOverlay,this.cooldownTimerOverlay,this.blockedState,this.noSwitchingAmmoWarn],false);
         this.setData(param2,param3,param4);
         doubleClickEnabled = true;
         this.noSwitchingAmmoWarn.mouseEnabled = false;
         this.activeTimerCounterF.mouseEnabled = false;
         this.cooldownTimerOverlay.init(0,0.6);
      }
      
      override public function decorate() : void
      {
         method_4210(this.brightBackground = method_4492(BRIGHT_BACKGROUND));
         method_4210(this.brightBackgroundRound = method_4492(BRIGHT_BACKGROUND_ROUND));
         method_4210(background = method_4492(method_4462,true));
         method_4210(this.backgroundRound = method_4492(BACKGROUND_ROUND));
         super.decorate();
         method_4210(rollOverState = method_4492(method_6157));
         method_4210(this.rollOverStateRound = method_4492(ROLL_OVER_STATE_ROUND));
         method_4210(mouseDownState = method_4492(method_1686));
         method_4210(this.mouseDownStateRound = method_4492(MOUSE_DOWN_STATE_ROUND));
         method_4210(selectedState = method_4492(method_1151,true));
         method_4210(this.selectedStateRound = method_4492(SELECTED_STATE_ROUND));
         method_4210(labelF = method_1023("labelF",true));
         method_4210(this.counterFontContainer = method_4492(COUNTER_FONT_CONTAINER));
         method_4210(this.counterBar = new ProgressBar(method_4492(COUNTER_BAR)));
         method_4210(this.counterDots = new CounterDots(method_4492(COUNTER_DOTS),_swfFinisher));
         method_4210(this.activeOverlay = method_4492(ACTIVE_OVERLAY));
         method_4210(this.cooldownTimerOverlay = new TimerOverlay(method_4492(COOLDOWN_TIMER_OVERLAY)));
         method_4210(this.activeTimerCounterF = method_1023(ACTIVE_TIME_COUNTER_F));
         this.counterFontContainer.addChild(this.atlasBitmapFont = new TextureAtlasBitmapFont());
         method_4210(this.blockedState = method_4492(BLOCKED_STATE));
         method_4210(this.blockedStateRound = method_4492(BLOCKED_STATE_ROUND));
         method_4210(this.noSwitchingAmmoWarn = method_4492(RED_BLINK));
         method_4210(this.noSwitchingAmmoWarnRound = method_4492(RED_BLINK_ROUND));
      }
      
      public function setData(param1:ItemVO, param2:BitmapData, param3:String) : void
      {
         if(this._itemVO == null || this._itemVO && this._itemVO.iconLootId != param1.iconLootId)
         {
            placeIcon(param2);
         }
         this._itemVO = param1;
         this.initCounter(this._itemVO.counterValue,this._itemVO.maxCounterValue,this._itemVO.counterType);
         if(!this._tooltipText)
         {
            this._tooltipHook = tooltipManager.method_1211(this,this._tooltipText = param3,true);
         }
         else
         {
            this._tooltipHook.method_1455(this._tooltipText = param3);
         }
         this.updateTimerAndActivatable();
         this.updateSelection();
         this.updateBuyable();
         this.updateBlockade();
      }
      
      private function updateBuyable() : void
      {
         this.brightBackground.visible = this._itemVO.buyable;
         background.visible = !this._itemVO.buyable;
         if(this._itemVO.buyable)
         {
            this.counterFontContainer.x = int((DEFAULT_SIZE - this.counterFontContainer.width) / 2) - 1;
            this.counterFontContainer.y = 3;
            this.atlasBitmapFont.setColor(ItemsControlMenuConstants.STYLE_YELLOW);
         }
      }
      
      public function updateTimerAndActivatable() : void
      {
         if(this._itemVO.hasCountDownTimer)
         {
            this.clearTimerListeners();
            if(this._itemVO.timerVO.timerState == ItemsControlMenuConstants.TIMER_STATE_COOLING_DOWN)
            {
               this._itemVO.timerVO.countDownTimer.method_5612(class_1896.const_983,this.cooldownTickHandler,false,0,true);
               this._itemVO.timerVO.countDownTimer.addEventListener(class_1896.const_2754,this.cooldownOrActiveCoundDownFinishHandler,false,0,true);
            }
            else
            {
               this.activeTimerCounterF.visible = true;
               this._itemVO.timerVO.countDownTimer.method_5612(class_1896.const_983,this.activeTickHandler,false,0,true);
               this._itemVO.timerVO.countDownTimer.addEventListener(class_1896.const_2754,this.cooldownOrActiveCoundDownFinishHandler,false,0,true);
            }
         }
         else
         {
            this.cooldownTimerOverlay.progress = 0;
            method_4622(false,this.activeOverlay);
            this.activeTimerCounterF.visible = false;
         }
         this.updateActivatability();
      }
      
      private function updateActivatability() : void
      {
         var _loc1_:Boolean = false;
         if(!_duringHighlight)
         {
            _loc1_ = !this._itemVO.activatable || this._itemVO.hasCountDownTimer;
            method_4965(this,_loc1_ ? 0.2 : 1,_loc1_ ? 0.8 : 1);
         }
         if(!this._itemVO.activatable)
         {
            method_4622(false,rollOverState);
            this.counterBar.removeHighlight(ItemsControlMenuConstants.STYLE_BLUE);
         }
         this.atlasBitmapFont.setColor(this.itemVO.counterStyle);
         if(this._itemVO.counterType == ItemsControlMenuConstants.COUNTER_TYPE_COUNTER_DOTS)
         {
            method_4622(this._itemVO.activatable,this.counterDots);
         }
      }
      
      private function updateBlockade() : void
      {
         this.blockedState.visible = this._itemVO.blocked;
      }
      
      private function cooldownTickHandler(param1:class_1896) : void
      {
         this.activeTimerCounterF.visible = false;
         var _loc2_:int = Math.max(1,100 - Math.floor(Number(param1.name_11) / this._itemVO.timerVO.maxTime * 100));
         this.cooldownTimerOverlay.progress = _loc2_;
         this.updateTooltip(param1,class_88.getItem("cooldown_remaining"));
      }
      
      private function activeTickHandler(param1:class_1896) : void
      {
         var _loc2_:int = Math.max(1,100 - Math.floor(Number(param1.name_11) / this._itemVO.timerVO.maxTime * 100));
         method_4622(_loc2_ < 99,this.activeOverlay);
         var _loc3_:String = !!param1.method_4778 ? class_129.method_1101(param1.method_4778) : "";
         this.activeTimerCounterF.text = _loc3_;
         this.updateTooltip(param1);
      }
      
      private function cooldownOrActiveCoundDownFinishHandler(param1:class_1896) : void
      {
         this.updateActivatability();
         this.clearTimerListeners();
         this.updateTooltip(param1);
      }
      
      private function initCounter(param1:Number, param2:Number, param3:String) : void
      {
         var _loc4_:Number = NaN;
         switch(param3)
         {
            case ItemsControlMenuConstants.COUNTER_TYPE_COUNTER_BAR:
               _loc4_ = this._itemVO.activatable ? this._itemVO.counterStyle : ItemsControlMenuConstants.STYLE_BLUE;
               this.counterBar.setProgress(Math.min(param1,param2),param2,ItemsControlMenuConstants.STYLE_BLUE,_loc4_);
               this.atlasBitmapFont.setValue(param1,_loc4_);
               this.counterFontContainer.visible = true;
               break;
            case ItemsControlMenuConstants.COUNTER_TYPE_COUNTER_DOTS:
               this.counterDots.setProgress(Math.min(param1,param2),param2,this._itemVO.counterStyle,this._itemVO.activatable);
               break;
            case ItemsControlMenuConstants.COUNTER_TYPE_COUNTER_NUMBER:
               this.atlasBitmapFont.setValue(param1,ItemsControlMenuConstants.STYLE_BLUE);
               this.counterFontContainer.visible = true;
         }
      }
      
      private function updateSelection() : void
      {
         var _loc1_:Boolean = this._itemVO.actionStyle == ItemsControlMenuConstants.ACTION_SELECTION || this._itemVO.actionStyle == ItemsControlMenuConstants.ACTION_TOOGLE;
         method_4622(_loc1_ && this._itemVO.selected,selectedState);
      }
      
      override protected function clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(ITEM_CLICKED,true));
      }
      
      override protected function doubleClickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(ITEM_DOUBLECLICKED,true));
      }
      
      override public function mouseUpDownHandler(param1:MouseEvent) : void
      {
         super.mouseUpDownHandler(param1);
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            this._dragStartTime = getTimer();
            addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         }
         if(param1.type == MouseEvent.MOUSE_UP)
         {
            removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         }
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = getTimer() - this._dragStartTime;
         if(_loc2_ > DRAG_DELAY)
         {
            removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
            dispatchEvent(new DragEvent(DragEvent.DRAG_START));
         }
      }
      
      override public function rollHandler(param1:MouseEvent) : void
      {
         if(this._itemVO.activatable)
         {
            super.rollHandler(param1);
            if(param1.type == MouseEvent.ROLL_OUT)
            {
               removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
            }
         }
      }
      
      private function updateTooltip(param1:class_1896, param2:String = null) : void
      {
         if(this._itemVO.actionStyle == ItemsControlMenuConstants.ACTION_TIMER)
         {
            if(param2)
            {
               param2 = !!param1.method_4778 ? "\n" + param2.replace("%TIME%",class_129.method_1101(param1.method_4778)) : "";
            }
            else
            {
               param2 = !!param1.method_4778 ? "\n" + class_129.method_1101(param1.method_4778) : "";
            }
            this._tooltipHook.method_1455(this._tooltipText + (!!param2 ? param2 : ""));
         }
      }
      
      private function clearTimerListeners(param1:Event = null) : void
      {
         if(this._itemVO.timerVO.countDownTimer)
         {
            this._itemVO.timerVO.countDownTimer.removeEventListener(class_1896.const_983,this.cooldownTickHandler);
            this._itemVO.timerVO.countDownTimer.removeEventListener(class_1896.const_983,this.activeTickHandler);
            this._itemVO.timerVO.countDownTimer.removeEventListener(class_1896.const_2754,this.cooldownOrActiveCoundDownFinishHandler);
         }
      }
      
      override protected function removeFromStageListener(param1:Event) : void
      {
         this.clearTimerListeners();
      }
      
      private function updateMode(param1:Boolean) : void
      {
         this._categoryMode = param1;
         this.selectedStateRound.visible = this.rollOverStateRound.visible = this.mouseDownStateRound.visible = this.blockedStateRound.visible = this.noSwitchingAmmoWarnRound.visible = this.backgroundRound.visible = this.brightBackgroundRound.visible = this._categoryMode;
         var _loc2_:* = !this._categoryMode;
         this.brightBackground.visible = !this._categoryMode;
         selectedState.visible = rollOverState.visible = mouseDownState.visible = this.blockedState.visible = this.noSwitchingAmmoWarn.visible = background.visible = _loc2_;
         if(this._categoryMode)
         {
            selectedState = this.selectedStateRound;
            rollOverState = this.rollOverStateRound;
            mouseDownState = this.mouseDownStateRound;
            this.blockedState = this.blockedStateRound;
            this.noSwitchingAmmoWarn = this.noSwitchingAmmoWarnRound;
            background = this.backgroundRound;
            this.brightBackground = this.brightBackgroundRound;
            method_1574();
         }
      }
      
      public function get preview() : class_1894
      {
         method_5256(new <DisplayObject>[mouseDownState,selectedState,rollOverState,this.cooldownTimerOverlay,this.activeOverlay],false);
         var _loc1_:BitmapData = new BitmapData(DEFAULT_SIZE,DEFAULT_SIZE,true,0);
         _loc1_.draw(this,MatrixUtil.composeMatrix(-Number(x)));
         method_4622(true,rollOverState,0);
         method_4622(false,rollOverState);
         return this._categoryMode ? new DragPreviewRounded(_swfFinisher,new Bitmap(_loc1_)) : new DragPreview(_swfFinisher,new Bitmap(_loc1_));
      }
      
      override public function toString() : String
      {
         return "SlotAndItemElement, id: " + this._itemVO.id;
      }
      
      public function get data() : Object
      {
         return this._itemVO;
      }
      
      public function get asDisplayObject() : DisplayObject
      {
         return this;
      }
      
      override public function get symbolLinkage() : String
      {
         return LINKAGE;
      }
      
      public function get dragOffset() : Point
      {
         return new Point();
      }
      
      public function get itemVO() : ItemVO
      {
         return this._itemVO;
      }
      
      override public function get width() : Number
      {
         return DEFAULT_SIZE;
      }
      
      override public function get height() : Number
      {
         return DEFAULT_SIZE;
      }
   }
}
