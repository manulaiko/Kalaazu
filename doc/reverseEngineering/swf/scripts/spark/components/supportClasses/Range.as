package spark.components.supportClasses
{
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class Range extends SkinnableComponent
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _maximum:Number = 100;
      
      private var maxChanged:Boolean = false;
      
      private var _minimum:Number = 0;
      
      private var minChanged:Boolean = false;
      
      private var _stepSize:Number = 1;
      
      private var stepSizeChanged:Boolean = false;
      
      private var _value:Number = 0;
      
      private var _changedValue:Number = 0;
      
      private var valueChanged:Boolean = false;
      
      private var _snapInterval:Number = 1;
      
      private var snapIntervalChanged:Boolean = false;
      
      private var _explicitSnapInterval:Boolean = false;
      
      public function Range()
      {
         super();
      }
      
      public function get maximum() : Number
      {
         return this._maximum;
      }
      
      public function set maximum(param1:Number) : void
      {
         if(param1 == this._maximum)
         {
            return;
         }
         this._maximum = param1;
         this.maxChanged = true;
         invalidateProperties();
      }
      
      public function get minimum() : Number
      {
         return this._minimum;
      }
      
      public function set minimum(param1:Number) : void
      {
         if(param1 == this._minimum)
         {
            return;
         }
         this._minimum = param1;
         this.minChanged = true;
         invalidateProperties();
      }
      
      public function get stepSize() : Number
      {
         return this._stepSize;
      }
      
      public function set stepSize(param1:Number) : void
      {
         if(param1 == this._stepSize)
         {
            return;
         }
         this._stepSize = param1;
         this.stepSizeChanged = true;
         invalidateProperties();
      }
      
      [Bindable(event="valueCommit")]
      public function get value() : Number
      {
         return this.valueChanged ? this._changedValue : this._value;
      }
      
      public function set value(param1:Number) : void
      {
         if(param1 == this.value)
         {
            return;
         }
         this._changedValue = param1;
         this.valueChanged = true;
         invalidateProperties();
      }
      
      public function get snapInterval() : Number
      {
         return this._snapInterval;
      }
      
      public function set snapInterval(param1:Number) : void
      {
         this._explicitSnapInterval = true;
         if(param1 == this._snapInterval)
         {
            return;
         }
         if(isNaN(param1))
         {
            this._snapInterval = 1;
            this._explicitSnapInterval = false;
         }
         else
         {
            this._snapInterval = param1;
         }
         this.snapIntervalChanged = true;
         this.stepSizeChanged = true;
         invalidateProperties();
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:Number = NaN;
         super.commitProperties();
         if(this.minimum > this.maximum)
         {
            if(!this.maxChanged)
            {
               this._minimum = this._maximum;
            }
            else
            {
               this._maximum = this._minimum;
            }
         }
         if(this.stepSizeChanged || this.snapIntervalChanged)
         {
            if(this._explicitSnapInterval)
            {
               this._stepSize = this.nearestValidSize(this._stepSize);
               this.stepSizeChanged = true;
            }
            else
            {
               this._snapInterval = this._stepSize;
               this.snapIntervalChanged = true;
            }
         }
         if(this.valueChanged || this.maxChanged || this.minChanged || this.stepSizeChanged || this.snapIntervalChanged)
         {
            _loc1_ = this.valueChanged ? this._changedValue : this._value;
            this.valueChanged = false;
            this.maxChanged = false;
            this.minChanged = false;
            this.stepSizeChanged = false;
            this.snapIntervalChanged = false;
            this.setValue(this.nearestValidValue(_loc1_,this.snapInterval));
         }
      }
      
      private function nearestValidSize(param1:Number) : Number
      {
         var _loc2_:Number = this.snapInterval;
         if(_loc2_ == 0)
         {
            return param1;
         }
         var _loc3_:Number = Math.round(param1 / _loc2_) * _loc2_;
         return Math.abs(_loc3_) < _loc2_ ? _loc2_ : _loc3_;
      }
      
      protected function nearestValidValue(param1:Number, param2:Number) : Number
      {
         var _loc8_:* = null;
         if(param2 == 0)
         {
            return Math.max(this.minimum,Math.min(this.maximum,param1));
         }
         var _loc3_:Number = this.maximum - this.minimum;
         var _loc4_:Number = 1;
         param1 -= this.minimum;
         if(param2 != Math.round(param2))
         {
            _loc8_ = new String(1 + param2).split(".");
            _loc4_ = Math.pow(10,_loc8_[1].length);
            _loc3_ *= _loc4_;
            param1 = Math.round(param1 * _loc4_);
            param2 = Math.round(param2 * _loc4_);
         }
         var _loc5_:Number = Math.max(0,Math.floor(param1 / param2) * param2);
         var _loc6_:Number = Math.min(_loc3_,Math.floor((param1 + param2) / param2) * param2);
         var _loc7_:Number;
         return (_loc7_ = param1 - _loc5_ >= (_loc6_ - _loc5_) / 2 ? _loc6_ : _loc5_) / _loc4_ + this.minimum;
      }
      
      protected function setValue(param1:Number) : void
      {
         if(this._value == param1)
         {
            return;
         }
         if(!isNaN(this.maximum) && !isNaN(this.minimum) && this.maximum > this.minimum)
         {
            this._value = Math.min(this.maximum,Math.max(this.minimum,param1));
         }
         else
         {
            this._value = param1;
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      public function changeValueByStep(param1:Boolean = true) : void
      {
         if(this.stepSize == 0)
         {
            return;
         }
         var _loc2_:Number = param1 ? this.value + this.stepSize : this.value - this.stepSize;
         this.setValue(this.nearestValidValue(_loc2_,this.snapInterval));
      }
   }
}
