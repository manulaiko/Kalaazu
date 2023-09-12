package net.bigpoint.as3toolbox.starling.mapfactory {

import starling.display.Image;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.textures.TextureSmoothing;

public class Config implements IConfig {


    protected var _viewportWidth: int;

    protected var _viewportHeight: int;

    protected var _tileWidth: int;

    protected var _tileHeight: int;

    protected var _map: Vector.<Vector.<IMapElement>>;

    protected var _texture: Texture;

    protected var _xml: XML;

    protected var _tiles: Vector.<Tile>;

    protected var _xOffset: int;

    protected var _yOffset: int;

    protected var _atlas: TextureAtlas;

    public function Config(param1: TextureAtlas, param2: Vector.<Vector.<IMapElement>>, param3: int, param4: int, param5: int, param6: int, param7: int = 0, param8: int = 0) {
        this._tiles = new Vector.<Tile>();
        super();
        this._atlas = param1;
        this._texture = this.texture;
        this._xml = this.xml;
        this._map = param2;
        this._viewportWidth = param3;
        this._viewportHeight = param4;
        this._tileWidth = param5;
        this._tileHeight = param6;
        this._xOffset = param7;
        this._yOffset = param8;
        if (param1 != null && param2 != null) {
            this.init();
        }
    }

    protected function init(param1: Boolean = false): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc2_: Vector.<Texture> = this._atlas.getTextures();
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            _loc4_ = null;
            if (param1) {
                _loc4_ = this._atlas.getTexture("texture_" + _loc3_);
            } else {
                _loc4_ = _loc2_[_loc3_];
            }
            (_loc5_ = new Image(_loc4_)).touchable = false;
            _loc5_.smoothing = TextureSmoothing.NONE;
            _loc6_ = new Tile(_loc3_, _loc5_);
            this._tiles.push(_loc6_);
            _loc3_++;
        }
    }

    public function get viewportWidth(): int {
        return this._viewportWidth;
    }

    public function set viewportWidth(param1: int): void {
        this._viewportWidth = param1;
    }

    public function get viewportHeight(): int {
        return this._viewportHeight;
    }

    public function set viewportHeight(param1: int): void {
        this._viewportHeight = param1;
    }

    public function get tileWidth(): int {
        return this._tileWidth;
    }

    public function get tileHeight(): int {
        return this._tileHeight;
    }

    public function get map(): Vector.<Vector.<IMapElement>> {
        return this._map;
    }

    public function set map(param1: Vector.<Vector.<IMapElement>>): void {
        this._map = param1;
    }

    public function get xOffset(): int {
        return this._xOffset;
    }

    public function get yOffset(): int {
        return this._yOffset;
    }

    public function set tileWidth(param1: int): void {
        this._tileWidth = param1;
    }

    public function set tileHeight(param1: int): void {
        this._tileHeight = param1;
    }

    public function set xOffset(param1: int): void {
        this._xOffset = param1;
    }

    public function set yOffset(param1: int): void {
        this._yOffset = param1;
    }

    public function get texture(): Texture {
        return this._texture;
    }

    public function set texture(param1: Texture): void {
        this._texture = param1;
    }

    public function get xml(): XML {
        return this._xml;
    }

    public function set xml(param1: XML): void {
        this._xml = param1;
    }

    public function get atlas(): TextureAtlas {
        return this._atlas;
    }

    public function get tiles(): Vector.<Tile> {
        return this._tiles;
    }

    public function set tiles(param1: Vector.<Tile>): void {
        this._tiles = param1;
    }
}
}
