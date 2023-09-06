package package_485
{
   import package_386.class_2580;
   import package_465.class_2594;
   
   public class class_2716 extends class_2594
   {
       
      
      private var _min:Number;
      
      private var _max:Number;
      
      private var _delta:Number;
      
      public function class_2716(param1:String, param2:Number, param3:Number)
      {
         super(param1);
         this._min = param2;
         this._max = param3;
         this._delta = Number(this._max) - Number(this._min);
      }
      
      override public function method_1777(param1:class_2580) : void
      {
         param1[var_78] = Math.random() * Number(this._delta) + this._min;
      }
      
      override public function generateOneValue(param1:int = 0, param2:int = 1) : *
      {
         return Math.random() * Number(this._delta) + this._min;
      }
   }
}
