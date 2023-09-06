package net.bigpoint.darkorbit.map.view2D.backgrounds.view
{
   import com.greensock.TweenLite;
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   import net.bigpoint.as3toolbox.starling.mapfactory.Config;
   import net.bigpoint.as3toolbox.starling.mapfactory.IMapElement;
   import net.bigpoint.as3toolbox.starling.mapfactory.MapElement;
   import net.bigpoint.as3toolbox.starling.mapfactory.OversizedTilesModifier;
   import net.bigpoint.as3toolbox.starling.mapfactory.TileMap;
   import net.bigpoint.as3toolbox.starling.mapfactory.TileMapBuilder;
   import net.bigpoint.darkorbit.mvc.display.class_1207;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_11.class_261;
   import package_11.class_262;
   import package_11.class_38;
   import package_22.class_1084;
   import package_282.TexturesCache;
   import package_290.class_2091;
   import package_361.class_2090;
   import package_9.ResourceManager;
   import package_99.class_266;
   import starling.textures.ConcreteTexture;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   import starling.textures.TextureOptions;
   
   public class class_2088 extends class_2087
   {
       
      
      public var offsetX:int = 0;
      
      public var offsetY:int = 0;
      
      private var var_3026:TileMap;
      
      private var width:int;
      
      private var height:int;
      
      private var _viewportWidth:int = 0;
      
      private var _viewportHeight:int = 0;
      
      public var var_1459:Boolean = false;
      
      private var _texture:Texture;
      
      private var var_1852:XML;
      
      public function class_2088(param1:class_2090, param2:int, param3:int)
      {
         super(new class_1207(),param1);
         if(this.method_1134.pattern.width > 0 && this.method_1134.pattern.height > 0)
         {
            this.width = this.method_1134.pattern.width;
            this.height = this.method_1134.pattern.height;
         }
         else if(this.method_1134.pattern.order == "ASC" || this.method_1134.pattern.order == "DESC")
         {
            this.width = Math.round(param2 / 10 * Number(this.method_1134.scale));
            this.height = Math.round(param3 / 10 * Number(this.method_1134.scale));
         }
         else
         {
            this.width = Math.round(param2 / Number(this.method_1134.parallaxFactor) * Number(this.method_1134.scale) * Number(this.method_1134.method_3228));
            this.height = Math.round(param3 / Number(this.method_1134.parallaxFactor) * Number(this.method_1134.scale) * Number(this.method_1134.method_3228));
         }
      }
      
      public function get method_1134() : class_2090
      {
         return data as class_2090;
      }
      
      override public function method_3361(param1:int, param2:int) : void
      {
         super.method_3361(param1,param2);
         this._viewportWidth = param1;
         this._viewportHeight = param2;
         this.method_352();
      }
      
      override public function update(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(this.var_3026)
         {
            this.var_3026.setPosition(int(-param1 / Number(this.method_1134.parallaxFactor) + param3 + this.offsetX),int(-param2 / Number(this.method_1134.parallaxFactor) + param4 + this.offsetY));
         }
      }
      
      override protected function method_352() : void
      {
         if(this.method_3258())
         {
            ResourceManager.name_15.load(this.method_1134.pattern.atlasXml,this.method_301);
         }
         else
         {
            this.unloadView();
         }
      }
      
      override protected function method_3258() : Boolean
      {
         if(this.method_1134 is class_2091)
         {
            return Settings.qualityPoizone.value >= Settings.QUALITY_MEDIUM;
         }
         return Settings.qualityBackground.value == Settings.QUALITY_HIGH;
      }
      
      override protected function unloadView() : void
      {
         this.method_2491();
         this.var_1852 = null;
         if(this._texture)
         {
            if(this._texture is ConcreteTexture)
            {
               ConcreteTexture(this._texture).onRestore = null;
            }
            this._texture.dispose();
            this._texture = null;
         }
         super.unloadView();
      }
      
      private function method_301(param1:class_262) : void
      {
         if(this.method_3258())
         {
            this.var_1852 = param1.method_4925();
            this.loadTexture();
         }
         else
         {
            this.unloadView();
         }
         param1.dispose();
      }
      
      private function loadTexture() : void
      {
         var _loc1_:* = this.method_1134.pattern.resKeyStarling;
         if(false && Boolean(ResourceManager.name_15.method_5888(_loc1_ + "_atf")))
         {
            _loc1_ += "_atf";
         }
         ResourceManager.name_15.load(_loc1_,this.method_254);
      }
      
      private function method_254(param1:class_38) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.method_3258())
         {
            if(param1 is class_261)
            {
               _loc2_ = class_261(param1).data as ByteArray;
            }
            if(this._texture)
            {
               TexturesCache.method_1424(this._texture,_loc2_);
               this.method_3543();
            }
            else
            {
               _loc3_ = new TextureOptions();
               _loc3_.onReady = this.method_3543;
               this._texture = Texture.fromData(_loc2_,_loc3_);
               ConcreteTexture(this._texture).onRestore = this.loadTexture;
            }
         }
         else
         {
            this.unloadView();
         }
         param1.dispose();
      }
      
      private function method_3543() : void
      {
         this.method_2491();
         var _loc1_:TextureAtlas = new TextureAtlas(this._texture,this.var_1852);
         if(this.method_1134.scale != 1)
         {
            this.offsetX = -Math.round((Number(this.width) - Number(this.width) / Number(this.method_1134.scale)) / 2) + this.method_1134.shiftX;
            this.offsetY = -Math.round((Number(this.height) - Number(this.height) / Number(this.method_1134.scale)) / 2) + this.method_1134.shiftY;
         }
         else
         {
            this.offsetX = this.method_1134.shiftX;
            this.offsetY = this.method_1134.shiftY;
         }
         var _loc2_:Vector.<Vector.<IMapElement>> = this.method_2275(_loc1_.getTextures().length);
         var _loc3_:int = this._viewportWidth + Number(this.method_1134.pattern.tileWidth) * 2;
         var _loc4_:int = this._viewportHeight + Number(this.method_1134.pattern.tileHeight) * 2;
         var _loc5_:Config = new Config(_loc1_,_loc2_,_loc3_,_loc4_,this.method_1134.pattern.tileWidth,this.method_1134.pattern.tileHeight,this.method_1134.pattern.tileWidth,this.method_1134.pattern.tileHeight);
         this.var_3026 = new TileMapBuilder(_loc5_).withConfigModifier(new OversizedTilesModifier()).build();
         this.var_3026.x = -Number(this.method_1134.pattern.tileWidth);
         this.var_3026.y = -Number(this.method_1134.pattern.tileHeight);
         view.addUntypedChild(this.var_3026);
         this.var_3026.alpha = 0;
         TweenLite.to(this.var_3026,1,{"alpha":1});
      }
      
      private function method_2275(param1:int) : Vector.<Vector.<IMapElement>>
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc2_:class_1084 = this.method_1134.pattern;
         var _loc3_:int = Math.round(Number(this.width) / Number(_loc2_.tileWidth));
         var _loc4_:int = Math.round(Number(this.height) / Number(_loc2_.tileHeight));
         _loc3_ = _loc3_ < 1 ? 1 : _loc3_;
         _loc4_ = _loc4_ < 1 ? 1 : _loc4_;
         if(_loc3_ >= 1 && _loc4_ >= 1)
         {
            _loc7_ = TileMap.createMap(_loc3_,_loc4_);
            if((_loc10_ = this.method_1134.method_3162) != null)
            {
               _loc11_ = Number(this.width) / _loc10_.width;
               _loc8_ = 0;
               while(_loc8_ < _loc4_)
               {
                  _loc9_ = 0;
                  while(_loc9_ < _loc3_)
                  {
                     _loc12_ = Math.round((_loc9_ * Number(_loc2_.tileWidth) + Number(_loc2_.tileWidth) / 2) / _loc11_);
                     _loc13_ = Math.round((_loc8_ * Number(_loc2_.tileHeight) + Number(_loc2_.tileHeight) / 2) / _loc11_);
                     if(_loc10_.getPixel32(_loc12_,_loc13_) == 0)
                     {
                        (_loc7_[_loc8_][_loc9_] as MapElement).setTileID(-1);
                     }
                     else if(Boolean(this.var_1459) || param1 <= 1)
                     {
                        _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                        (_loc7_[_loc8_][_loc9_] as MapElement).setTileID(_loc6_);
                     }
                     else
                     {
                        _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                        if(!(_loc8_ == 0 && _loc9_ == 0))
                        {
                           if(_loc8_ == 0)
                           {
                              while((_loc7_[_loc8_][_loc9_ - 1] as MapElement).getTileID() == _loc6_)
                              {
                                 _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else if(_loc9_ == 0)
                           {
                              while((_loc7_[_loc8_ - 1][_loc9_] as MapElement).getTileID() == _loc6_)
                              {
                                 _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else
                           {
                              while((_loc7_[_loc8_][_loc9_ - 1] as MapElement).getTileID() == _loc6_ || (_loc7_[_loc8_ - 1][_loc9_] as MapElement).getTileID() == _loc6_)
                              {
                                 _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                        }
                        (_loc7_[_loc8_][_loc9_] as MapElement).setTileID(_loc6_);
                     }
                     _loc9_++;
                  }
                  _loc8_++;
               }
            }
            else
            {
               if(_loc2_.order != null)
               {
                  switch(_loc2_.order)
                  {
                     case "DESC":
                        _loc5_ = param1;
                        break;
                     case "ASC":
                     default:
                        _loc5_ = 1;
                  }
               }
               _loc8_ = 0;
               while(_loc8_ < _loc4_)
               {
                  _loc9_ = 0;
                  for(; _loc9_ < _loc3_; _loc9_++)
                  {
                     if(_loc2_.order == null)
                     {
                        if(Boolean(this.var_1459) || param1 <= 1)
                        {
                           _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                           (_loc7_[_loc8_][_loc9_] as MapElement).setTileID(_loc6_);
                        }
                        else
                        {
                           if(_loc8_ == 0 && _loc9_ == 0)
                           {
                              _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                           }
                           else if(_loc8_ == 0)
                           {
                              while((_loc7_[_loc8_][_loc9_ - 1] as MapElement).getTileID() == _loc6_)
                              {
                                 _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else if(_loc9_ == 0)
                           {
                              while((_loc7_[_loc8_ - 1][_loc9_] as MapElement).getTileID() == _loc6_)
                              {
                                 _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           else
                           {
                              while((_loc7_[_loc8_][_loc9_ - 1] as MapElement).getTileID() == _loc6_ || (_loc7_[_loc8_ - 1][_loc9_] as MapElement).getTileID() == _loc6_)
                              {
                                 _loc6_ = int(class_266.getRandomCount(0,param1 - 1));
                              }
                           }
                           (_loc7_[_loc8_][_loc9_] as MapElement).setTileID(_loc6_);
                        }
                        continue;
                     }
                     (_loc7_[_loc8_][_loc9_] as MapElement).setTileID(_loc5_);
                     switch(_loc2_.order)
                     {
                        case "DESC":
                           if(--_loc5_ < 1)
                           {
                              _loc5_ = param1;
                           }
                           break;
                        case "ASC":
                        default:
                           _loc5_++;
                           if(_loc5_ > param1)
                           {
                              _loc5_ = 1;
                           }
                           break;
                     }
                  }
                  _loc8_++;
               }
            }
         }
         return _loc7_;
      }
      
      private function method_2491() : void
      {
         if(this.var_3026)
         {
            view.removeUntypedChild(this.var_3026);
            this.var_3026.dispose();
            this.var_3026 = null;
         }
      }
   }
}
