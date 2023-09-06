package net.bigpoint.darkorbit.fui.system.loader
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.media.Sound;
   
   public interface IAssetLoader
   {
       
      
      function loadAsset(param1:String, param2:Function, param3:Function = null) : void;
      
      function getBitmap(param1:String, param2:String, param3:String = "GAME") : Bitmap;
      
      function getBitmapData(param1:String, param2:String, param3:String = "GAME") : BitmapData;
      
      function getMovieClip(param1:String, param2:String, param3:String = "GAME") : MovieClip;
      
      function getDisplayObject(param1:String, param2:String, param3:String = "GAME") : DisplayObject;
      
      function getSound(param1:String, param2:String, param3:String = "GAME") : Sound;
   }
}
