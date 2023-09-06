package package_365
{
   import flash.utils.Dictionary;
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_2103
   {
       
      
      public const used:class_68 = new class_70();
      
      public const const_2704:class_68 = new class_70();
      
      private var var_378:Number = 0;
      
      private var var_3332:Dictionary;
      
      public function class_2103(param1:Number = 0)
      {
         this.var_3332 = new Dictionary(true);
         super();
         this.var_378 = param1;
      }
      
      public function method_6270(param1:Object) : class_2397
      {
         var _loc2_:class_2397 = this.var_3332[param1];
         if(_loc2_ == null)
         {
            this.var_3332[param1] = _loc2_ = new class_2397(param1,this.var_378);
            _loc2_.used.add(this.used.dispatch);
            _loc2_.const_2704.add(this.const_2704.dispatch);
         }
         return this.var_3332[param1];
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for(_loc2_ in this.var_3332)
         {
            _loc1_ = this.var_3332[_loc2_] as class_2397;
            _loc1_.dispose();
            _loc1_.used.remove(this.used.dispatch);
            _loc1_.const_2704.remove(this.const_2704.dispatch);
            this.var_3332[_loc2_] = null;
            delete this.var_3332[_loc2_];
         }
      }
   }
}
