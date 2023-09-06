package net.bigpoint.darkorbit.fui.components.bars.skins
{
   import com.greensock.TweenLite;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.components.core.skins.BasicSkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.ISkinLayer;
   
   public class ProgressBarSkin extends BasicSkin implements IProgressBarSkin
   {
      
      private static var _skinLayerDefintions:Dictionary = new Dictionary();
      
      {
         _skinLayerDefintions[SkinLayerNames.BAR] = {};
         _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
         _skinLayerDefintions[SkinLayerNames.MASK] = {};
      }
      
      private var _tweenTime:Number = 0;
      
      private var _value:Number = 0;
      
      public function ProgressBarSkin()
      {
         super();
      }
      
      public function set tweenTime(param1:Number) : void
      {
         this._tweenTime = param1;
      }
      
      override public function getSkinLayerDefintions() : Dictionary
      {
         return _skinLayerDefintions;
      }
      
      override protected function preinitialize() : void
      {
         super.preinitialize();
      }
      
      public function set value(param1:Number) : void
      {
         this._value = param1;
         this.updateProgressBar(param1);
      }
      
      private function updateProgressBar(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         if(_layers[SkinLayerNames.BAR] is ISkinLayer)
         {
            _loc2_ = _layers[SkinLayerNames.BAR] as ISkinLayer;
            _loc3_ = _width * param1;
            TweenLite.killTweensOf(_loc2_,true);
            TweenLite.to(_loc2_,this._tweenTime,{"width":_loc3_});
            _loc2_.height = _height;
         }
      }
      
      override public function init() : void
      {
         super.init();
         if(false)
         {
            addChild(_layers[SkinLayerNames.BAR]);
            showState(SkinLayerNames.BAR);
         }
         this.updateProgressBar(this._value);
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.updateProgressBar(this._value);
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this.updateProgressBar(this._value);
      }
      
      override public function clone() : ISkin
      {
         var _loc1_:IProgressBarSkin = super.clone() as IProgressBarSkin;
         _loc1_.value = this._value;
         _loc1_.tweenTime = this._tweenTime;
         return _loc1_;
      }
   }
}
