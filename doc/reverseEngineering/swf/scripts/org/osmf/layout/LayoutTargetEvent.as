package org.osmf.layout
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class LayoutTargetEvent extends Event
   {
      
      public static const SET_AS_LAYOUT_RENDERER_CONTAINER:String = "setAsLayoutRendererContainer";
      
      public static const UNSET_AS_LAYOUT_RENDERER_CONTAINER:String = "unsetAsLayoutRendererContainer";
      
      public static const ADD_TO_LAYOUT_RENDERER:String = "addToLayoutRenderer";
      
      public static const REMOVE_FROM_LAYOUT_RENDERER:String = "removeFromLayoutRenderer";
      
      public static const ADD_CHILD_AT:String = "addChildAt";
      
      public static const REMOVE_CHILD:String = "removeChild";
      
      public static const SET_CHILD_INDEX:String = "setChildIndex";
       
      
      private var _layoutRenderer:LayoutRendererBase;
      
      private var _layoutTarget:ILayoutTarget;
      
      private var _displayObject:DisplayObject;
      
      private var _index:int;
      
      public function LayoutTargetEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:LayoutRendererBase = null, param5:ILayoutTarget = null, param6:DisplayObject = null, param7:int = -1)
      {
         this._layoutRenderer = param4;
         this._layoutTarget = param5;
         this._displayObject = param6;
         this._index = param7;
         super(param1,param2,param3);
      }
      
      public function get layoutRenderer() : LayoutRendererBase
      {
         return this._layoutRenderer;
      }
      
      public function get layoutTarget() : ILayoutTarget
      {
         return this._layoutTarget;
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._displayObject;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      override public function clone() : Event
      {
         return new LayoutTargetEvent(type,bubbles,cancelable,this._layoutRenderer,this._layoutTarget,this._displayObject,this._index);
      }
   }
}
