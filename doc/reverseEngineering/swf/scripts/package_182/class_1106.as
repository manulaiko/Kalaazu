package package_182
{
   import flash.display.Sprite;
   
   public class class_1106 extends Sprite
   {
       
      
      public var var_3345:Array;
      
      public var var_2998:class_1107;
      
      public function class_1106()
      {
         this.var_3345 = [];
         super();
      }
      
      public function method_2038(param1:class_1107) : void
      {
         this.var_2998 = param1;
         this.addChild(param1);
      }
      
      public function method_4790() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_3345)
         {
            if(_loc1_ != null)
            {
               this.removeChild(_loc1_);
            }
         }
         this.var_3345 = [];
      }
      
      public function method_4677(param1:int) : void
      {
         var _loc2_:class_1107 = this.var_3345[param1] as class_1107;
         if(_loc2_ != null)
         {
            this.removeChild(_loc2_);
            this.var_3345[param1] = null;
         }
      }
      
      public function method_4401(param1:class_1107) : void
      {
         this.var_3345[param1.gearID] = param1;
         this.addChild(param1);
      }
      
      public function method_2188(param1:int) : class_1107
      {
         return this.var_3345[param1] as class_1107;
      }
   }
}
