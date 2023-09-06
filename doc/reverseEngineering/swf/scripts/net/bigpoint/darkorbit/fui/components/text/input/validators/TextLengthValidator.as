package net.bigpoint.darkorbit.fui.components.text.input.validators
{
   import flash.text.TextField;
   
   public class TextLengthValidator implements IInputValidator
   {
       
      
      private var _instance:TextField;
      
      private var _valid:Boolean = true;
      
      private var _max:uint = 52;
      
      private var _min:uint = 3;
      
      public function TextLengthValidator()
      {
         super();
      }
      
      public function isValid() : Boolean
      {
         return this.validate();
      }
      
      public function validate() : Boolean
      {
         var _loc1_:* = 0;
         this._valid = false;
         if(this._instance)
         {
            _loc1_ = this._instance.text.length;
            if(_loc1_ > this._min && _loc1_ < this._max)
            {
               this._valid = true;
            }
            else
            {
               this._valid = false;
            }
         }
         return this._valid;
      }
      
      public function set source(param1:Object) : void
      {
         this._instance = param1 as TextField;
      }
      
      public function get source() : Object
      {
         return null;
      }
      
      public function dispose() : void
      {
      }
   }
}
