package net.bigpoint.as3toolbox.starling.mapfactory
{
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   
   public interface IConfig
   {
       
      
      function get viewportWidth() : int;
      
      function set viewportWidth(param1:int) : void;
      
      function get viewportHeight() : int;
      
      function set viewportHeight(param1:int) : void;
      
      function get tileWidth() : int;
      
      function get tileHeight() : int;
      
      function get map() : Vector.<Vector.<IMapElement>>;
      
      function set map(param1:Vector.<Vector.<IMapElement>>) : void;
      
      function get xOffset() : int;
      
      function get yOffset() : int;
      
      function set tileWidth(param1:int) : void;
      
      function set tileHeight(param1:int) : void;
      
      function set xOffset(param1:int) : void;
      
      function set yOffset(param1:int) : void;
      
      function get texture() : Texture;
      
      function set texture(param1:Texture) : void;
      
      function get xml() : XML;
      
      function set xml(param1:XML) : void;
      
      function get atlas() : TextureAtlas;
      
      function get tiles() : Vector.<Tile>;
      
      function set tiles(param1:Vector.<Tile>) : void;
   }
}
