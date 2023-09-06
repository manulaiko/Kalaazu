package net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy
{
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   
   public class MapAssetLoadVo
   {
      
      private static const GAME:String = AssetsProxy.GAME;
       
      
      private var _expectedClass:Class;
      
      private var _embedKeys:Vector.<String>;
      
      public var callBack:Function;
      
      private var _sourceKey:String;
      
      private var _instanceId:String;
      
      private var _unloadeResources:Boolean;
      
      private var _cachBitmapData:Boolean;
      
      public function MapAssetLoadVo(param1:Function, param2:String, param3:Vector.<String>, param4:Class, param5:String = null, param6:Boolean = true, param7:Boolean = false)
      {
         super();
         this._cachBitmapData = param7;
         this._unloadeResources = param6;
         this._instanceId = param5 || GAME;
         this.callBack = param1;
         this._sourceKey = param2;
         this._embedKeys = param3;
         this._expectedClass = param4;
      }
      
      public function get expectedClass() : Class
      {
         return this._expectedClass;
      }
      
      public function get sourceKey() : String
      {
         return this._sourceKey;
      }
      
      public function get embedKeys() : Vector.<String>
      {
         return this._embedKeys;
      }
      
      public function get unloadeResources() : Boolean
      {
         return this._unloadeResources;
      }
      
      public function get instanceId() : String
      {
         return this._instanceId;
      }
      
      public function get cachBitmapData() : Boolean
      {
         return this._cachBitmapData;
      }
   }
}
