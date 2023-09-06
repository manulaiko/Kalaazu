package package_485
{
   import package_386.class_2580;
   import package_465.class_2594;
   
   public class class_2695 extends class_2594
   {
       
      
      private var _value:Number;
      
      public function class_2695(param1:String, param2:Number)
      {
         super(param1);
         this._value = param2;
      }
      
      override public function method_1777(param1:class_2580) : void
      {
         param1[var_78] = this._value;
      }
      
      override public function generateOneValue(param1:int = 0, param2:int = 1) : *
      {
         return this._value;
      }
   }
}
