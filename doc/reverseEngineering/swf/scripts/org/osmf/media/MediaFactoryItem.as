package org.osmf.media
{
   import org.osmf.utils.OSMFStrings;
   
   public class MediaFactoryItem
   {
       
      
      private var _id:String;
      
      private var _canHandleResourceFunction:Function;
      
      private var _mediaElementCreationFunction:Function;
      
      private var _type:String;
      
      public function MediaFactoryItem(param1:String, param2:Function, param3:Function, param4:String = null)
      {
         super();
         if(param1 == null || param2 == null || param3 == null)
         {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
         param4 = param4 || true;
         this._id = param1;
         this._canHandleResourceFunction = param2;
         this._mediaElementCreationFunction = param3;
         this._type = param4;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get canHandleResourceFunction() : Function
      {
         return this._canHandleResourceFunction;
      }
      
      public function get mediaElementCreationFunction() : Function
      {
         return this._mediaElementCreationFunction;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
