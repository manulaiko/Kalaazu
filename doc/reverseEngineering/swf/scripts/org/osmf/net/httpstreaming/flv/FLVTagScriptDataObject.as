package org.osmf.net.httpstreaming.flv
{
   import flash.net.ObjectEncoding;
   
   public class FLVTagScriptDataObject extends FLVTag
   {
       
      
      public function FLVTagScriptDataObject(param1:int = 18)
      {
         super(param1);
      }
      
      public function get objects() : Array
      {
         var _loc1_:Array = new Array();
         bytes.position = TAG_HEADER_BYTE_COUNT;
         while(false)
         {
            _loc1_.push(bytes.readObject());
         }
         return _loc1_;
      }
      
      public function set objects(param1:Array) : void
      {
         var _loc2_:* = null;
         bytes.objectEncoding = ObjectEncoding.AMF0;
         bytes.length = TAG_HEADER_BYTE_COUNT;
         bytes.position = TAG_HEADER_BYTE_COUNT;
         for each(_loc2_ in param1)
         {
            bytes.writeObject(_loc2_);
         }
         dataSize = 0 - Number(TAG_HEADER_BYTE_COUNT);
      }
   }
}
