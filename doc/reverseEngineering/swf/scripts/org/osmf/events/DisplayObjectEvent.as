package org.osmf.events
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class DisplayObjectEvent extends Event
   {
      
      public static const DISPLAY_OBJECT_CHANGE:String = "displayObjectChange";
      
      public static const MEDIA_SIZE_CHANGE:String = "mediaSizeChange";
       
      
      private var _oldDisplayObject:DisplayObject;
      
      private var _newDisplayObject:DisplayObject;
      
      private var _oldWidth:Number;
      
      private var _oldHeight:Number;
      
      private var _newWidth:Number;
      
      private var _newHeight:Number;
      
      public function DisplayObjectEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:DisplayObject = null, param5:DisplayObject = null, param6:Number = NaN, param7:Number = NaN, param8:Number = NaN, param9:Number = NaN)
      {
         super(param1,param2,param3);
         this._oldDisplayObject = param4;
         this._newDisplayObject = param5;
         this._oldWidth = param6;
         this._oldHeight = param7;
         this._newWidth = param8;
         this._newHeight = param9;
      }
      
      public function get oldDisplayObject() : DisplayObject
      {
         return this._oldDisplayObject;
      }
      
      public function get newDisplayObject() : DisplayObject
      {
         return this._newDisplayObject;
      }
      
      public function get oldWidth() : Number
      {
         return this._oldWidth;
      }
      
      public function get oldHeight() : Number
      {
         return this._oldHeight;
      }
      
      public function get newWidth() : Number
      {
         return this._newWidth;
      }
      
      public function get newHeight() : Number
      {
         return this._newHeight;
      }
      
      override public function clone() : Event
      {
         return new DisplayObjectEvent(type,bubbles,cancelable,this._oldDisplayObject,this._newDisplayObject,this._oldWidth,this._oldHeight,this._newWidth,this._newHeight);
      }
   }
}
