package org.osmf.traits
{
   import flash.display.DisplayObject;
   import org.osmf.events.DisplayObjectEvent;
   
   public class DisplayObjectTrait extends MediaTraitBase
   {
       
      
      private var _displayObject:DisplayObject;
      
      private var _mediaWidth:Number = 0;
      
      private var _mediaHeight:Number = 0;
      
      public function DisplayObjectTrait(param1:DisplayObject, param2:Number = 0, param3:Number = 0)
      {
         super(MediaTraitType.DISPLAY_OBJECT);
         this._displayObject = param1;
         this._mediaWidth = param2;
         this._mediaHeight = param3;
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      public function get mediaWidth() : Number
      {
         return this._mediaWidth;
      }
      
      public function get mediaHeight() : Number
      {
         return this._mediaHeight;
      }
      
      protected final function setDisplayObject(param1:DisplayObject) : void
      {
         var _loc2_:* = null;
         if(this._displayObject != param1)
         {
            this.displayObjectChangeStart(param1);
            _loc2_ = this._displayObject;
            this._displayObject = param1;
            this.displayObjectChangeEnd(_loc2_);
         }
      }
      
      protected final function setMediaSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != this._mediaWidth || param2 != this._mediaHeight)
         {
            this.mediaSizeChangeStart(param1,param2);
            _loc3_ = this._mediaWidth;
            _loc4_ = this._mediaHeight;
            this._mediaWidth = param1;
            this._mediaHeight = param2;
            this.mediaSizeChangeEnd(_loc3_,_loc4_);
         }
      }
      
      protected function displayObjectChangeStart(param1:DisplayObject) : void
      {
      }
      
      protected function displayObjectChangeEnd(param1:DisplayObject) : void
      {
         dispatchEvent(new DisplayObjectEvent(DisplayObjectEvent.DISPLAY_OBJECT_CHANGE,false,false,param1,this._displayObject));
      }
      
      protected function mediaSizeChangeStart(param1:Number, param2:Number) : void
      {
      }
      
      protected function mediaSizeChangeEnd(param1:Number, param2:Number) : void
      {
         dispatchEvent(new DisplayObjectEvent(DisplayObjectEvent.MEDIA_SIZE_CHANGE,false,false,null,null,param1,param2,this._mediaWidth,this._mediaHeight));
      }
   }
}
