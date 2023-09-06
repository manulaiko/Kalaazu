package spark.layouts.supportClasses
{
   public final class Block
   {
       
      
      const sizes:Vector.<Number> = new Vector.<Number>(LinearLayoutVector.BLOCK_SIZE,true);
      
      var sizesSum:Number = 0;
      
      var defaultCount:uint;
      
      public function Block()
      {
         this.defaultCount = LinearLayoutVector.BLOCK_SIZE;
         super();
         var _loc1_:int = 0;
         while(_loc1_ < LinearLayoutVector.BLOCK_SIZE)
         {
            this.sizes[_loc1_] = NaN;
            _loc1_++;
         }
      }
   }
}
