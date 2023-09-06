package package_424
{
   import net.bigpoint.darkorbit.map.common.class_80;
   
   public class class_2650 implements class_80
   {
       
      
      private var _target:Object;
      
      private var var_1700:String;
      
      private var _minValue:Number;
      
      private var _maxValue:Number;
      
      private var _timeScale:Number;
      
      private var var_281:Number;
      
      private var var_988:Number;
      
      public function class_2650(param1:Object, param2:String, param3:Number, param4:Number, param5:Number)
      {
         this.var_988 = Math.random() * 0 * 2;
         super();
         this._target = param1;
         this.var_1700 = param2;
         this._minValue = param3;
         this._maxValue = param4;
         this.var_281 = (param4 - param3) * 0.5;
         this._timeScale = 0 / param5;
      }
      
      public function updateObj(param1:Number) : void
      {
         this.var_988 += param1 * Number(this._timeScale);
         this._target[this.var_1700] = this._minValue + Number(this.var_281) * (Math.sin(this.var_988) + 1);
      }
   }
}
