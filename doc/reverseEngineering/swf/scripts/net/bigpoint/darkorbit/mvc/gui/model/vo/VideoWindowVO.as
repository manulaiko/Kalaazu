package net.bigpoint.darkorbit.mvc.gui.model.vo
{
   public class VideoWindowVO
   {
       
      
      private var _languageKeys:Vector.<String>;
      
      private var _videoWindowId:int;
      
      private var _videoId:int;
      
      private var _videoClassId:int;
      
      private var _showButtons:Boolean;
      
      private var _align:String;
      
      private var _width:int;
      
      private var _height:int;
      
      public function VideoWindowVO(param1:Vector.<String>, param2:int, param3:int, param4:int, param5:Boolean = true, param6:String = "n", param7:int = 400, param8:int = 183)
      {
         super();
         this._languageKeys = param1;
         this._videoWindowId = param2;
         this._videoId = param3;
         this._videoClassId = param4;
         this._showButtons = param5;
         this._align = param6;
         this._width = param7;
         this._height = param8;
      }
      
      public function get languageKeys() : Vector.<String>
      {
         return this._languageKeys;
      }
      
      public function get videoWindowId() : int
      {
         return this._videoWindowId;
      }
      
      public function get videoId() : int
      {
         return this._videoId;
      }
      
      public function get videoClassId() : int
      {
         return this._videoClassId;
      }
      
      public function get showButtons() : Boolean
      {
         return this._showButtons;
      }
      
      public function get align() : String
      {
         return this._align;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
   }
}
