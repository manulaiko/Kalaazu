package org.osmf.net.httpstreaming
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   
   public class HTTPStreamingIndexHandlerBase extends EventDispatcher
   {
       
      
      public function HTTPStreamingIndexHandlerBase()
      {
         super();
      }
      
      public function initialize(param1:Object) : void
      {
         throw new IllegalOperationError("The initialize() method must be overridden by the derived class.");
      }
      
      public function processIndexData(param1:*, param2:Object) : void
      {
         throw new IllegalOperationError("The processIndexData() method must be overridden by the derived class.");
      }
      
      public function getFileForTime(param1:Number, param2:int) : HTTPStreamRequest
      {
         throw new IllegalOperationError("The getFileForTime() method must be overridden by the derived class.");
      }
      
      public function getNextFile(param1:int) : HTTPStreamRequest
      {
         throw new IllegalOperationError("The getNextFile() method must be overridden by the derived class.");
      }
      
      public function dvrGetStreamInfo(param1:Object) : void
      {
         throw new IllegalOperationError("The dvrGetStreamInfo() method must be overridden by the derived class.");
      }
   }
}
