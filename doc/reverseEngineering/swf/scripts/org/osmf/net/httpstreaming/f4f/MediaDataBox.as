package org.osmf.net.httpstreaming.f4f
{
   import flash.utils.ByteArray;
   
   class MediaDataBox extends Box
   {
       
      
      private var _data:ByteArray;
      
      function MediaDataBox()
      {
         super();
      }
      
      public function get data() : ByteArray
      {
         return this._data;
      }
      
      public function set data(param1:ByteArray) : void
      {
         this._data = param1;
      }
   }
}
