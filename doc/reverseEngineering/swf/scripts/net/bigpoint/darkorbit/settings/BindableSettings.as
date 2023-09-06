package net.bigpoint.darkorbit.settings
{
   import package_10.class_19;
   import package_19.class_68;
   import package_19.class_70;
   
   public class BindableSettings
   {
      
      public static const NONE:int = -2147483648;
      
      public static const LOW:int = 0;
      
      public static const MEDIUM:int = 1;
      
      public static const HIGH:int = 2;
      
      public static const ULTRA:int = 3;
       
      
      public const none:class_19 = new class_19(false);
      
      public const low:class_19 = new class_19(false);
      
      public const medium:class_19 = new class_19(false);
      
      public const high:class_19 = new class_19(false);
      
      public const max:class_19 = new class_19(false);
      
      public const changed:class_68 = new class_70();
      
      private var _value:int = 0;
      
      public function BindableSettings(param1:int = -2147483648)
      {
         super();
         this._value = param1;
         this.updateBooleans();
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set value(param1:int) : void
      {
         if(this._value != param1)
         {
            this._value = param1;
            this.updateBooleans();
            this.changed.dispatch();
         }
      }
      
      private function updateBooleans() : void
      {
         this.none.value = this.value >= NONE;
         this.low.value = this.value >= LOW;
         this.medium.value = this.value >= MEDIUM;
         this.high.value = this.value >= HIGH;
         this.max.value = this.value >= ULTRA;
      }
   }
}
