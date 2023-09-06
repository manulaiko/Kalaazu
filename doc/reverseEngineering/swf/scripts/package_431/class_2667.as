package package_431
{
   import package_386.*;
   import package_430.*;
   
   public class class_2667 extends class_2435
   {
       
      
      private var var_147:Vector.<class_2666>;
      
      public function class_2667()
      {
         this.var_147 = new Vector.<class_2666>();
         super();
         var_4797 = class_2707;
      }
      
      public function get frames() : Vector.<class_2666>
      {
         return this.var_147;
      }
      
      public function addFrame(param1:class_2666, param2:uint) : void
      {
         this.var_147.push(param1);
         var_625.push(param2);
         var_2973 = var_625.length;
         var_3419 = false;
      }
   }
}
