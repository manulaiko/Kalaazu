package package_198
{
   import away3d.arcane;
   import flash.events.TouchEvent;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import package_199.class_2097;
   import package_295.class_1752;
   import package_295.class_1762;
   import package_296.class_1754;
   import package_296.class_2096;
   import package_296.class_2098;
   
   public class Touch3DManager
   {
      
      protected static var var_4846:Dictionary;
      
      protected static var var_1037:Dictionary;
      
      private static var var_182:Vector.<class_2097> = new Vector.<class_2097>();
       
      
      private var var_943:Boolean = true;
      
      private var var_235:Vector3D;
      
      private var var_2372:uint;
      
      private var var_1126:TouchPoint;
      
      private var var_952:class_1754;
      
      private var var_580:class_1754;
      
      private var var_1336:Vector.<TouchPoint>;
      
      private var var_225:Dictionary;
      
      private var var_1133:TouchEvent;
      
      private var var_961:Boolean;
      
      private var var_3236:class_2096;
      
      private var _view:class_1762;
      
      public function Touch3DManager()
      {
         this.var_235 = new Vector3D();
         this.var_1133 = new TouchEvent(TouchEvent.TOUCH_MOVE);
         this.var_3236 = class_2098.const_2509;
         super();
         this.var_1336 = new Vector.<TouchPoint>();
         this.var_225 = new Dictionary();
         var_4846 = new Dictionary();
         var_1037 = new Dictionary();
      }
      
      public function method_5745() : void
      {
         var _loc1_:Number = 0;
         if(Boolean(this.var_961) || Boolean(this.var_943))
         {
            while(_loc1_ < this.var_2372)
            {
               this.var_1126 = this.var_1336[_loc1_];
               this.var_952 = this.var_3236.method_3281(this.var_1126.x,this.var_1126.y,this._view);
               var_4846[this.var_1126.id] = this.var_952;
               _loc1_++;
            }
         }
      }
      
      public function method_4361() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc1_ = 0;
         while(_loc1_ < this.var_2372)
         {
            this.var_1126 = this.var_1336[_loc1_];
            this.var_952 = var_4846[this.var_1126.id];
            this.var_580 = var_1037[this.var_1126.id];
            if(this.var_952 != this.var_580)
            {
               if(this.var_580)
               {
                  this.method_4483(class_2097.TOUCH_OUT,this.var_1133,this.var_580,this.var_1126);
               }
               if(this.var_952)
               {
                  this.method_4483(class_2097.TOUCH_OVER,this.var_1133,this.var_952,this.var_1126);
               }
            }
            if(Boolean(this.var_961) && Boolean(this.var_952))
            {
               this.method_4483(class_2097.TOUCH_MOVE,this.var_1133,this.var_952,this.var_1126);
            }
            _loc1_++;
         }
         _loc2_ = 0;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = var_182[_loc1_];
            _loc4_ = _loc3_.object;
            while(Boolean(_loc4_) && !_loc4_.arcane::var_3982)
            {
               _loc4_ = _loc4_.parent;
            }
            if(_loc4_)
            {
               _loc4_.dispatchEvent(_loc3_);
            }
            _loc1_++;
         }
         var_182.length = 0;
         this.var_943 = false;
         _loc1_ = 0;
         while(_loc1_ < this.var_2372)
         {
            this.var_1126 = this.var_1336[_loc1_];
            var_1037[this.var_1126.id] = var_4846[this.var_1126.id];
            _loc1_++;
         }
      }
      
      public function method_2058(param1:class_1762) : void
      {
         param1.addEventListener(TouchEvent.TOUCH_BEGIN,this.method_2783);
         param1.addEventListener(TouchEvent.TOUCH_MOVE,this.method_2200);
         param1.addEventListener(TouchEvent.TOUCH_END,this.method_4437);
      }
      
      public function method_3726(param1:class_1762) : void
      {
         param1.removeEventListener(TouchEvent.TOUCH_BEGIN,this.method_2783);
         param1.removeEventListener(TouchEvent.TOUCH_MOVE,this.method_2200);
         param1.removeEventListener(TouchEvent.TOUCH_END,this.method_4437);
      }
      
      public function dispose() : void
      {
         this.var_3236.dispose();
         this.var_1336 = null;
         this.var_225 = null;
         var_4846 = null;
         var_1037 = null;
      }
      
      private function method_4483(param1:String, param2:TouchEvent, param3:class_1754, param4:TouchPoint) : void
      {
         var _loc5_:class_2097;
         (_loc5_ = new class_2097(param1)).ctrlKey = param2.ctrlKey;
         _loc5_.altKey = param2.altKey;
         _loc5_.shiftKey = param2.shiftKey;
         _loc5_.var_4548 = param4.x;
         _loc5_.var_2761 = param4.y;
         _loc5_.touchPointID = param4.id;
         if(param3)
         {
            _loc5_.object = param3.entity;
            _loc5_.var_3785 = param3.var_3785;
            _loc5_.var_247 = param3.var_247;
            _loc5_.name_53 = !!param3.name_53 ? param3.name_53.clone() : null;
            _loc5_.var_2450 = !!param3.var_2450 ? param3.var_2450.clone() : null;
            _loc5_.index = param3.index;
            _loc5_.var_4499 = param3.var_4499;
         }
         else
         {
            _loc5_.var_247 = null;
            _loc5_.object = null;
            _loc5_.name_53 = this.var_235;
            _loc5_.var_2450 = this.var_235;
            _loc5_.index = 0;
            _loc5_.var_4499 = 0;
         }
         var_182.push(_loc5_);
      }
      
      private function method_2783(param1:TouchEvent) : void
      {
         var _loc2_:TouchPoint = new TouchPoint();
         _loc2_.id = param1.touchPointID;
         _loc2_.x = param1.stageX;
         _loc2_.y = param1.stageY;
         ++this.var_2372;
         this.var_1336.push(_loc2_);
         this.var_225[_loc2_.id] = _loc2_;
         this.method_5745();
         this.var_952 = var_4846[_loc2_.id];
         if(this.var_952)
         {
            this.method_4483(class_2097.TOUCH_BEGIN,param1,this.var_952,_loc2_);
         }
         this.var_943 = true;
      }
      
      private function method_2200(param1:TouchEvent) : void
      {
         var _loc2_:TouchPoint = this.var_225[param1.touchPointID];
         if(!_loc2_)
         {
            return;
         }
         _loc2_.x = param1.stageX;
         _loc2_.y = param1.stageY;
         this.var_952 = var_4846[_loc2_.id];
         if(this.var_952)
         {
            this.method_4483(class_2097.TOUCH_MOVE,this.var_1133 = param1,this.var_952,_loc2_);
         }
         this.var_943 = true;
      }
      
      private function method_4437(param1:TouchEvent) : void
      {
         var _loc2_:TouchPoint = this.var_225[param1.touchPointID];
         if(!_loc2_)
         {
            return;
         }
         this.var_952 = var_4846[_loc2_.id];
         if(this.var_952)
         {
            this.method_4483(class_2097.TOUCH_END,param1,this.var_952,_loc2_);
         }
         this.var_225[_loc2_.id] = null;
         --this.var_2372;
         this.var_1336.splice(this.var_1336.indexOf(_loc2_),1);
         this.var_943 = true;
      }
      
      public function get method_2790() : Boolean
      {
         return this.var_961;
      }
      
      public function set method_2790(param1:Boolean) : void
      {
         this.var_961 = param1;
      }
      
      public function get method_5222() : class_2096
      {
         return this.var_3236;
      }
      
      public function set method_5222(param1:class_2096) : void
      {
         this.var_3236 = param1;
      }
      
      public function set view(param1:class_1762) : void
      {
         this._view = param1;
      }
   }
}

class TouchPoint
{
    
   
   public var id:int;
   
   public var x:Number;
   
   public var y:Number;
   
   function TouchPoint()
   {
      super();
   }
}
