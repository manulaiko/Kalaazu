package net.bigpoint.as3toolbox.starling.mapfactory
{
   public class MapElement implements IMapElement
   {
       
      
      var tileIDs:Vector.<int>;
      
      public function MapElement()
      {
         this.tileIDs = new Vector.<int>();
         super();
      }
      
      public function getTileIDs() : Vector.<int>
      {
         return this.tileIDs;
      }
      
      public function getTileID(param1:int = 0) : int
      {
         return this.tileIDs[param1];
      }
      
      public function setTileID(param1:int, param2:int = 0) : void
      {
         this.tileIDs[param2] = param1;
      }
      
      public function addTileID(param1:int) : void
      {
         this.tileIDs.push(param1);
      }
      
      public function removeTileID(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.tileIDs.length)
         {
            if(this.tileIDs[_loc2_] == param1)
            {
               this.tileIDs.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
      }
   }
}
