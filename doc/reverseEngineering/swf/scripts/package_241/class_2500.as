package package_241
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import package_141.class_969;
   
   public class class_2500 extends class_969
   {
       
      
      private var var_96:int = 0;
      
      private var var_796:int = 0;
      
      private var _items:Array;
      
      public function class_2500(param1:DisplayObjectContainer)
      {
         this._items = [];
         super(param1);
      }
      
      override public function decorate() : void
      {
      }
      
      public function addItem(param1:DisplayObject, param2:Number = 0, param3:Number = 0) : DisplayObject
      {
         this.var_796 = param2 + param3;
         method_4210(param1);
         this._items.push(param1);
         this.method_4520(param1,param2,param3);
         return param1;
      }
      
      private function method_4520(param1:DisplayObject, param2:Number = 0, param3:Number = 0) : void
      {
         param1.y = this.var_96 + param2;
         this.var_96 = param1.y + param1.height + param3;
      }
      
      public function method_3928() : void
      {
         this.var_96 = 0;
         this._items = [];
         while(false)
         {
            method_2209(0);
         }
      }
      
      public function method_946() : void
      {
         var _loc2_:* = null;
         this.var_96 = 0;
         var _loc1_:int = 0;
         while(_loc1_ != numChildren)
         {
            _loc2_ = getChildAt(_loc1_);
            _loc2_.y = this.var_96;
            this.var_96 = this.var_96 + _loc2_.height + Number(this.var_796) * _loc2_.scaleY;
            _loc1_++;
         }
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function get method_1428() : Vector.<String>
      {
         return null;
      }
   }
}
