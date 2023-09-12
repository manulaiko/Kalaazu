package net.bigpoint.as3toolbox.starling.mapfactory {

import flash.geom.Rectangle;

import starling.display.Image;
import starling.textures.SubTexture;
import starling.textures.TextureSmoothing;

public class OversizedTilesModifier implements IConfigModifier {


    private var tileID: int;

    private var _autoTileDimension: Boolean;

    private var _xTileOffset: int;

    private var _yTileOffset: int;

    public function OversizedTilesModifier(param1: Boolean = false, param2: int = 0, param3: int = 0) {
        super();
        this._autoTileDimension = param1;
        this._yTileOffset = param3;
        this._xTileOffset = param2;
    }

    public function modify(param1: IConfig): void {
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc2_: Vector.<Tile> = param1.tiles;
        if (this._autoTileDimension) {
            _loc5_ = 0;
            _loc6_ = 0;
            for each(_loc9_ in _loc2_) {
                _loc11_ = (_loc10_ = _loc9_ as Tile).image;
                if (_loc10_.image != null) {
                    if (_loc11_.width > _loc7_) {
                        _loc7_ = _loc11_.width;
                    }
                    if (_loc11_.width < _loc5_) {
                        _loc5_ = _loc11_.width;
                    }
                    if (_loc11_.height > _loc8_) {
                        _loc8_ = _loc11_.height;
                    }
                    if (_loc11_.height < _loc6_) {
                        _loc6_ = _loc11_.height;
                    }
                }
            }
            param1.tileWidth = (_loc5_ + _loc7_) / 2;
            param1.tileHeight = (_loc6_ + _loc8_) / 2;
            if (this._xTileOffset != 0) {
                param1.xOffset = this._xTileOffset * param1.tileWidth;
            }
            if (this._yTileOffset != 0) {
                param1.yOffset = this._yTileOffset * param1.tileHeight;
            }
        }
        var _loc3_: Vector.<Tile> = new Vector.<Tile>();
        this.tileID = _loc2_.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc2_.length) {
            if (_loc2_[_loc4_] != null) {
                if ((_loc13_ = (_loc12_ = _loc2_[_loc4_]).image) != null) {
                    if (_loc13_.width > param1.tileWidth || _loc13_.height > param1.tileHeight || _loc13_.width < param1.tileWidth || _loc13_.height < param1.tileHeight) {
                        this.splitTile(_loc3_, _loc12_.id, param1.map, _loc13_, param1.tileWidth, param1.tileHeight);
                    }
                }
            }
            _loc4_++;
        }
        this.joinNewTiles(_loc3_, _loc2_);
    }

    private function splitTile(param1: Vector.<Tile>, param2: int, param3: Vector.<Vector.<IMapElement>>, param4: Image, param5: int, param6: int): void {
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc18_: int = 0;
        var _loc19_: int = 0;
        var _loc20_: int = 0;
        var _loc21_: * = null;
        var _loc22_: * = null;
        var _loc23_: * = null;
        var _loc7_: int = param5 / 2 + param4.width / 2;
        var _loc8_: int = param6 / 2 + param4.height / 2;
        var _loc9_: int = Math.ceil(_loc7_ / param5) * 2 - 1;
        var _loc10_: int = Math.ceil(_loc8_ / param6) * 2 - 1;
        var _loc11_: Vector.<Vector.<Tile>> = new Vector.<Vector.<Tile>>(_loc10_, true);
        var _loc12_: int = _loc9_ * param5 / 2 + param5 / 2 - _loc7_;
        var _loc13_: int = _loc10_ * param6 / 2 + param6 / 2 - _loc8_;
        var _loc14_: Rectangle = new Rectangle();
        var _loc15_: int = 0;
        while (_loc15_ < _loc10_) {
            _loc11_[_loc15_] = new Vector.<Tile>(_loc9_, true);
            _loc16_ = 0;
            while (_loc16_ < _loc9_) {
                _loc17_ = 0;
                _loc18_ = 0;
                _loc19_ = 0;
                _loc20_ = 0;
                if (_loc16_ == 0 || _loc16_ == _loc9_ - 1) {
                    if (param4.width > param5) {
                        _loc17_ = param5 - _loc12_;
                    } else {
                        _loc17_ = param5 - _loc12_ * 2;
                    }
                } else {
                    _loc17_ = param5;
                }
                if (_loc15_ == 0 || _loc15_ == _loc10_ - 1) {
                    if (param4.height > param6) {
                        _loc18_ = param6 - _loc13_;
                    } else {
                        _loc18_ = param6 - _loc13_ * 2;
                    }
                } else {
                    _loc18_ = param6;
                }
                if (_loc16_ == _loc9_ - 1) {
                    if (param4.width > param5) {
                        _loc19_ = 0;
                    } else {
                        _loc19_ = param5 / 2 - param4.width / 2;
                    }
                } else {
                    _loc19_ = param5 - _loc17_;
                }
                if (_loc15_ == _loc10_ - 1) {
                    if (param4.height > param6) {
                        _loc20_ = 0;
                    } else {
                        _loc20_ = param6 / 2 - param4.height / 2;
                    }
                } else {
                    _loc20_ = param6 - _loc18_;
                }
                _loc14_.width = _loc17_;
                _loc14_.height = _loc18_;
                _loc14_.x = _loc16_ * param5 + _loc19_ - _loc12_;
                _loc14_.y = _loc15_ * param6 + _loc20_ - _loc13_;
                _loc21_ = new SubTexture(param4.texture, _loc14_);
                (_loc22_ = new Image(_loc21_)).smoothing = TextureSmoothing.NONE;
                _loc22_.touchable = false;
                (_loc23_ = new Tile(this.tileID, _loc22_)).xOffset = _loc19_;
                _loc23_.yOffset = _loc20_;
                ++this.tileID;
                param1.push(_loc23_);
                _loc11_[_loc15_][_loc16_] = _loc23_;
                _loc16_++;
            }
            _loc15_++;
        }
        this.referenceSplittedTile(_loc11_, param2, param3, 0, param3[0].length, 0, param3.length);
    }

    private function joinNewTiles(param1: Vector.<Tile>, param2: Vector.<Tile>): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        param2.length += param1.length;
        for each(_loc3_ in param1) {
            _loc4_ = _loc3_.id;
            param2[_loc4_] = _loc3_;
        }
    }

    private final function referenceSplittedTile(param1: Vector.<Vector.<Tile>>, param2: int, param3: Vector.<Vector.<IMapElement>>, param4: int, param5: int, param6: int, param7: int): void {
        var _loc9_: int = 0;
        var _loc10_: * = null;
        var _loc11_: int = 0;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: int = 0;
        var _loc15_: int = 0;
        var _loc16_: int = 0;
        var _loc17_: int = 0;
        var _loc18_: int = 0;
        var _loc19_: int = 0;
        var _loc20_: * = null;
        var _loc21_: * = null;
        var _loc8_: int = param6;
        while (_loc8_ < param7) {
            _loc9_ = param4;
            while (_loc9_ < param5) {
                if ((_loc11_ = (_loc10_ = param3[_loc8_][_loc9_] as IMapElement).getTileID()) == param2) {
                    _loc10_.removeTileID(param2);
                    _loc12_ = param1.length;
                    _loc14_ = ((_loc13_ = param1[0].length) - 0.5) / 2;
                    _loc15_ = (_loc12_ - 0.5) / 2;
                    _loc16_ = 0;
                    _loc17_ = _loc8_ - _loc15_;
                    while (_loc17_ < _loc8_ + _loc15_ + 1) {
                        _loc18_ = 0;
                        _loc19_ = _loc9_ - _loc14_;
                        while (_loc19_ < _loc9_ + _loc14_ + 1) {
                            if (_loc17_ >= 0 && _loc19_ >= 0 && _loc17_ < param3.length && _loc19_ < param3[0].length) {
                                if (param3[_loc17_][_loc19_]) {
                                    _loc20_ = param1[_loc16_][_loc18_];
                                    (_loc21_ = param3[_loc17_][_loc19_] as IMapElement).addTileID(_loc20_.id);
                                }
                            }
                            _loc18_++;
                            _loc19_++;
                        }
                        _loc16_++;
                        _loc17_++;
                    }
                }
                _loc9_++;
            }
            _loc8_++;
        }
    }
}
}
