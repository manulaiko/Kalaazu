package net.bigpoint.darkorbit.fui.builder.xml.factories
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.builder.xml.creators.AbstractCreator;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.BitmapLayer;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.FilledBoxLayer;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.ISkinLayer;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.MovieClipLayer;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.Scale15XBitmapLayer;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.Scale15YBitmapLayer;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.Scale9BitmapLayer;
   import net.bigpoint.darkorbit.fui.components.core.skins.layers.Scale9RepeatedXYFilledBitmapLayer;
   import package_9.ResourceManager;
   
   public class SkinLayerFactory
   {
      
      public static const BITMAP_SKINLAYER:String = "BitmapLayer";
      
      public static const SCALE9BITMAP_SKINLAYER:String = "Scale9BitmapLayer";
      
      public static const SCALE15YBITMAP_SKINLAYER:String = "Scale15YBitmapLayer";
      
      public static const SCALE15XBITMAP_SKINLAYER:String = "Scale15XBitmapLayer";
      
      public static const FILLBOX_SKINLAYER:String = "FilledBoxLayer";
      
      public static const MOVIECLIP_SKINLAYER:String = "MovieClipLayer";
      
      public static const FILLMODE_REPEAT_XY:String = "repeatXY";
      
      protected static var skinLayerMap:Dictionary;
       
      
      public function SkinLayerFactory()
      {
         super();
      }
      
      protected static function initSkinLayerMapping() : void
      {
         if(skinLayerMap == null)
         {
            skinLayerMap = new Dictionary();
            skinLayerMap[BITMAP_SKINLAYER] = createBitmapLayer;
            skinLayerMap[SCALE9BITMAP_SKINLAYER] = createBitmapLayer;
            skinLayerMap[SCALE15XBITMAP_SKINLAYER] = createScale15XBitmapLayer;
            skinLayerMap[SCALE15YBITMAP_SKINLAYER] = createScale15YBitmapLayer;
            skinLayerMap[FILLBOX_SKINLAYER] = createFilledBoxLayer;
            skinLayerMap[MOVIECLIP_SKINLAYER] = createMovieClipLayer;
         }
      }
      
      public static function create(param1:XML, param2:String) : ISkinLayer
      {
         var _loc5_:* = null;
         initSkinLayerMapping();
         var _loc3_:String = param1.@classname;
         var _loc4_:Function;
         if((_loc4_ = skinLayerMap[_loc3_]) != null)
         {
            (_loc5_ = _loc4_(param1,param2)).name = param1.text();
         }
         else
         {
            UISystem.log("A SkinLayerClass with the name= {" + _loc3_ + "} doesn´t exist.",UISystem.LOG_LEVEL_WARN);
         }
         return _loc5_;
      }
      
      protected static function createBitmapLayer(param1:XML, param2:String) : ISkinLayer
      {
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc3_:String = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARYID);
         var _loc4_:String = param1.@scale9grid;
         var _loc5_:BitmapData = ResourceManager.getBitmapData(param2,_loc3_);
         if(_loc4_)
         {
            if((_loc8_ = _loc4_.split(",")).length == 4)
            {
               _loc6_ = new Scale9BitmapLayer(_loc5_,_loc8_[0],_loc8_[1],_loc8_[2],_loc8_[3]);
            }
            else if(_loc8_.length == 5)
            {
               _loc9_ = _loc8_[4];
               switch(_loc9_)
               {
                  case FILLMODE_REPEAT_XY:
                     _loc6_ = new Scale9RepeatedXYFilledBitmapLayer(_loc5_,_loc8_[0],_loc8_[1],_loc8_[2],_loc8_[3]);
                     break;
                  default:
                     _loc6_ = new BitmapLayer(_loc5_);
                     UISystem.log("Specified wrong 9scale {FillMode}.");
               }
            }
            else
            {
               _loc6_ = new BitmapLayer(_loc5_);
               UISystem.log("Wrong scale9Grid definitions. Please check parameters. Set skin without scale9Grid defintions as fallback.",UISystem.LOG_LEVEL_WARN);
            }
         }
         else
         {
            _loc6_ = new BitmapLayer(_loc5_);
         }
         var _loc7_:DisplayObject;
         (_loc7_ = _loc6_ as DisplayObject).name = _loc3_;
         return _loc6_;
      }
      
      protected static function createScale15YBitmapLayer(param1:XML, param2:String) : ISkinLayer
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:String = param1.@libraryID;
         var _loc4_:String = param1.@scale15grid;
         var _loc5_:BitmapData = ResourceManager.getBitmapData(param2,_loc3_);
         if(_loc4_)
         {
            if((_loc7_ = _loc4_.split(",")).length == 6)
            {
               _loc6_ = new Scale15YBitmapLayer(_loc5_,_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3],_loc7_[4],_loc7_[5]);
            }
            else
            {
               _loc6_ = new BitmapLayer(_loc5_);
               UISystem.log("Wrong scale15Grid definitions. Please check parameters. Set skin without scale15Grid defintions as fallback.",UISystem.LOG_LEVEL_WARN);
            }
         }
         return _loc6_;
      }
      
      protected static function createScale15XBitmapLayer(param1:XML, param2:String) : ISkinLayer
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:String = param1.@libraryID;
         var _loc4_:String = param1.@scale15grid;
         var _loc5_:BitmapData = ResourceManager.getBitmapData(param2,_loc3_);
         if(_loc4_)
         {
            if((_loc7_ = _loc4_.split(",")).length == 6)
            {
               _loc6_ = new Scale15XBitmapLayer(_loc5_,_loc7_[0],_loc7_[1],_loc7_[2],_loc7_[3],_loc7_[4],_loc7_[5]);
            }
            else
            {
               _loc6_ = new BitmapLayer(_loc5_);
               UISystem.log("Wrong scale15Grid definitions. Please check parameters. Set skin without scale15Grid defintions as fallback.",UISystem.LOG_LEVEL_WARN);
            }
         }
         return _loc6_;
      }
      
      protected static function createFilledBoxLayer(param1:XML, param2:String = null) : ISkinLayer
      {
         var _loc3_:FilledBoxLayer = new FilledBoxLayer();
         if(param1.@lineAlpha)
         {
            _loc3_.lineAlpha = param1.@lineAlpha;
         }
         if(param1.@lineColor)
         {
            _loc3_.lineColor = param1.@lineColor;
         }
         if(param1.@fillColor)
         {
            _loc3_.fillColor = param1.@fillColor;
         }
         if(param1.@fillAlpha)
         {
            _loc3_.fillAlpha = param1.@fillAlpha;
         }
         return _loc3_;
      }
      
      protected static function createMovieClipLayer(param1:XML, param2:String = null) : ISkinLayer
      {
         var _loc3_:String = param1.attribute(AbstractCreator.ATTRIBUTENAME_LIBRARYID);
         var _loc4_:MovieClip = ResourceManager.getMovieClip(param2,_loc3_);
         return new MovieClipLayer(_loc4_);
      }
   }
}
