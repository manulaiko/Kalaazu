package package_10
{
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_1173
   {
       
      
      public const changed:class_68 = new class_70();
      
      private var _value:String = null;
      
      public function class_1173(param1:String = null)
      {
         super();
         this._value = param1;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function set value(param1:String) : void
      {
         if(this._value != param1)
         {
            this._value = param1;
            this.changed.dispatch();
         }
      }
      
      public function toString() : String
      {
         return this._value;
      }
   }
}
