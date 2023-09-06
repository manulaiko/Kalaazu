package package_298
{
   import com.greensock.TweenLite;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import net.bigpoint.as3toolbox.starling.mapfactory.IMapElement;
   import net.bigpoint.as3toolbox.starling.mapfactory.MapElement;
   import net.bigpoint.as3toolbox.starling.mapfactory.TileMap;
   import package_10.class_1173;
   import package_11.class_261;
   import package_11.class_262;
   import package_11.class_38;
   import package_22.class_1084;
   import package_22.class_168;
   import package_22.class_198;
   import package_294.class_2427;
   import package_294.class_2429;
   import package_304.class_2114;
   import package_307.class_1776;
   import package_369.class_2116;
   import package_369.class_2118;
   import package_373.class_2454;
   import package_9.ResourceManager;
   import package_9.class_50;
   import package_99.class_266;
   
   public class class_2455 extends class_2454
   {
       
      
      private const const_904:int = -3500;
      
      private var var_1604:class_2647;
      
      private var var_2323:class_1776;
      
      private var _texture:class_2116;
      
      private var var_273:int = -1;
      
      private var var_4389:int = 0;
      
      private var var_5009:class_1084;
      
      private var var_3228:Vector.<Number>;
      
      private var _indices:Vector.<uint>;
      
      private var var_172:Vector.<Number>;
      
      private var var_671:int = 0;
      
      private var _map:Vector.<Vector.<IMapElement>>;
      
      private var var_2502:int = 5000;
      
      private var var_2962:int = 5000;
      
      private var _tileWidth:Number;
      
      private var _tileHeight:Number;
      
      private var var_3644:Number = 0;
      
      private var var_857:String;
      
      public function class_2455(param1:XML = null, param2:class_1173 = null)
      {
         this.var_2323 = new class_1776(null);
         this.var_3228 = new Vector.<Number>();
         this._indices = new Vector.<uint>();
         this.var_172 = new Vector.<Number>();
         if(param1.attribute("layer").length() > 0)
         {
            this.var_4389 = int(param1.attribute("layer"));
         }
         if(param1.attribute("maskID").length() > 0)
         {
            this.var_273 = int(param1.attribute("maskID"));
         }
         var _loc3_:Number = 1;
         if(param1.attribute("mapScale").length() > 0)
         {
            _loc3_ = Number(param1.attribute("mapScale"));
         }
         var _loc4_:Number = 5;
         if(param1.attribute("tileScale").length() > 0)
         {
            _loc4_ = Number(param1.attribute("tileScale"));
         }
         this.var_5009 = class_198.var_103[int(param1.attribute("typeID"))] as class_1084;
         this.var_2502 = Number(class_50.getInstance().map.method_5076) * _loc3_;
         this.var_2962 = Number(class_50.getInstance().map.method_1901) * _loc3_;
         this._tileWidth = Number(this.var_5009.tileWidth) * _loc4_;
         this._tileHeight = Number(this.var_5009.tileHeight) * _loc4_;
         super(param1,param2);
         y = -3500 + Number(this.var_4389) * 550;
         x -= (Number(this.var_2502) - Number(class_50.getInstance().map.method_5076)) / 2;
         z += (Number(this.var_2962) - Number(class_50.getInstance().map.method_1901) - Number(this._tileWidth)) / 2;
      }
      
      override protected function method_352() : void
      {
         ResourceManager.name_15.load(this.var_5009.atlasXml,this.method_301);
      }
      
      override protected function unloadView() : void
      {
         ResourceManager.name_15.method_2379(this.var_857,this.method_254);
         ResourceManager.name_15.method_2379(this.var_5009.atlasXml,this.method_301);
         this.var_1604 = null;
         this._map = null;
         this.var_3228.length = 0;
         this._indices.length = 0;
         this.var_172.length = 0;
      }
      
      private function method_301(param1:class_262) : void
      {
         var _loc2_:XML = param1.method_4925();
         this.var_1604 = new class_2647(_loc2_);
         this._map = this.method_2275(this.var_1604.method_5567);
         if(this._map)
         {
            this.loadTexture();
         }
         else
         {
            disposeView();
         }
      }
      
      private function loadTexture() : void
      {
         this.var_857 = this.var_5009.resKeyStarling;
         if(ResourceManager.name_15.method_5888(this.var_857 + "_atf"))
         {
            this.var_857 += "_atf";
         }
         ResourceManager.name_15.load(this.var_857,this.method_254);
      }
      
      private function method_254(param1:class_38) : void
      {
         class_261(param1).data.position = 0;
         var _loc2_:class_2118 = new class_2118(class_261(param1).data);
         this._texture = _loc2_;
         this.var_2323.smooth = true;
         this.var_2323.mipmap = false;
         this.var_2323.alphaBlending = true;
         this.var_2323.alphaPremultiplied = false;
         this.var_2323.texture = _loc2_;
         this.method_1921();
      }
      
      private function method_4311(param1:Rectangle, param2:int, param3:int) : void
      {
         this.var_3644 = Math.min(-500 + Math.random() * 1000,-200);
         this.var_3228.push(param2 * Number(this._tileWidth),this.var_3644,param3 * Number(this._tileHeight));
         this.var_3228.push(param2 * Number(this._tileWidth) + this._tileWidth,this.var_3644,param3 * Number(this._tileHeight));
         this.var_3228.push(param2 * Number(this._tileWidth) + this._tileWidth,this.var_3644,param3 * Number(this._tileHeight) + this._tileHeight);
         this.var_3228.push(param2 * Number(this._tileWidth),this.var_3644,param3 * Number(this._tileHeight) + this._tileHeight);
         this._indices.push(this.var_671 + 0,this.var_671 + 2,this.var_671 + 1);
         this._indices.push(this.var_671 + 0,this.var_671 + 3,this.var_671 + 2);
         this.var_671 += 4;
         this.var_172.push(param1.x / Number(this._texture.width),param1.y / Number(this._texture.height));
         this.var_172.push(param1.x / Number(this._texture.width) + param1.width / Number(this._texture.width),param1.y / Number(this._texture.height));
         this.var_172.push(param1.x / Number(this._texture.width) + param1.width / Number(this._texture.width),param1.y / Number(this._texture.height) + param1.height / Number(this._texture.height));
         this.var_172.push(param1.x / Number(this._texture.width),param1.y / Number(this._texture.height) + param1.height / Number(this._texture.height));
      }
      
      private function method_1921() : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc1_:class_2429 = new class_2429();
         var _loc2_:class_2427 = new class_2427();
         var _loc3_:Boolean = false;
         var _loc4_:Number = Number(this._map.length);
         var _loc5_:Number = Number(this._map[0].length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc9_ = (_loc8_ = this._map[_loc6_][_loc7_] as IMapElement).getTileIDs();
               for each(_loc10_ in _loc9_)
               {
                  if(_loc10_ != -1)
                  {
                     _loc3_ = true;
                     this.method_4311(this.var_1604.method_885[_loc10_],_loc7_,-_loc6_);
                  }
               }
               _loc7_++;
            }
            _loc6_++;
         }
         if(_loc3_)
         {
            _loc2_.updateVertexData(this.var_3228);
            _loc2_.updateUVData(this.var_172);
            _loc2_.updateIndexData(this._indices);
            _loc1_.method_1586(_loc2_);
            _loc11_ = new class_2114(_loc1_,this.var_2323);
            this.var_2323.alpha = 0;
            TweenLite.to(this.var_2323,1,{"alpha":1});
            addChild(_loc11_);
         }
      }
      
      private function method_2275(param1:int) : Vector.<Vector.<IMapElement>>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc2_:int = Math.round(Number(this.var_2502) / Number(this._tileWidth));
         var _loc3_:int = Math.round(Number(this.var_2962) / Number(this._tileHeight));
         _loc2_ = _loc2_ < 1 ? 1 : _loc2_;
         _loc3_ = _loc3_ < 1 ? 1 : _loc3_;
         if(_loc2_ >= 1 && _loc3_ >= 1)
         {
            _loc6_ = TileMap.createMap(_loc2_,_loc3_);
            if((_loc9_ = this.method_3162) != null)
            {
               _loc10_ = Number(this.var_2502) / _loc9_.width;
               _loc7_ = 0;
               while(_loc7_ < _loc3_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc2_)
                  {
                     _loc11_ = Math.round((_loc8_ * Number(this._tileWidth) + Number(this._tileWidth) / 2) / _loc10_);
                     _loc12_ = Math.round((_loc7_ * Number(this._tileHeight) + Number(this._tileHeight) / 2) / _loc10_);
                     if(_loc9_.getPixel32(_loc11_,_loc12_) == 0)
                     {
                        (_loc6_[_loc7_][_loc8_] as MapElement).setTileID(-1);
                     }
                     else if(param1 <= 1)
                     {
                        _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                        (_loc6_[_loc7_][_loc8_] as MapElement).setTileID(_loc5_);
                     }
                     else
                     {
                        _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                        if(!(_loc7_ == 0 && _loc8_ == 0))
                        {
                           if(_loc7_ == 0)
                           {
                              while((_loc6_[_loc7_][_loc8_ - 1] as MapElement).getTileID() == _loc5_)
                              {
                                 _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else if(_loc8_ == 0)
                           {
                              while((_loc6_[_loc7_ - 1][_loc8_] as MapElement).getTileID() == _loc5_)
                              {
                                 _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else
                           {
                              while((_loc6_[_loc7_][_loc8_ - 1] as MapElement).getTileID() == _loc5_ || (_loc6_[_loc7_ - 1][_loc8_] as MapElement).getTileID() == _loc5_)
                              {
                                 _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                        }
                        (_loc6_[_loc7_][_loc8_] as MapElement).setTileID(_loc5_);
                     }
                     _loc8_++;
                  }
                  _loc7_++;
               }
            }
            else
            {
               if(this.var_5009.order != null)
               {
                  switch(this.var_5009.order)
                  {
                     case "DESC":
                        _loc4_ = param1;
                        break;
                     case "ASC":
                     default:
                        _loc4_ = 1;
                  }
               }
               _loc7_ = 0;
               while(_loc7_ < _loc3_)
               {
                  _loc8_ = 0;
                  for(; _loc8_ < _loc2_; _loc8_++)
                  {
                     if(this.var_5009.order == null)
                     {
                        if(param1 <= 1)
                        {
                           _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                           (_loc6_[_loc7_][_loc8_] as MapElement).setTileID(_loc5_);
                        }
                        else
                        {
                           if(_loc7_ == 0 && _loc8_ == 0)
                           {
                              _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                           }
                           else if(_loc7_ == 0)
                           {
                              while((_loc6_[_loc7_][_loc8_ - 1] as MapElement).getTileID() == _loc5_)
                              {
                                 _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else if(_loc8_ == 0)
                           {
                              while((_loc6_[_loc7_ - 1][_loc8_] as MapElement).getTileID() == _loc5_)
                              {
                                 _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else
                           {
                              while((_loc6_[_loc7_][_loc8_ - 1] as MapElement).getTileID() == _loc5_ || (_loc6_[_loc7_ - 1][_loc8_] as MapElement).getTileID() == _loc5_)
                              {
                                 _loc5_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           (_loc6_[_loc7_][_loc8_] as MapElement).setTileID(_loc5_);
                        }
                        continue;
                     }
                     (_loc6_[_loc7_][_loc8_] as MapElement).setTileID(_loc4_);
                     switch(this.var_5009.order)
                     {
                        case "DESC":
                           if(--_loc4_ < 1)
                           {
                              _loc4_ = param1;
                           }
                           break;
                        case "ASC":
                        default:
                           _loc4_++;
                           if(_loc4_ > param1)
                           {
                              _loc4_ = 1;
                           }
                           break;
                     }
                  }
                  _loc7_++;
               }
            }
         }
         return _loc6_;
      }
      
      public function get method_3162() : BitmapData
      {
         var _loc1_:class_168 = class_198.var_264[this.var_273];
         return !!_loc1_ ? ResourceManager.getBitmapData(_loc1_.resKey,"mask") : null;
      }
   }
}
