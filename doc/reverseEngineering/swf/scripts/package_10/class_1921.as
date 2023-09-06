package package_10
{
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_1921
   {
       
      
      private var _value;
      
      public const changed:class_68 = new class_70();
      
      public function class_1921(param1:* = null)
      {
         super();
         this._value = param1;
      }
      
      public function get value() : *
      {
         return this._value;
      }
      
      public function set value(param1:*) : void
      {
         if(this._value !== param1)
         {
            this._value = param1;
            this.changed.dispatch();
         }
      }
   }
}
