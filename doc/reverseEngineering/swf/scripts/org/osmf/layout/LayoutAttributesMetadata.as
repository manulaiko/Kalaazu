package org.osmf.layout
{
   import org.osmf.events.MetadataEvent;
   import org.osmf.metadata.NonSynthesizingMetadata;
   
   class LayoutAttributesMetadata extends NonSynthesizingMetadata
   {
      
      public static const INDEX:String = "index";
      
      public static const SCALE_MODE:String = "scaleMode";
      
      public static const VERTICAL_ALIGN:String = "verticalAlign";
      
      public static const HORIZONTAL_ALIGN:String = "horizontalAlign";
      
      public static const SNAP_TO_PIXEL:String = "snapToPixel";
      
      public static const MODE:String = "layoutMode";
      
      public static const INCLUDE_IN_LAYOUT:String = "includeInLayout";
       
      
      private var _index:Number = NaN;
      
      private var _scaleMode:String;
      
      private var _verticalAlign:String;
      
      private var _horizontalAlign:String;
      
      private var _snapToPixel:Boolean;
      
      private var _layoutMode:String;
      
      private var _includeInLayout:Boolean;
      
      function LayoutAttributesMetadata()
      {
         super();
         this._verticalAlign = null;
         this._horizontalAlign = null;
         this._scaleMode = null;
         this._snapToPixel = true;
         this._layoutMode = LayoutMode.NONE;
         this._includeInLayout = true;
      }
      
      override public function getValue(param1:String) : *
      {
         if(param1 == null)
         {
            return undefined;
         }
         if(param1 == INDEX)
         {
            return this.index;
         }
         if(param1 == SCALE_MODE)
         {
            return this.scaleMode;
         }
         if(param1 == VERTICAL_ALIGN)
         {
            return this.verticalAlign;
         }
         if(param1 == HORIZONTAL_ALIGN)
         {
            return this.horizontalAlign;
         }
         if(param1 == SNAP_TO_PIXEL)
         {
            return this.snapToPixel;
         }
         if(param1 == INCLUDE_IN_LAYOUT)
         {
            return this.snapToPixel;
         }
         return undefined;
      }
      
      public function get index() : Number
      {
         return this._index;
      }
      
      public function set index(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._index != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,INDEX,param1,this._index);
            this._index = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get scaleMode() : String
      {
         return this._scaleMode;
      }
      
      public function set scaleMode(param1:String) : void
      {
         var _loc2_:* = null;
         if(this._scaleMode != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,SCALE_MODE,param1,this._scaleMode);
            this._scaleMode = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get verticalAlign() : String
      {
         return this._verticalAlign;
      }
      
      public function set verticalAlign(param1:String) : void
      {
         var _loc2_:* = null;
         if(this._verticalAlign != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,VERTICAL_ALIGN,param1,this._verticalAlign);
            this._verticalAlign = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get horizontalAlign() : String
      {
         return this._horizontalAlign;
      }
      
      public function set horizontalAlign(param1:String) : void
      {
         var _loc2_:* = null;
         if(this._horizontalAlign != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,HORIZONTAL_ALIGN,param1,this._horizontalAlign);
            this._horizontalAlign = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get snapToPixel() : Boolean
      {
         return this._snapToPixel;
      }
      
      public function set snapToPixel(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(this._snapToPixel != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,SNAP_TO_PIXEL,param1,this._snapToPixel);
            this._snapToPixel = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get layoutMode() : String
      {
         return this._layoutMode;
      }
      
      public function set layoutMode(param1:String) : void
      {
         var _loc2_:* = null;
         if(this._layoutMode != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,MODE,param1,this._layoutMode);
            this._layoutMode = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get includeInLayout() : Boolean
      {
         return this._includeInLayout;
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(this._includeInLayout != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,INCLUDE_IN_LAYOUT,param1,this._layoutMode);
            this._includeInLayout = param1;
            dispatchEvent(_loc2_);
         }
      }
   }
}
