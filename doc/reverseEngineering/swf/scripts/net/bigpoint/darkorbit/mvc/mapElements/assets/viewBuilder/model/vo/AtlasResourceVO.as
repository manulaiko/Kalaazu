package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo
{
   public class AtlasResourceVO
   {
       
      
      private var _atlasID:String;
      
      private var _atlasResources:String;
      
      private var _textureResource:String;
      
      public function AtlasResourceVO(param1:String, param2:String, param3:String)
      {
         super();
         this._textureResource = param3;
         this._atlasResources = param2;
         this._atlasID = param1;
      }
      
      public function get atlasID() : String
      {
         return this._atlasID;
      }
      
      public function get atlasResources() : String
      {
         return this._atlasResources;
      }
      
      public function get textureResource() : String
      {
         return this._textureResource;
      }
   }
}
