package org.osmf.layout
{
   import org.osmf.events.MetadataEvent;
   import org.osmf.metadata.NonSynthesizingMetadata;
   
   class PaddingLayoutMetadata extends NonSynthesizingMetadata
   {
      
      public static const LEFT:String = "left";
      
      public static const TOP:String = "top";
      
      public static const RIGHT:String = "right";
      
      public static const BOTTOM:String = "bottom";
       
      
      private var _left:Number;
      
      private var _top:Number;
      
      private var _right:Number;
      
      private var _bottom:Number;
      
      function PaddingLayoutMetadata()
      {
         super();
      }
      
      override public function getValue(param1:String) : *
      {
         if(param1 == null)
         {
            return undefined;
         }
         if(param1 == LEFT)
         {
            return this.left;
         }
         if(param1 == TOP)
         {
            return this.top;
         }
         if(param1 == RIGHT)
         {
            return this.right;
         }
         if(param1 == BOTTOM)
         {
            return this.bottom;
         }
         return undefined;
      }
      
      public function get left() : Number
      {
         return this._left;
      }
      
      public function set left(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._left != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,LEFT,param1,this._left);
            this._left = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get top() : Number
      {
         return this._top;
      }
      
      public function set top(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._top != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,TOP,param1,this._top);
            this._top = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get right() : Number
      {
         return this._right;
      }
      
      public function set right(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._right != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,RIGHT,param1,this._right);
            this._right = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get bottom() : Number
      {
         return this._bottom;
      }
      
      public function set bottom(param1:Number) : void
      {
         var _loc2_:* = null;
         if(this._bottom != param1)
         {
            _loc2_ = new MetadataEvent(MetadataEvent.VALUE_CHANGE,false,false,BOTTOM,param1,this._bottom);
            this._bottom = param1;
            dispatchEvent(_loc2_);
         }
      }
   }
}
