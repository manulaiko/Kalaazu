package package_37
{
   public class class_1213
   {
       
      
      private var var_2431:uint = 0;
      
      private var ready:Boolean = false;
      
      public function class_1213()
      {
         super();
      }
      
      public function method_5511() : Boolean
      {
         return this.ready;
      }
      
      public function reset() : void
      {
         this.var_2431 = 0;
         this.ready = false;
      }
      
      public function setLength(param1:uint) : void
      {
         this.var_2431 = param1;
         this.ready = true;
      }
      
      public function method_5153() : uint
      {
         return this.var_2431;
      }
   }
}
