package net.bigpoint.darkorbit.fui.components.bars
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.skins.BasicSkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.MovieClipLayer;
   
   public class TabBar extends Coreponent
   {
       
      
      private var _currentlyActiveTab:int = 0;
      
      private var _tabBarClip:MovieClip;
      
      private var _firstClip:MovieClip;
      
      private var _othersClip:MovieClip;
      
      private var _tabClips:Vector.<MovieClip>;
      
      private var _tabTextFields:Vector.<TextField>;
      
      private var _tabTexts:Vector.<String>;
      
      private const TAB_COLOR_INACTIVE:int = 7320267;
      
      private const TAB_COLOR_ACTIVE:int = 15327936;
      
      private const activeGlowFilter:GlowFilter = new GlowFilter(16755200,0.75,2,2,1.5);
      
      public function TabBar()
      {
         super();
      }
      
      override protected function onAddedToStage(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         super.onAddedToStage(param1);
         var _loc2_:BasicSkin = this.getChildAt(0) as BasicSkin;
         this._tabClips = new Vector.<MovieClip>();
         this._tabTextFields = new Vector.<TextField>();
         this._tabBarClip = (_loc2_.getSkinLayer("normal") as MovieClipLayer).getChildAt(0) as MovieClip;
         this._tabBarClip.gotoAndStop(1);
         this._tabBarClip.mouseChildren = true;
         this._tabBarClip.mouseEnabled = true;
         this._firstClip = this._tabBarClip.getChildByName("First") as MovieClip;
         this.addChild(this._firstClip);
         this._othersClip = this._tabBarClip.getChildByName("Others") as MovieClip;
         this._tabClips.push(this._firstClip);
         var _loc3_:int = 1;
         while(_loc3_ < this._tabTexts.length)
         {
            (_loc5_ = this.cloneMC(this._othersClip)).alpha = 1;
            _loc5_.x = this._firstClip.width + (_loc3_ - 1) * _loc5_.width;
            this.addChild(_loc5_);
            this._tabClips.push(_loc5_);
            _loc3_++;
         }
         this._othersClip.parent.removeChild(this._othersClip);
         var _loc4_:int = 0;
         while(_loc4_ < this._tabClips.length)
         {
            (_loc6_ = this._tabClips[_loc4_]).gotoAndStop(1);
            _loc6_.useHandCursor = true;
            _loc6_.buttonMode = true;
            _loc6_.mouseEnabled = true;
            _loc6_.mouseChildren = false;
            _loc6_.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOver);
            _loc6_.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
            _loc6_.addEventListener(MouseEvent.CLICK,this.handleMouseClick);
            (_loc7_ = new TextFormat()).align = TextFormatAlign.CENTER;
            _loc7_.font = "Verdana";
            _loc7_.size = 9;
            (_loc8_ = new TextField()).appendText(this._tabTexts[_loc4_]);
            _loc8_.mouseEnabled = false;
            _loc8_.multiline = false;
            _loc8_.width = _loc6_.width;
            _loc8_.setTextFormat(_loc7_);
            _loc8_.textColor = 7320267;
            _loc8_.x = _loc6_.x;
            _loc8_.y = -1;
            this.addChild(_loc8_);
            this._tabTextFields.push(_loc8_);
            _loc4_++;
         }
         this._tabTextFields[this._tabClips.indexOf(this._firstClip)].x = this._tabTextFields[this._tabClips.indexOf(this._firstClip)].x + 5;
         this._tabTextFields[this._currentlyActiveTab].textColor = 15327936;
         this._tabTextFields[this._currentlyActiveTab].filters = [this.activeGlowFilter];
         this._tabClips[this._currentlyActiveTab].gotoAndStop(3);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function handleMouseClick(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._tabClips.length)
         {
            _loc3_ = this._tabClips[_loc2_];
            _loc4_ = this._tabTextFields[_loc2_];
            if(_loc3_ == param1.target)
            {
               _loc3_.gotoAndStop(3);
               this._currentlyActiveTab = _loc2_;
               _loc4_.textColor = 15327936;
               _loc4_.filters = [this.activeGlowFilter];
               dispatchEvent(new TabBarEvent(TabBarEvent.EVENT_SELECTION_CHANGED));
            }
            else
            {
               _loc4_.textColor = 7320267;
               _loc4_.filters = [];
               _loc3_.gotoAndStop(1);
            }
            _loc2_++;
         }
      }
      
      private function handleMouseOver(param1:MouseEvent) : void
      {
         if(this._tabClips[this._currentlyActiveTab] != param1.target)
         {
            (param1.target as MovieClip).gotoAndStop(2);
         }
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         if(this._tabClips[this._currentlyActiveTab] != param1.target)
         {
            (param1.target as MovieClip).gotoAndStop(1);
         }
      }
      
      private function cloneMC(param1:MovieClip) : MovieClip
      {
         return new param1.constructor() as MovieClip;
      }
      
      public function get currentlyActiveTab() : int
      {
         return this._currentlyActiveTab;
      }
      
      public function parseTextKeys(param1:String) : void
      {
         var _loc2_:* = null;
         this._tabTexts = new Vector.<String>();
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in param1.split(","))
         {
            this._tabTexts.push(class_88.getItem(_loc2_));
         }
      }
   }
}
