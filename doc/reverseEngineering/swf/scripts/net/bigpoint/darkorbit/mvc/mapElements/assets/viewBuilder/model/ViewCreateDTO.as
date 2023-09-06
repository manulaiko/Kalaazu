package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model
{
   import net.bigpoint.darkorbit.mvc.display.class_1200;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AnimationVO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AssetDescriptionVO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AtlasResourceVO;
   
   public class ViewCreateDTO
   {
       
      
      private var _xml:String;
      
      private var _callback:Function;
      
      private var _positionList:Vector.<AssetDescriptionVO>;
      
      private var _animationVo:Vector.<AnimationVO>;
      
      private var _textureResources:Vector.<AtlasResourceVO>;
      
      private var _xmlData:XML;
      
      private var _viewBuilder:class_1200;
      
      private var _clearCache:Boolean = false;
      
      public function ViewCreateDTO(param1:String, param2:Function, param3:class_1200, param4:XML = null, param5:Boolean = false)
      {
         super();
         this._xmlData = param4;
         this._callback = param2;
         this._viewBuilder = param3;
         this._xml = param1;
         this._clearCache = param5;
      }
      
      public function get xml() : String
      {
         return this._xml;
      }
      
      public function get callback() : Function
      {
         return this._callback;
      }
      
      public function set assetDescriptionVOList(param1:Vector.<AssetDescriptionVO>) : void
      {
         this._positionList = param1;
      }
      
      public function get assetDescriptionVOList() : Vector.<AssetDescriptionVO>
      {
         return this._positionList;
      }
      
      public function get xmlData() : XML
      {
         return this._xmlData;
      }
      
      public function set xmlData(param1:XML) : void
      {
         this._xmlData = param1;
      }
      
      public function set textureResources(param1:Vector.<AtlasResourceVO>) : void
      {
         this._textureResources = param1;
      }
      
      public function get textureResources() : Vector.<AtlasResourceVO>
      {
         return this._textureResources;
      }
      
      public function getTextureResource(param1:String) : AtlasResourceVO
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._textureResources)
         {
            if(_loc2_.atlasID == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get animationVo() : Vector.<AnimationVO>
      {
         return this._animationVo;
      }
      
      public function set animationVo(param1:Vector.<AnimationVO>) : void
      {
         this._animationVo = param1;
      }
      
      public function get viewBuilder() : class_1200
      {
         return this._viewBuilder;
      }
      
      public function searchForAtlasResourceVO(param1:String) : AtlasResourceVO
      {
         var _loc3_:* = null;
         var _loc2_:uint = this.textureResources.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.textureResources[_loc4_];
            if(_loc3_.atlasID == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function set callback(param1:Function) : void
      {
         this._callback = param1;
      }
      
      public function get clearCache() : Boolean
      {
         return this._clearCache;
      }
   }
}
