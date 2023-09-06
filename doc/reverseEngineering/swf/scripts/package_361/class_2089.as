package package_361
{
   public class class_2089
   {
       
      
      private var var_2300:Number = 1;
      
      private var _depth:Number = -1;
      
      public function class_2089(param1:int, param2:Number)
      {
         super();
         this.var_2300 = param2;
         this._depth = 1000 / Number(this.var_2300) + param1;
      }
      
      public function get parallaxFactor() : Number
      {
         return this.var_2300;
      }
      
      public function get depth() : int
      {
         return this._depth;
      }
   }
}
