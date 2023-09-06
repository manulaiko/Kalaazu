package package_431
{
   import package_386.*;
   import package_430.*;
   
   public class class_2610 extends class_2435
   {
       
      
      private var var_147:Vector.<class_2617>;
      
      public function class_2610()
      {
         this.var_147 = new Vector.<class_2617>();
         super();
         var_4797 = class_2698;
      }
      
      public function get frames() : Vector.<class_2617>
      {
         return this.var_147;
      }
      
      public function addFrame(param1:class_2617, param2:uint) : void
      {
         this.var_147.push(param1);
         var_625.push(param2);
         var_2973 = var_625.length;
         var_3419 = true;
      }
      
      override protected function method_109() : void
      {
         var _loc1_:* = 0;
         super.method_109();
         if(false)
         {
            _loc1_ = var_2973 - 1;
            while(_loc1_--)
            {
               _totalDuration += var_625[_loc1_];
            }
            if(Boolean(var_2631) || !var_3323)
            {
               _totalDuration += var_625[var_2973 - 1];
            }
         }
      }
   }
}
