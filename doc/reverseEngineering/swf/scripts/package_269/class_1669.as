package package_269
{
   import flash.utils.ByteArray;
   
   public class class_1669 extends ByteArray
   {
       
      
      private const const_1522:uint = 1024;
      
      private const const_3076:uint = 256;
      
      public function class_1669()
      {
         super();
         this.method_8();
      }
      
      private function method_8() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc1_:int = 0;
         while(_loc1_ < 256)
         {
            _loc2_ = 0;
            while(_loc2_ < 1024)
            {
               _loc3_ = Math.random() * 256 & 255;
               this.writeByte(_loc3_);
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function method_809() : void
      {
      }
      
      public function pack() : void
      {
      }
   }
}
