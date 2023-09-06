package mx.core
{
   import flash.events.IEventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   
   public interface ILayoutElement extends IEventDispatcher
   {
       
      
      function get left() : Object;
      
      function set left(param1:Object) : void;
      
      function get right() : Object;
      
      function set right(param1:Object) : void;
      
      function get top() : Object;
      
      function set top(param1:Object) : void;
      
      function get bottom() : Object;
      
      function set bottom(param1:Object) : void;
      
      function get horizontalCenter() : Object;
      
      function set horizontalCenter(param1:Object) : void;
      
      function get verticalCenter() : Object;
      
      function set verticalCenter(param1:Object) : void;
      
      function get baseline() : Object;
      
      function set baseline(param1:Object) : void;
      
      function get baselinePosition() : Number;
      
      function get percentWidth() : Number;
      
      function set percentWidth(param1:Number) : void;
      
      function get percentHeight() : Number;
      
      function set percentHeight(param1:Number) : void;
      
      function get includeInLayout() : Boolean;
      
      function set includeInLayout(param1:Boolean) : void;
      
      function getPreferredBoundsWidth(param1:Boolean = true) : Number;
      
      function getPreferredBoundsHeight(param1:Boolean = true) : Number;
      
      function getMinBoundsWidth(param1:Boolean = true) : Number;
      
      function getMinBoundsHeight(param1:Boolean = true) : Number;
      
      function getMaxBoundsWidth(param1:Boolean = true) : Number;
      
      function getMaxBoundsHeight(param1:Boolean = true) : Number;
      
      function getBoundsXAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number;
      
      function getBoundsYAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number;
      
      function getLayoutBoundsWidth(param1:Boolean = true) : Number;
      
      function getLayoutBoundsHeight(param1:Boolean = true) : Number;
      
      function getLayoutBoundsX(param1:Boolean = true) : Number;
      
      function getLayoutBoundsY(param1:Boolean = true) : Number;
      
      function setLayoutBoundsPosition(param1:Number, param2:Number, param3:Boolean = true) : void;
      
      function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void;
      
      function getLayoutMatrix() : Matrix;
      
      function setLayoutMatrix(param1:Matrix, param2:Boolean) : void;
      
      function get hasLayoutMatrix3D() : Boolean;
      
      function getLayoutMatrix3D() : Matrix3D;
      
      function setLayoutMatrix3D(param1:Matrix3D, param2:Boolean) : void;
      
      function transformAround(param1:Vector3D, param2:Vector3D = null, param3:Vector3D = null, param4:Vector3D = null, param5:Vector3D = null, param6:Vector3D = null, param7:Vector3D = null, param8:Boolean = true) : void;
   }
}
