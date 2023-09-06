package net.bigpoint.darkorbit.fui.system.manager
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.builder.repository.XMLUITemplateRepository;
   import net.bigpoint.darkorbit.fui.components.core.Container;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.core.layout.AlignmentAutoSizeMode;
   import net.bigpoint.darkorbit.fui.components.tooltip.ITooltipDataAssigner;
   
   public class TooltipManager implements ITooltipManager
   {
      
      protected static const TOOLTIP_CONTAINER_NAME:String = "tooltipContainer";
       
      
      private var _tooltipLayer:DisplayObjectContainer;
      
      private var _currentTooltipContainer:Container;
      
      private var _currentTooltipTarget:Coreponent;
      
      private var _currentTemplateID:String;
      
      private var _showTooltipIntervalID:uint;
      
      private var _showTooltipDelay:uint = 1000;
      
      private var _enable:Boolean = true;
      
      private const MOUSE_CURSOR_WIDTH:int = 16;
      
      public function TooltipManager(param1:DisplayObjectContainer)
      {
         super();
         this.tooltipLayer = param1;
         this.init();
      }
      
      public function get tooltipLayer() : DisplayObjectContainer
      {
         return this._tooltipLayer;
      }
      
      public function set tooltipLayer(param1:DisplayObjectContainer) : void
      {
         this._tooltipLayer = param1;
         this._tooltipLayer.mouseChildren = false;
         this._tooltipLayer.mouseEnabled = false;
      }
      
      public function get showTooltipDelay() : uint
      {
         return this._showTooltipDelay;
      }
      
      public function set showTooltipDelay(param1:uint) : void
      {
         this._showTooltipDelay = param1;
      }
      
      protected function get stage() : Stage
      {
         return !!this._tooltipLayer.stage ? this._tooltipLayer.stage : null;
      }
      
      public function attemptToRemoveTooltip() : void
      {
         this.clearShowTooltipTimeout();
         this.removeCurrentTooltipContainer();
      }
      
      public function assignTooltipTemplateID(param1:String, param2:Coreponent = null) : void
      {
         if(!this.isEnabled())
         {
            return;
         }
         this._currentTooltipTarget = param2;
         this._currentTemplateID = param1;
         this.removeCurrentTooltipContainer();
         this.clearShowTooltipTimeout();
         this._showTooltipIntervalID = setTimeout(this.showTooltip,1000);
      }
      
      public function disable() : void
      {
         this._enable = false;
         this.clearShowTooltipTimeout();
         this.removeCurrentTooltipContainer();
      }
      
      public function enable() : void
      {
         this._enable = true;
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         if(param1)
         {
            this.enable();
         }
         else
         {
            this.disable();
         }
      }
      
      public function isEnabled() : Boolean
      {
         return this._enable;
      }
      
      protected function init() : void
      {
         if(this.stage)
         {
            this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.handleMouseMoveEvent);
         }
      }
      
      protected function clearShowTooltipTimeout() : void
      {
         if(this._showTooltipIntervalID > 0)
         {
            clearTimeout(this._showTooltipIntervalID);
         }
      }
      
      protected function showTooltip() : void
      {
         if(this._currentTooltipContainer)
         {
            this._currentTooltipContainer.removeChildren();
         }
         this._currentTooltipContainer = new Container();
         this._currentTooltipContainer.name = TOOLTIP_CONTAINER_NAME;
         this._currentTooltipContainer.autoSizeWidth = true;
         this._currentTooltipContainer.autoSizeHeight = true;
         this._currentTooltipContainer.autoSizeMode = AlignmentAutoSizeMode.CHILDREN;
         var _loc1_:Object = XMLUITemplateRepository.getInstance().getTemplateByName(this._currentTemplateID);
         UISystem.getInstance().build(_loc1_,this._currentTooltipContainer);
         this.assignTooltipData();
         this.updatePosition();
         this.removeCurrentTooltipContainer();
         this.addTooltipContainer();
      }
      
      protected function assignTooltipData() : void
      {
         var _loc1_:ITooltipDataAssigner = this._currentTooltipTarget.tooltipDataAssigner;
         if(_loc1_)
         {
            _loc1_.target = this._currentTooltipContainer;
            _loc1_.data = this._currentTooltipTarget.tooltipData;
            _loc1_.assign();
         }
      }
      
      protected function updatePosition() : void
      {
         var _loc1_:* = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(this._currentTooltipContainer)
         {
            _loc1_ = this._currentTooltipTarget.getBounds(this._currentTooltipTarget.stage);
            _loc2_ = this.stage.mouseX;
            _loc3_ = this.stage.mouseY;
            if(_loc2_ < _loc1_.topLeft.x || _loc2_ > _loc1_.bottomRight.x)
            {
               this._currentTooltipContainer.visible = false;
               return;
            }
            if(_loc3_ < _loc1_.topLeft.y || _loc3_ > _loc1_.bottomRight.y)
            {
               this._currentTooltipContainer.visible = false;
               return;
            }
            this._currentTooltipContainer.visible = true;
            _loc4_ = this._currentTooltipContainer.getCalculatedWidth();
            _loc5_ = this.stage.mouseX + 16;
            _loc6_ = this.stage.stageWidth;
            if(_loc5_ + _loc4_ >= _loc6_)
            {
               _loc5_ -= _loc4_;
            }
            _loc7_ = this._currentTooltipContainer.getCalculatedHeight();
            _loc8_ = this.stage.mouseY;
            _loc9_ = this.stage.stageHeight;
            if(_loc8_ > _loc7_)
            {
               _loc8_ -= _loc7_;
            }
            this._currentTooltipContainer.x = _loc5_;
            this._currentTooltipContainer.y = _loc8_;
            this._currentTooltipContainer.forceRedraw(InvalidationType.POSITION);
         }
      }
      
      protected function updateSize() : void
      {
      }
      
      protected function removeCurrentTooltipContainer() : void
      {
         if(this._currentTooltipContainer)
         {
            if(this._tooltipLayer.contains(this._currentTooltipContainer))
            {
               this._tooltipLayer.removeChild(this._currentTooltipContainer);
               this._currentTooltipContainer.removeChildren();
               this._currentTooltipContainer = null;
            }
         }
      }
      
      protected function addTooltipContainer() : void
      {
         if(this._currentTooltipContainer)
         {
            if(!this._tooltipLayer.contains(this._currentTooltipContainer))
            {
               this._tooltipLayer.addChild(this._currentTooltipContainer);
            }
         }
      }
      
      protected function handleMouseMoveEvent(param1:MouseEvent) : void
      {
         this.updatePosition();
      }
   }
}
