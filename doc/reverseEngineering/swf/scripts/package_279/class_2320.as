package package_279
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import package_76.class_215;
   
   public class class_2320 extends Sprite
   {
      
      public static const LEFT:String = "LEFT";
      
      public static const CENTER:String = "CENTER";
      
      public static const RIGHT:String = "RIGHT";
      
      public static const DIRECTION_NEGATIVE:String = "DIRECTION_NEGATIVE";
      
      public static const DIRECTION_POSITIVE:String = "DIRECTION_POSITIVE";
       
      
      private var _elements:Vector.<DisplayObject>;
      
      private var var_4047:Boolean;
      
      private var _alignment:String = "LEFT";
      
      private var _gap:Number = 0;
      
      private var _direction:String = "DIRECTION_POSITIVE";
      
      public function class_2320()
      {
         this._elements = new Vector.<DisplayObject>();
         super();
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
         var _loc3_:* = null;
         var _loc1_:uint = uint(this._elements.length);
         var _loc2_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = this._elements[_loc4_];
            if(_loc3_.visible)
            {
               _loc3_.y = _loc2_;
               _loc3_.x = this.method_3380(_loc3_);
               if(this._direction == DIRECTION_NEGATIVE)
               {
                  _loc2_ -= _loc3_.height - Number(this._gap);
               }
               else
               {
                  _loc2_ += _loc3_.height + this._gap;
               }
            }
            _loc4_++;
         }
      }
      
      public function reset() : void
      {
         this._elements.length = 0;
         this.handleChange();
      }
      
      public function addElement(param1:DisplayObject) : void
      {
         this._elements.push(param1);
         this.handleChange();
      }
      
      public function removeElement(param1:DisplayObject) : void
      {
         var _loc2_:int = int(this._elements.indexOf(param1));
         while(_loc2_ != -1)
         {
            this._elements.splice(_loc2_,1);
            _loc2_ = int(this._elements.indexOf(param1));
         }
         this.handleChange();
      }
      
      public function method_3502(param1:Vector.<DisplayObject>) : void
      {
         this._elements = param1;
         this.handleChange();
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
            this.handleChange();
         }
      }
      
      private function method_3380(param1:DisplayObject) : Number
      {
         switch(this._alignment)
         {
            case LEFT:
               return 0;
            case CENTER:
               return -param1.width * 0.5;
            case RIGHT:
               return -param1.width;
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
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         if(this._direction != param1)
         {
            this._direction = param1;
            this.updateLayout();
         }
      }
   }
}
