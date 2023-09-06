package net.bigpoint.as3toolbox.starling.mapfactory
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public interface IOverlay
   {
       
      
      function drawTileOverlay(param1:BitmapData, param2:int, param3:int, param4:int, param5:Point) : void;
      
      function drawScreenOverlay(param1:BitmapData) : void;
      
      function cleanup() : void;
      
      function build() : void;
      
      function set config(param1:IConfig) : void;
   }
}
