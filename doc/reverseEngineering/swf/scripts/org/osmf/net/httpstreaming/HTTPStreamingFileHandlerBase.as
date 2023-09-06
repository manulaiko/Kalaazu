package org.osmf.net.httpstreaming
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class HTTPStreamingFileHandlerBase extends EventDispatcher
   {
       
      
      public function HTTPStreamingFileHandlerBase()
      {
         super();
      }
      
      public function beginProcessFile(param1:Boolean, param2:Number) : void
      {
         throw new IllegalOperationError("The beginProcessFile() method must be overridden by HttpStreamingFileHandlerBase\'s derived class.");
      }
      
      public function get inputBytesNeeded() : Number
      {
         throw new IllegalOperationError("The inputBytesNeeded() method must be overridden by HttpStreamingFileHandlerBase\'s derived class.");
      }
      
      public function processFileSegment(param1:IDataInput) : ByteArray
      {
         throw new IllegalOperationError("The processFileSegment() method must be overridden by HttpStreamingFileHandlerBase\'s derived class.");
      }
      
      public function endProcessFile(param1:IDataInput) : ByteArray
      {
         throw new IllegalOperationError("The endProcessFile() method must be overridden by HttpStreamingFileHandlerBase\'s derived class.");
      }
      
      public function flushFileSegment(param1:IDataInput) : ByteArray
      {
         throw new IllegalOperationError("The flushFileSegment() method must be overridden by HttpStreamingFileHandlerBase\'s derived class.");
      }
   }
}
