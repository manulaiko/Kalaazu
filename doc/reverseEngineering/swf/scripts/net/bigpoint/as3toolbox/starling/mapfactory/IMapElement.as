package net.bigpoint.as3toolbox.starling.mapfactory
{
   public interface IMapElement
   {
       
      
      function getTileIDs() : Vector.<int>;
      
      function getTileID(param1:int = 0) : int;
      
      function setTileID(param1:int, param2:int = 0) : void;
      
      function addTileID(param1:int) : void;
      
      function removeTileID(param1:int) : void;
   }
}
