package net.bigpoint.as3toolbox.starling.mapfactory
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.display.Image;
   import starling.display.QuadBatch;
   import starling.display.Sprite;
   import starling.events.Event;
   
   public class TileMap extends Sprite
   {
       
      
      private var tileRect:Rectangle;
      
      private var max_tiles_x:int;
      
      private var max_tiles_y:int;
      
      private var maxFitTilesX:int;
      
      private var maxFitTilesY:int;
      
      private var dX:int;
      
      private var dY:int;
      
      private var lastPX:int = -2147483648;
      
      private var lastPY:int = -2147483648;
      
      private var pX:int;
      
      private var pY:int;
      
      private var oldXOffset:int = -2147483648;
      
      private var oldYOffset:int = -2147483648;
      
      private var _id:int;
      
      private var offsetPoint:Point;
      
      private var xOffset:int;
      
      private var yOffset:int;
      
      protected var _config:IConfig;
      
      private var container:Sprite;
      
      private var quadBatch:QuadBatch;
      
      public function TileMap(param1:IConfig)
      {
         this.offsetPoint = new Point();
         this.quadBatch = new QuadBatch();
         super();
         this._config = param1;
         this.init();
      }
      
      public static function createMap(param1:int, param2:int, param3:Boolean = false, param4:Boolean = true) : Vector.<Vector.<IMapElement>>
      {
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc5_:Vector.<Vector.<IMapElement>> = new Vector.<Vector.<IMapElement>>(param2,param3);
         var _loc6_:int = 0;
         while(_loc6_ < param2)
         {
            _loc5_[_loc6_] = new Vector.<IMapElement>(param1,param3);
            _loc7_ = 0;
            while(_loc7_ < param1)
            {
               if(param4)
               {
                  (_loc8_ = new MapElement()).setTileID(-1);
                  _loc5_[_loc6_][_loc7_] = _loc8_;
               }
               else
               {
                  _loc5_[_loc6_][_loc7_] = null;
               }
               _loc7_++;
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      private final function init() : void
      {
         this.container = new Sprite();
         this.container.addChild(this.quadBatch);
         this.tileRect = new Rectangle();
         this.tileRect.width = this._config.tileWidth;
         this.tileRect.height = this._config.tileHeight;
         this.maxFitTilesX = Math.ceil(this._config.viewportWidth / this._config.tileWidth) + 2;
         this.maxFitTilesY = Math.ceil(this._config.viewportHeight / this._config.tileHeight) + 2;
         this.max_tiles_y = this._config.map.length;
         this.max_tiles_x = this._config.map[0].length;
         this.touchable = false;
         this.container.touchable = false;
         this.container.x = -this._config.tileWidth;
         this.container.y = -this._config.tileHeight;
         addChild(this.container);
         addEventListener(Event.ADDED_TO_STAGE,this.handleAddedToStageEvent);
      }
      
      private final function handleAddedToStageEvent(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.handleAddedToStageEvent);
         this.copyTiles();
      }
      
      function copyTiles() : void
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc1_:int = this.pX + this.maxFitTilesX - 1;
         var _loc2_:int = this.pY + this.maxFitTilesY - 1;
         var _loc4_:Vector.<Tile> = this._config.tiles;
         this.quadBatch.reset();
         var _loc5_:int = this.pY;
         while(_loc5_ < _loc2_ - this.dY)
         {
            _loc6_ = 0;
            _loc7_ = this.pX;
            while(_loc7_ < _loc1_ - this.dX)
            {
               if(_loc7_ >= 0 && _loc7_ < this.max_tiles_x && _loc5_ >= 0 && _loc5_ < this.max_tiles_y)
               {
                  _loc9_ = (_loc8_ = this._config.map[_loc5_][_loc7_] as IMapElement).getTileIDs();
                  for each(_loc10_ in _loc9_)
                  {
                     if(_loc10_ != -1 && _loc10_ < _loc4_.length)
                     {
                        (_loc12_ = (_loc11_ = _loc4_[_loc10_]).image).x = _loc6_ * this.tileRect.width + this.tileRect.width + _loc11_.xOffset;
                        _loc12_.y = _loc3_ * this.tileRect.height + this.tileRect.height + _loc11_.yOffset;
                        this.quadBatch.addImage(_loc12_);
                     }
                  }
               }
               _loc6_++;
               _loc7_++;
            }
            _loc3_++;
            _loc5_++;
         }
      }
      
      public final function setPosition(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._config.map != null && parent != null)
         {
            this.xOffset = param1;
            this.yOffset = param2;
            if(param1 != this.oldXOffset || param2 != this.oldYOffset)
            {
               this.pX = (this.xOffset + this._config.xOffset) / -this._config.tileWidth;
               this.pY = (this.yOffset + this._config.yOffset) / -this._config.tileHeight;
               _loc3_ = this.pX * this._config.tileWidth;
               _loc4_ = this.pY * this._config.tileHeight;
               if(this.pX != this.lastPX || this.pY != this.lastPY)
               {
                  this.copyTiles();
               }
               this.lastPX = this.pX;
               this.lastPY = this.pY;
               this.container.x = this.xOffset + this._config.xOffset + _loc3_ - this._config.tileWidth;
               this.container.y = this.yOffset + this._config.yOffset + _loc4_ - this._config.tileHeight;
               this.oldXOffset = this.xOffset;
               this.oldYOffset = this.yOffset;
            }
         }
      }
      
      public function getPosition() : Point
      {
         this.offsetPoint.x = this.xOffset;
         this.offsetPoint.y = this.yOffset;
         return this.offsetPoint;
      }
      
      public final function get id() : int
      {
         return this._id;
      }
      
      public final function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function setTileID(param1:int, param2:int, param3:int) : Boolean
      {
         var _loc4_:* = null;
         if(param2 >= 0 && param2 < this._config.map.length && param1 >= 0 && param1 < this._config.map[0].length)
         {
            (_loc4_ = this._config.map[param2][param1]).setTileID(param3);
            this.copyTiles();
            return true;
         }
         return false;
      }
      
      public final function cleanup() : void
      {
         var _loc1_:* = null;
         this._config.tiles = null;
         this._config.map = null;
         for each(_loc1_ in this._config.tiles)
         {
            this.quadBatch.reset();
            this.quadBatch.dispose();
            _loc1_.image.dispose();
         }
         this.container.dispose();
         this.tileRect = null;
         if(this.hasEventListener(Event.ADDED_TO_STAGE))
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.handleAddedToStageEvent);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.dispose();
      }
      
      public function setViewportDimension(param1:int, param2:int) : void
      {
         this.maxFitTilesX = Math.ceil(param1 / this._config.tileWidth) + 2;
         this.maxFitTilesY = Math.ceil(param2 / this._config.tileHeight) + 2;
         this.copyTiles();
      }
   }
}
