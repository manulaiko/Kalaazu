package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.media.SoundTransform;
   import flash.text.TextSnapshot;
   import mx.managers.IFocusManager;
   
   public interface IContainer extends IUIComponent
   {
       
      
      function get graphics() : Graphics;
      
      function get buttonMode() : Boolean;
      
      function set buttonMode(param1:Boolean) : void;
      
      function startDrag(param1:Boolean = false, param2:Rectangle = null) : void;
      
      function stopDrag() : void;
      
      function get dropTarget() : DisplayObject;
      
      function get hitArea() : Sprite;
      
      function set hitArea(param1:Sprite) : void;
      
      function get useHandCursor() : Boolean;
      
      function set useHandCursor(param1:Boolean) : void;
      
      function get soundTransform() : SoundTransform;
      
      function set soundTransform(param1:SoundTransform) : void;
      
      function addChild(param1:DisplayObject) : DisplayObject;
      
      function addChildAt(param1:DisplayObject, param2:int) : DisplayObject;
      
      function removeChild(param1:DisplayObject) : DisplayObject;
      
      function removeChildAt(param1:int) : DisplayObject;
      
      function getChildIndex(param1:DisplayObject) : int;
      
      function setChildIndex(param1:DisplayObject, param2:int) : void;
      
      function getChildAt(param1:int) : DisplayObject;
      
      function getChildByName(param1:String) : DisplayObject;
      
      function get numChildren() : int;
      
      function get textSnapshot() : TextSnapshot;
      
      function getObjectsUnderPoint(param1:Point) : Array;
      
      function areInaccessibleObjectsUnderPoint(param1:Point) : Boolean;
      
      function get tabChildren() : Boolean;
      
      function set tabChildren(param1:Boolean) : void;
      
      function get mouseChildren() : Boolean;
      
      function set mouseChildren(param1:Boolean) : void;
      
      function contains(param1:DisplayObject) : Boolean;
      
      function swapChildrenAt(param1:int, param2:int) : void;
      
      function swapChildren(param1:DisplayObject, param2:DisplayObject) : void;
      
      function get tabEnabled() : Boolean;
      
      function set tabEnabled(param1:Boolean) : void;
      
      function get tabIndex() : int;
      
      function set tabIndex(param1:int) : void;
      
      function get focusRect() : Object;
      
      function set focusRect(param1:Object) : void;
      
      function get mouseEnabled() : Boolean;
      
      function set mouseEnabled(param1:Boolean) : void;
      
      function get doubleClickEnabled() : Boolean;
      
      function set doubleClickEnabled(param1:Boolean) : void;
      
      function get defaultButton() : IFlexDisplayObject;
      
      function set defaultButton(param1:IFlexDisplayObject) : void;
      
      function get creatingContentPane() : Boolean;
      
      function set creatingContentPane(param1:Boolean) : void;
      
      function get viewMetrics() : EdgeMetrics;
      
      function get horizontalScrollPosition() : Number;
      
      function set horizontalScrollPosition(param1:Number) : void;
      
      function get verticalScrollPosition() : Number;
      
      function set verticalScrollPosition(param1:Number) : void;
      
      function get focusManager() : IFocusManager;
   }
}
