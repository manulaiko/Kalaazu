package net.bigpoint.darkorbit.fui.components.buttons.toggle
{
   import com.greensock.TweenLite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
   import net.bigpoint.darkorbit.fui.components.buttons.button.ButtonSkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.AbstractSkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   
   public class ToggleButtonSkin extends AbstractSkin implements IToggleButtonSkin
   {
      
      private static var _skinLayerDefintions:Dictionary = new Dictionary();
      
      private static const STATE_IS_ACTIVE:String = "1";
      
      private static const STATE_IS_DEACTIVE:String = "2";
      
      private static const STATE_IN_TRANSITION:String = "T";
      
      {
         _skinLayerDefintions[SkinLayerNames.BACKGROUND] = {};
         _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
         _skinLayerDefintions[SkinLayerNames.OVER] = {};
      }
      
      private var _currentToggleState:String = "1";
      
      private var _xActive:Number = 2;
      
      private var _xDeactive:Number = 24;
      
      private var _transitionTime:Number = 0.5;
      
      private var _toggleButton:Button;
      
      public function ToggleButtonSkin()
      {
         super();
      }
      
      override public function getSkinLayerDefintions() : Dictionary
      {
         return _skinLayerDefintions;
      }
      
      override protected function preinitialize() : void
      {
         super.preinitialize();
         _resizablelayers = new <String>[SkinLayerNames.BACKGROUND];
      }
      
      override public function init() : void
      {
         super.init();
         if(false)
         {
            addChild(_layers[SkinLayerNames.BACKGROUND]);
         }
         this._toggleButton = new Button();
         var _loc1_:ButtonSkin = new ButtonSkin();
         if(false)
         {
            _loc1_.setSkinLayer(SkinLayerNames.NORMAL,_layers[SkinLayerNames.NORMAL]);
         }
         if(false)
         {
            _loc1_.setSkinLayer(SkinLayerNames.OVER,_layers[SkinLayerNames.OVER]);
         }
         var _loc2_:Rectangle = _loc1_.measureRawSkinSize;
         this._toggleButton.setSize(_loc2_.width,_loc2_.height);
         this._toggleButton.skin = _loc1_;
         this._toggleButton.addEventListener(MouseEvent.CLICK,this.handleMouseClickEvent);
         addChild(this._toggleButton);
      }
      
      private function handleMouseClickEvent(param1:Event = null) : void
      {
         this.changeState();
      }
      
      private function changeState() : void
      {
         if(this._currentToggleState == STATE_IN_TRANSITION)
         {
            return;
         }
         if(this._currentToggleState == STATE_IS_ACTIVE)
         {
            this._currentToggleState = STATE_IN_TRANSITION;
            TweenLite.to(this._toggleButton,this._transitionTime,{
               "x":this._xDeactive,
               "onComplete":this.setStateDeactive
            });
         }
         else
         {
            this._currentToggleState = STATE_IN_TRANSITION;
            TweenLite.to(this._toggleButton,this._transitionTime,{
               "x":this._xActive,
               "onComplete":this.setStateActive
            });
         }
      }
      
      private function setStateDeactive() : void
      {
         this._currentToggleState = STATE_IS_DEACTIVE;
         dispatchEvent(new ToggleButtonEvent(false));
      }
      
      private function setStateActive() : void
      {
         this._currentToggleState = STATE_IS_ACTIVE;
         dispatchEvent(new ToggleButtonEvent(true));
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         var _loc2_:Number = param1 - this._toggleButton.height >> 1;
         this._toggleButton.y = _loc2_;
         this._toggleButton.forceRedraw();
      }
      
      public function set xactive(param1:Number) : void
      {
         this._xActive = param1;
      }
      
      public function set xdeactive(param1:Number) : void
      {
         this._xDeactive = param1;
      }
      
      public function set duration(param1:Number) : void
      {
         this._transitionTime = param1;
      }
      
      public function get currentToggleState() : String
      {
         return this._currentToggleState;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this._toggleButton)
         {
            this._toggleButton.dispose();
         }
         this._toggleButton = null;
         TweenLite.killTweensOf(this._toggleButton);
      }
   }
}
