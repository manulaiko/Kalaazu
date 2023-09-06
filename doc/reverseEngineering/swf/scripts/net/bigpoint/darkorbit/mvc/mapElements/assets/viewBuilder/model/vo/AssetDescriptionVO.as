package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo
{
   import net.bigpoint.darkorbit.mvc.display.class_1704;
   
   public class AssetDescriptionVO
   {
       
      
      private var _id:String;
      
      private var _subTexture:String;
      
      private var _props:Object;
      
      private var _atlas:String;
      
      private var _type:String;
      
      private var _minUserQuality:uint;
      
      private var _maxReductionThreshold:uint;
      
      private var _view:class_1704;
      
      public function AssetDescriptionVO(param1:String, param2:String, param3:String, param4:Object, param5:uint, param6:uint, param7:String)
      {
         super();
         this._view = this.view;
         this._maxReductionThreshold = param6;
         this._minUserQuality = param5;
         this._type = param7;
         this._atlas = param2;
         this._props = param4;
         this._id = param1;
         this._subTexture = param3;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get subTexture() : String
      {
         return this._subTexture;
      }
      
      public function get props() : Object
      {
         return this._props;
      }
      
      public function get atlas() : String
      {
         return this._atlas;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get minUserQuality() : uint
      {
         return this._minUserQuality;
      }
      
      public function get maxReductionThreshold() : uint
      {
         return this._maxReductionThreshold;
      }
      
      public function get view() : class_1704
      {
         return this._view;
      }
      
      public function set view(param1:class_1704) : void
      {
         this._view = param1;
      }
   }
}
