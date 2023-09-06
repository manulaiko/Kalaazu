package org.osmf.net
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   import flash.net.NetConnection;
   import org.osmf.media.URLResource;
   import org.osmf.utils.OSMFStrings;
   
   public class NetConnectionFactoryBase extends EventDispatcher
   {
       
      
      public function NetConnectionFactoryBase()
      {
         super();
      }
      
      public function create(param1:URLResource) : void
      {
         throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.FUNCTION_MUST_BE_OVERRIDDEN));
      }
      
      public function closeNetConnection(param1:NetConnection) : void
      {
         param1.close();
      }
   }
}
