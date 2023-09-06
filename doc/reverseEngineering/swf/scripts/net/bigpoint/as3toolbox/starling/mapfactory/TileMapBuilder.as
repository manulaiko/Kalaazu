package net.bigpoint.as3toolbox.starling.mapfactory
{
   public class TileMapBuilder
   {
       
      
      protected var config:IConfig;
      
      private var overlays:Vector.<IOverlay>;
      
      public function TileMapBuilder(param1:IConfig)
      {
         this.overlays = new Vector.<IOverlay>();
         super();
         this.config = param1;
      }
      
      public function withConfigModifier(param1:IConfigModifier) : TileMapBuilder
      {
         param1.modify(this.config);
         return this;
      }
      
      public function withOverlay(param1:IOverlay) : TileMapBuilder
      {
         param1.config = this.config;
         this.overlays.push(param1);
         return this;
      }
      
      public function build() : TileMap
      {
         return new TileMap(this.config);
      }
   }
}
