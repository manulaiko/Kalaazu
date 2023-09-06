package mx.utils
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.display.StageDisplayState;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.IFlexDisplayObject;
   import mx.core.ILayoutElement;
   import mx.managers.ISystemManager;
   
   public class PopUpUtil
   {
       
      
      public function PopUpUtil()
      {
         super();
      }
      
      public static function positionOverComponent(param1:DisplayObject, param2:ISystemManager, param3:Number, param4:Number, param5:Number = NaN, param6:Point = null, param7:Point = null, param8:Boolean = true) : Point
      {
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc9_:ISystemManager;
         var _loc10_:DisplayObject = (_loc9_ = param2.topLevelSystemManager).getSandboxRoot();
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         if(param6)
         {
            _loc11_ = param6.x;
            _loc12_ = param6.y;
         }
         else
         {
            if(!param7)
            {
               param7 = new Point(0,0);
            }
            _loc11_ = (_loc13_ = _loc10_.globalToLocal(param1.localToGlobal(param7))).x;
            _loc12_ = _loc13_.y;
         }
         if(!isNaN(param5))
         {
            _loc12_ = (_loc14_ = _loc10_.globalToLocal(param1.localToGlobal(new Point(0,param5))).y) - param4 / 2;
         }
         if(param8)
         {
            _loc15_ = _loc9_.getVisibleApplicationRect(null,true);
            _loc16_ = _loc10_.globalToLocal(_loc15_.topLeft);
            _loc17_ = _loc10_.globalToLocal(_loc15_.bottomRight);
            _loc11_ = Math.max(_loc16_.x,Math.min(_loc17_.x - param3,_loc11_));
            _loc12_ = Math.max(_loc16_.y,Math.min(_loc17_.y - param4,_loc12_));
         }
         return new Point(_loc11_,_loc12_);
      }
      
      public static function applyPopUpTransform(param1:DisplayObjectContainer, param2:ColorTransform, param3:ISystemManager, param4:IFlexDisplayObject, param5:Point) : void
      {
         var _loc9_:* = null;
         var _loc6_:Matrix = MatrixUtil.getConcatenatedMatrix(param1,param3.getSandboxRoot());
         try
         {
            if((_loc9_ = param3.stage) && _loc9_.displayState != StageDisplayState.NORMAL && Boolean(_loc9_.fullScreenSourceRect))
            {
               param5.x += _loc9_.fullScreenSourceRect.x;
               param5.y += _loc9_.fullScreenSourceRect.y;
            }
         }
         catch(e:Error)
         {
         }
         _loc6_.tx = Math.round(param5.x);
         _loc6_.ty = Math.round(param5.y);
         if(param4 is ILayoutElement)
         {
            ILayoutElement(param4).setLayoutMatrix(_loc6_,false);
         }
         else if(param4 is DisplayObject)
         {
            DisplayObject(param4).transform.matrix = _loc6_;
         }
         var _loc7_:Number = Number(DisplayObject(param4).alpha);
         var _loc8_:ColorTransform;
         if((_loc8_ = param2) != null)
         {
            _loc8_.alphaMultiplier = _loc7_;
            _loc8_.alphaOffset = 0;
         }
         DisplayObject(param4).transform.colorTransform = _loc8_;
      }
   }
}
