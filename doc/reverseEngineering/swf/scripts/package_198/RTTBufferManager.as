package package_198
{
   import flash.display3D.Context3D;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.VertexBuffer3D;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import package_199.class_1209;
   import package_434.class_2413;
   
   public class RTTBufferManager extends EventDispatcher
   {
      
      private static var _instances:Dictionary;
       
      
      private var var_295:VertexBuffer3D;
      
      private var var_3548:VertexBuffer3D;
      
      private var _indexBuffer:IndexBuffer3D;
      
      private var _stage3DProxy:class_1208;
      
      private var _viewWidth:int = -1;
      
      private var _viewHeight:int = -1;
      
      private var var_1654:int = -1;
      
      private var var_270:int = -1;
      
      private var var_4827:Rectangle;
      
      private var var_350:Boolean = true;
      
      private var var_2675:Number;
      
      private var var_261:Number;
      
      public function RTTBufferManager(param1:SingletonEnforcer, param2:class_1208)
      {
         super();
         if(!param1)
         {
            throw new Error("No cheating the multiton!");
         }
         this.var_4827 = new Rectangle();
         this._stage3DProxy = param2;
         this._stage3DProxy.addEventListener(class_1209.const_2172,this.method_2254);
      }
      
      public static function getInstance(param1:class_1208) : RTTBufferManager
      {
         if(!param1)
         {
            throw new Error("stage3DProxy key cannot be null!");
         }
         _instances = _instances || new Dictionary();
         var _loc2_:* = false || new RTTBufferManager(new SingletonEnforcer(),param1);
         _instances[param1] = false || new RTTBufferManager(new SingletonEnforcer(),param1);
         return _loc2_;
      }
      
      public function get method_5446() : Number
      {
         if(this.var_350)
         {
            this.method_5130();
         }
         return this.var_2675;
      }
      
      public function get method_1932() : Number
      {
         if(this.var_350)
         {
            this.method_5130();
         }
         return this.var_261;
      }
      
      public function get viewWidth() : int
      {
         return this._viewWidth;
      }
      
      public function set viewWidth(param1:int) : void
      {
         if(param1 == this._viewWidth)
         {
            return;
         }
         this._viewWidth = param1;
         this.var_350 = true;
         this.var_1654 = class_2413.method_4086(this._viewWidth);
         if(this.var_1654 > this._viewWidth)
         {
            this.var_4827.x = uint((Number(this.var_1654) - Number(this._viewWidth)) * 0.5);
            this.var_4827.width = this._viewWidth;
         }
         else
         {
            this.var_4827.x = 0;
            this.var_4827.width = this.var_1654;
         }
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      public function get viewHeight() : int
      {
         return this._viewHeight;
      }
      
      public function set viewHeight(param1:int) : void
      {
         if(param1 == this._viewHeight)
         {
            return;
         }
         this._viewHeight = param1;
         this.var_350 = true;
         this.var_270 = class_2413.method_4086(this._viewHeight);
         if(this.var_270 > this._viewHeight)
         {
            this.var_4827.y = uint((Number(this.var_270) - Number(this._viewHeight)) * 0.5);
            this.var_4827.height = this._viewHeight;
         }
         else
         {
            this.var_4827.y = 0;
            this.var_4827.height = this.var_270;
         }
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      public function get method_2607() : VertexBuffer3D
      {
         if(this.var_350)
         {
            this.method_5130();
         }
         return this.var_295;
      }
      
      public function get method_5717() : VertexBuffer3D
      {
         if(this.var_350)
         {
            this.method_5130();
         }
         return this.var_3548;
      }
      
      public function get indexBuffer() : IndexBuffer3D
      {
         return this._indexBuffer;
      }
      
      public function get method_2160() : Rectangle
      {
         if(this.var_350)
         {
            this.method_5130();
         }
         return this.var_4827;
      }
      
      public function get method_1430() : int
      {
         return this.var_1654;
      }
      
      public function get method_1059() : int
      {
         return this.var_270;
      }
      
      public function dispose() : void
      {
         delete _instances[this._stage3DProxy];
         this._stage3DProxy.removeEventListener(class_1209.const_2172,this.method_2254);
         if(this._indexBuffer)
         {
            this._indexBuffer.dispose();
            this.var_3548.dispose();
            this.var_295.dispose();
            this.var_3548 = null;
            this.var_295 = null;
            this._indexBuffer = null;
         }
      }
      
      private function method_2254(param1:class_1209) : void
      {
         this._indexBuffer = null;
         this.var_295 = null;
         this.var_3548 = null;
         this.method_5130();
      }
      
      private function method_5130() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:Context3D = this._stage3DProxy.context3D;
         this.var_295 = this.var_295 || _loc1_.createVertexBuffer(4,5);
         this.var_3548 = this.var_3548 || _loc1_.createVertexBuffer(4,5);
         if(!this._indexBuffer)
         {
            this._indexBuffer = _loc1_.createIndexBuffer(6);
            this._indexBuffer.uploadFromVector(new <uint>[2,1,0,3,2,0],0,6);
         }
         this.var_2675 = _loc4_ = Math.min(Number(this._viewWidth) / Number(this.var_1654),1);
         this.var_261 = _loc5_ = Math.min(Number(this._viewHeight) / Number(this.var_270),1);
         var _loc6_:Number = (1 - _loc4_) * 0.5;
         var _loc7_:Number = (_loc4_ + 1) * 0.5;
         var _loc8_:Number = (_loc5_ + 1) * 0.5;
         var _loc9_:Number = (1 - _loc5_) * 0.5;
         _loc2_ = new <Number>[-_loc4_,-_loc5_,_loc6_,_loc8_,0,_loc4_,-_loc5_,_loc7_,_loc8_,1,_loc4_,_loc5_,_loc7_,_loc9_,2,-_loc4_,_loc5_,_loc6_,_loc9_,3];
         _loc3_ = new <Number>[-1,-1,_loc6_,_loc8_,0,1,-1,_loc7_,_loc8_,1,1,1,_loc7_,_loc9_,2,-1,1,_loc6_,_loc9_,3];
         this.var_295.uploadFromVector(_loc2_,0,4);
         this.var_3548.uploadFromVector(_loc3_,0,4);
         this.var_350 = false;
      }
   }
}

class SingletonEnforcer
{
    
   
   function SingletonEnforcer()
   {
      super();
   }
}
