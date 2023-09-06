package package_109
{
   import package_19.class_68;
   import package_19.class_70;
   import package_29.class_85;
   
   public class class_329
   {
       
      
      public const targetChanged:class_68 = new class_70(class_85);
      
      private var _target:class_85;
      
      public function class_329()
      {
         super();
      }
      
      public function get target() : class_85
      {
         return this._target;
      }
      
      public function set target(param1:class_85) : void
      {
         if(this._target != param1)
         {
            if(this._target)
            {
               this._target.const_2402.remove(this.method_3130);
            }
            this._target = param1;
            if(this._target)
            {
               this._target.const_2402.add(this.method_3130);
            }
            this.targetChanged.dispatch(this._target);
         }
      }
      
      public function cleanup() : void
      {
         this.target = null;
      }
      
      private function method_3130() : void
      {
         this.target = null;
      }
   }
}
