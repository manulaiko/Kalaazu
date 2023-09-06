package net.bigpoint.darkorbit.fui.components.bars
{
   import net.bigpoint.darkorbit.fui.components.bars.skins.IProgressBarSkin;
   import net.bigpoint.darkorbit.fui.components.bars.skins.ProgressBarSkin;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   
   public class ProgressBar extends Coreponent
   {
       
      
      private var _minValue:Number = 0;
      
      private var _maxValue:Number = 1;
      
      private var _currentValue:Number = 0;
      
      public function ProgressBar()
      {
         super();
      }
      
      public function get minValue() : Number
      {
         return this._minValue;
      }
      
      public function set minValue(param1:Number) : void
      {
         if(param1 != this._minValue)
         {
            this._minValue = param1;
            this.updateProgessbarSkin();
         }
      }
      
      public function get maxValue() : Number
      {
         return this._maxValue;
      }
      
      public function set maxValue(param1:Number) : void
      {
         if(param1 != this._maxValue)
         {
            this._maxValue = param1;
            this.updateProgessbarSkin();
         }
      }
      
      public function get currentValue() : Number
      {
         return this._currentValue;
      }
      
      public function set currentValue(param1:Number) : void
      {
         if(param1 != this._currentValue)
         {
            param1 = param1 > this._maxValue ? this._maxValue : param1;
            param1 = param1 < this._minValue ? this._minValue : param1;
            this._currentValue = param1;
            this.updateProgessbarSkin();
         }
      }
      
      override public function set skin(param1:ISkin) : void
      {
         super.skin = param1;
         invalidate(InvalidationType.SIZE);
         this.updateProgessbarSkin();
      }
      
      override protected function drawSkin() : void
      {
         super.drawSkin();
         this.updateProgessbarSkin();
      }
      
      protected function updateProgessbarSkin() : void
      {
         if(skin is ProgressBarSkin)
         {
            (skin as IProgressBarSkin).value = this.ratio;
         }
      }
      
      protected function get ratio() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = this.currentValue - this.minValue;
         var _loc3_:Number = this.maxValue - this.minValue;
         if(_loc3_ != 0)
         {
            _loc1_ = _loc2_ / _loc3_;
         }
         return _loc1_;
      }
   }
}
