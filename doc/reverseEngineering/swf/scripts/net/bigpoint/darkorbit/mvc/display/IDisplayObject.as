package net.bigpoint.darkorbit.mvc.display
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public interface IDisplayObject
   {
       
      
      function addUntypedChild(param1:Object) : void;
      
      function method_3151(param1:Object) : Boolean;
      
      function method_266(param1:Object) : Boolean;
      
      function method_33(param1:int, param2:Boolean = true) : Object;
      
      function removeUntypedChild(param1:Object, param2:Boolean = true) : Object;
      
      function removeFromParent(param1:Boolean = true) : void;
      
      function get method_1052() : Object;
      
      function method_1532(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void;
      
      function method_1899(param1:String, param2:Function, param3:Boolean = false) : void;
      
      function method_1032(param1:Object) : Boolean;
      
      function hasEventListener(param1:String) : Boolean;
      
      function method_990(param1:Point) : Point;
      
      function method_4347(param1:Point) : Point;
      
      function get method_2826() : Object;
      
      function get method_5539() : Object;
      
      function get method_4142() : Number;
      
      function set method_4142(param1:Number) : void;
      
      function method_2394(param1:Object = null) : void;
      
      function method_2392(param1:Object, param2:Rectangle = null) : Rectangle;
      
      function get transformationMatrix() : Matrix;
      
      function set mouseEnabled(param1:Boolean) : void;
      
      function set mouseChildren(param1:Boolean) : void;
      
      function set buttonMode(param1:Boolean) : void;
      
      function get numChildren() : int;
      
      function get x() : Number;
      
      function set x(param1:Number) : void;
      
      function get y() : Number;
      
      function set y(param1:Number) : void;
      
      function get alpha() : Number;
      
      function set alpha(param1:Number) : void;
      
      function get scaleX() : Number;
      
      function set scaleX(param1:Number) : void;
      
      function get scaleY() : Number;
      
      function set scaleY(param1:Number) : void;
      
      function get width() : Number;
      
      function set width(param1:Number) : void;
      
      function get height() : Number;
      
      function set height(param1:Number) : void;
      
      function get mouseX() : Number;
      
      function get mouseY() : Number;
      
      function get visible() : Boolean;
      
      function set visible(param1:Boolean) : void;
      
      function set useHandCursor(param1:Boolean) : void;
      
      function set doubleClickEnabled(param1:Boolean) : void;
   }
}
