package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo
{
   public class FactoryTweenVO
   {
       
      
      private var _view:Object;
      
      private var _viewId:String;
      
      private var _time:Number;
      
      private var _props:Object;
      
      private var _minUserQuality:uint;
      
      private var _maxReductionThreshold:uint;
      
      public function FactoryTweenVO(param1:String, param2:Number, param3:Object, param4:uint, param5:uint)
      {
         super();
         this._maxReductionThreshold = param5;
         this._minUserQuality = param4;
         this._props = param3;
         this._time = param2;
         this._viewId = param1;
      }
      
      public function get view() : Object
      {
         return this._view;
      }
      
      public function set view(param1:Object) : void
      {
         this._view = param1;
      }
      
      public function get props() : Object
      {
         return this._props;
      }
      
      public function set props(param1:Object) : void
      {
         this._props = param1;
      }
      
      public function get time() : Number
      {
         return this._time;
      }
      
      public function set time(param1:Number) : void
      {
         this._time = param1;
      }
      
      public function get viewId() : String
      {
         return this._viewId;
      }
      
      public function get minUserQuality() : uint
      {
         return this._minUserQuality;
      }
      
      public function get maxReductionThreshold() : uint
      {
         return this._maxReductionThreshold;
      }
   }
}
