package package_29
{
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_84
   {
       
      
      public const name_110:class_68 = new class_70();
      
      public const name_33:class_68 = new class_70();
      
      private var var_910:Vector.<class_267>;
      
      public function class_84()
      {
         this.var_910 = new Vector.<class_267>();
         super();
      }
      
      public function get traits() : Vector.<class_267>
      {
         return this.var_910;
      }
      
      public function addTrait(param1:class_267) : class_267
      {
         var _loc2_:int = int(this.var_910.indexOf(param1));
         if(_loc2_ == -1)
         {
            this.var_910.push(param1);
            this.name_110.dispatch(param1);
         }
         return param1;
      }
      
      public function removeTrait(param1:class_267) : class_267
      {
         var _loc2_:int = int(this.var_910.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.var_910.splice(_loc2_,1);
            this.name_33.dispatch(param1);
         }
         return param1;
      }
      
      public function removeAllTraits() : void
      {
         while(this.var_910.length > 0)
         {
            this.removeTrait(this.var_910[0]);
         }
      }
   }
}
