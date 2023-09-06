package package_10
{
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_2254
   {
       
      
      private var _value:Vector.<Object>;
      
      private var var_31:class_68;
      
      private var _unique:Boolean;
      
      public function class_2254(param1:Vector.<Object> = null, param2:Boolean = false)
      {
         this._value = new Vector.<Object>();
         this.var_31 = new class_70();
         super();
         this._value = param1 || this._value;
         this._unique = param2;
      }
      
      public function removeElement(param1:Object) : void
      {
         var _loc2_:int = int(this._value.indexOf(param1));
         if(_loc2_ != -1)
         {
            this._value.splice(_loc2_,1);
            this.var_31.dispatch();
         }
      }
      
      private function method_877(param1:Object) : Boolean
      {
         return this._value.indexOf(param1) != -1;
      }
      
      public function addElement(param1:Object) : void
      {
         if(this._unique)
         {
            if(!this.method_877(param1))
            {
               this._value.push(param1);
               this.var_31.dispatch();
            }
         }
         else
         {
            this._value.push(param1);
            this.var_31.dispatch();
         }
      }
      
      public function getElementAt(param1:uint) : Object
      {
         return this._value[param1];
      }
      
      public function get changed() : class_68
      {
         return this.var_31;
      }
      
      public function get length() : uint
      {
         return this._value.length;
      }
      
      public function clear() : void
      {
         this._value.length = 0;
      }
      
      public function method_52(param1:Class) : Object
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._value)
         {
            if(_loc2_ is param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get value() : Vector.<Object>
      {
         return this._value;
      }
      
      public function set value(param1:Vector.<Object>) : void
      {
         this._value = param1;
         this.var_31.dispatch();
      }
   }
}
