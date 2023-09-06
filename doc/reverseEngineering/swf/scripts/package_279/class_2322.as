package package_279
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import package_76.class_215;
   
   public class class_2322 extends Sprite
   {
      
      public static const CENTER:String = "CENTER";
      
      public static const LEFT:String = "LEFT";
      
      public static const RIGHT:String = "RIGHT";
      
      public static const BOTTOM:String = "BOTTOM";
      
      public static const TOP:String = "TOP";
      
      public static const CUSTOM:String = "CUSTOM";
       
      
      private var var_44:Object;
      
      private var _elements:Vector.<DisplayObject>;
      
      private var var_4047:Boolean;
      
      private var _alignment:String = "TOP";
      
      private var var_806:String = "LEFT";
      
      private var _gap:Number = 0;
      
      public function class_2322()
      {
         this.var_44 = {};
         this._elements = new Vector.<DisplayObject>();
         super();
         this.var_44[LEFT] = this.method_6473;
         this.var_44[RIGHT] = this.method_5502;
         this.var_44[CENTER] = this.method_3688;
      }
      
      public function redraw() : void
      {
         var listener:Function = null;
         if(this.var_4047)
         {
            if(hasEventListener(Event.ENTER_FRAME))
            {
               return;
            }
            listener = function(param1:Event):void
            {
               removeEventListener(Event.ENTER_FRAME,listener);
               handleChange();
            };
            addEventListener(Event.ENTER_FRAME,listener);
         }
         else
         {
            this.handleChange();
         }
      }
      
      private function handleChange() : void
      {
         class_215.method_5129(this);
         var _loc1_:uint = uint(this._elements.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            addChild(this._elements[_loc2_]);
            _loc2_++;
         }
         this.updateLayout();
      }
      
      public function updateLayout() : void
      {
         this.var_44[this.var_806]();
      }
      
      private function method_6473() : void
      {
         var _loc3_:* = null;
         var _loc1_:uint = uint(this._elements.length);
         var _loc2_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = this._elements[_loc4_];
            if(_loc3_.visible)
            {
               _loc3_.x = _loc2_;
               if(this._alignment != CUSTOM)
               {
                  _loc3_.y = this.method_4141(_loc3_);
               }
               _loc2_ += _loc3_.width + this._gap;
            }
            _loc4_++;
         }
      }
      
      private function method_5502() : void
      {
         var _loc3_:* = null;
         var _loc1_:uint = uint(this._elements.length);
         var _loc2_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = this._elements[_loc4_];
            if(_loc3_.visible)
            {
               _loc3_.x = _loc2_;
               if(this._alignment != CUSTOM)
               {
                  _loc3_.y = this.method_4141(_loc3_);
               }
               _loc2_ += _loc3_.width + this._gap;
            }
            _loc4_++;
         }
      }
      
      public function reset() : void
      {
         this._elements.length = 0;
         this.redraw();
      }
      
      public function addElement(param1:DisplayObject) : void
      {
         this._elements.push(param1);
         this.redraw();
      }
      
      public function removeElement(param1:DisplayObject) : void
      {
         var _loc2_:int = int(this._elements.indexOf(param1));
         while(_loc2_ != -1)
         {
            this._elements.splice(_loc2_,1);
            _loc2_ = int(this._elements.indexOf(param1));
         }
         this.redraw();
      }
      
      public function removeAllElements() : void
      {
         this.elements.length = 0;
         this.redraw();
      }
      
      public function get method_4524() : Boolean
      {
         return this.var_4047;
      }
      
      public function set method_4524(param1:Boolean) : void
      {
         this.var_4047 = param1;
      }
      
      public function get alignment() : String
      {
         return this._alignment;
      }
      
      public function set alignment(param1:String) : void
      {
         if(this._alignment != param1)
         {
            this._alignment = param1;
            this.redraw();
         }
      }
      
      private function method_4141(param1:DisplayObject) : Number
      {
         switch(this._alignment)
         {
            case TOP:
               return 0;
            case CENTER:
               return -param1.height * 0.5;
            case BOTTOM:
               return -param1.height;
            default:
               return 0;
         }
      }
      
      public function get elements() : Vector.<DisplayObject>
      {
         return this._elements;
      }
      
      public function get gap() : Number
      {
         return this._gap;
      }
      
      public function set gap(param1:Number) : void
      {
         if(param1 != this._gap)
         {
            this._gap = param1;
            this.updateLayout();
         }
      }
      
      private function method_3688() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:int = int(this._elements.length);
         var _loc2_:int = int(this.method_4595());
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc1_)
         {
            if((_loc4_ = this._elements[_loc6_]).visible)
            {
               _loc5_ = _loc4_.getBounds(_loc4_);
               _loc4_.x = _loc3_ - _loc5_.x - _loc2_ * 0.5;
               if(this._alignment != CUSTOM)
               {
                  _loc4_.y = -_loc5_.y - _loc5_.height;
               }
               _loc3_ += _loc5_.width + this.gap;
            }
            _loc6_++;
         }
      }
      
      private function method_4595() : int
      {
         var _loc1_:int = int(this._elements.length);
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ += this._elements[_loc3_].width;
            _loc3_++;
         }
         return _loc2_ + Number(this.gap) * (_loc1_ - 1);
      }
      
      public function set method_5943(param1:String) : void
      {
         if(param1 != this.var_806)
         {
            this.var_806 = param1;
            this.updateLayout();
         }
      }
   }
}
