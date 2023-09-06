package net.bigpoint.darkorbit.fui.components.core
{
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import net.bigpoint.darkorbit.fui.components.core.interfaces.IDisposable;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkinable;
   
   public interface ICoreponent extends ISkinable, IEventDispatcher, IDisposable
   {
       
      
      function get ID() : String;
      
      function assignChildren() : void;
      
      function invalidate(param1:uint = 0) : void;
      
      function forceRedraw(param1:uint = 4294967295) : void;
      
      function forceRedraws(param1:Array = null, param2:Boolean = false) : void;
      
      function set x(param1:Number) : void;
      
      function get x() : Number;
      
      function set y(param1:Number) : void;
      
      function get y() : Number;
      
      function setPosition(param1:Number, param2:Number) : void;
      
      function get globalPosition() : Point;
      
      function set alignX(param1:String) : void;
      
      function get alignX() : String;
      
      function set alignY(param1:String) : void;
      
      function get alignY() : String;
      
      function setAlignmentActivation(param1:uint, param2:Boolean = true) : void;
      
      function set marginX(param1:Number) : void;
      
      function set marginY(param1:Number) : void;
      
      function get marginTop() : Number;
      
      function get marginBottom() : Number;
      
      function get marginLeft() : Number;
      
      function get marginRight() : Number;
      
      function get width() : Number;
      
      function get height() : Number;
      
      function set width(param1:Number) : void;
      
      function set height(param1:Number) : void;
      
      function getExplicitWidth() : Number;
      
      function getExplicitHeight() : Number;
      
      function getCalculatedWidth() : Number;
      
      function getCalculatedHeight() : Number;
      
      function get sizeHandling() : uint;
      
      function set relativeWidth(param1:Number) : void;
      
      function get relativeWidth() : Number;
      
      function set relativeHeight(param1:Number) : void;
      
      function get relativeHeight() : Number;
      
      function getChildByName(param1:String) : DisplayObject;
      
      function getChildByNameRecursively(param1:String) : ICoreponent;
      
      function selectChild(param1:String) : ICoreponent;
      
      function getAllCoreponentChildren() : Vector.<ICoreponent>;
      
      function addChild(param1:DisplayObject) : DisplayObject;
      
      function addChildAt(param1:DisplayObject, param2:int) : DisplayObject;
      
      function removeChild(param1:DisplayObject) : DisplayObject;
      
      function removeChildAt(param1:int) : DisplayObject;
      
      function removeChildren(param1:int = 0, param2:int = 2147483647) : void;
      
      function removeAllCoreponents() : void;
   }
}
