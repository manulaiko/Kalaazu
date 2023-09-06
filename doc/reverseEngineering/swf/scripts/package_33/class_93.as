package package_33
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Point;
   import net.bigpoint.darkorbit.gui.class_58;
   import package_30.class_91;
   
   public class class_93 extends Sprite
   {
      
      public static var var_3159:int = 2;
      
      public static var var_4887:int = 3;
      
      public static var var_3654:int = 5;
      
      public static var var_1265:int = 14;
      
      public static var var_3333:int = 1;
      
      public static var var_886:int = 4;
      
      public static var var_357:int = 0;
      
      public static const const_3042:int = 6;
      
      public static const const_3223:int = 8;
      
      public static const const_2023:int = 9;
      
      public static const const_2961:int = 10;
      
      public static const const_3162:int = 11;
      
      public static const const_998:int = 12;
      
      public static const const_3068:int = 13;
      
      public static const const_1827:int = 15;
      
      public static const const_3185:int = 16;
      
      public static const const_2110:int = 17;
      
      public static const const_1306:int = 18;
      
      public static const const_2198:int = 19;
      
      public static const const_846:int = 20;
      
      public static const const_148:int = 21;
      
      public static const const_3034:int = 22;
      
      public static const const_752:int = 23;
      
      public static const const_2114:int = 24;
      
      public static const const_233:int = 25;
      
      public static const const_503:int = 26;
      
      public static const const_284:int = 27;
      
      public static const const_1053:int = 28;
      
      public static const const_1948:int = 29;
      
      public static const const_672:int = 30;
      
      public static const const_1597:int = 31;
      
      public static const const_922:int = 32;
      
      public static const const_761:int = 33;
      
      public static const const_2935:int = 36;
      
      public static const const_2811:int = 37;
      
      public static const const_1971:int = 38;
      
      public static const const_2343:int = 39;
      
      public static const const_2085:int = 40;
      
      public static const const_1301:int = 41;
      
      public static const const_1852:int = 35;
      
      public static const const_2709:int = 42;
      
      public static const const_2593:int = 43;
      
      public static const const_1563:int = 44;
      
      public static const const_1858:int = 45;
      
      public static const const_2512:int = 46;
      
      public static const const_3293:int = 76;
      
      public static const const_3168:int = 47;
      
      public static const const_2218:int = 48;
      
      public static const const_2524:int = 49;
      
      public static const const_2886:int = 50;
      
      public static const const_1784:int = 51;
      
      public static const const_1863:int = 52;
      
      public static const const_1098:int = 53;
      
      public static const const_1181:int = 54;
      
      public static const const_267:int = 55;
      
      public static const const_1653:int = 56;
      
      public static const const_2493:int = 57;
      
      public static const const_565:int = 58;
      
      public static const const_2156:int = 59;
      
      public static const const_1871:int = 60;
      
      public static const const_2733:int = 61;
      
      public static const const_1553:int = 62;
      
      public static const const_572:int = 63;
      
      public static const const_2269:int = 64;
      
      public static const const_2449:int = 65;
      
      public static const const_809:int = 66;
      
      public static const const_2070:int = 67;
      
      public static const const_1521:int = 68;
      
      public static const const_2926:int = 69;
      
      public static const const_2145:int = 70;
      
      public static const const_1649:int = 71;
      
      public static const const_2684:int = 72;
      
      public static const const_680:int = 73;
      
      public static const const_2766:int = 74;
      
      public static const const_2494:int = 77;
      
      public static const const_1156:int = 75;
      
      public static const const_1574:int = 78;
      
      public static const const_2699:int = 76;
      
      public static const const_2374:int = 0;
      
      public static const const_3298:int = 1;
      
      public static const const_2568:int = 2;
      
      public static const const_1191:int = 3;
      
      public static const const_2037:int = 4;
       
      
      private var name_79:Array;
      
      protected var elements:Array;
      
      protected var guiManager:class_58;
      
      private var var_2803:Boolean;
      
      protected var var_1102:int;
      
      public function class_93(param1:class_58, param2:int)
      {
         this.name_79 = [];
         this.elements = [];
         super();
         this.guiManager = param1;
         this.var_1102 = param2;
         this.cacheAsBitmap = true;
      }
      
      public function method_3702() : int
      {
         return this.var_1102;
      }
      
      public function removeElement(param1:DisplayObject) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            _loc3_ = this.elements[_loc2_];
            if(_loc3_ == param1)
            {
               this.elements.splice(_loc2_,1);
               this.removeChild(param1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function addElement(param1:DisplayObject, param2:int = 0, param3:int = 5) : void
      {
         var _loc4_:* = null;
         if(this.numChildren > 0)
         {
            _loc4_ = this.getChildAt(this.numChildren - 1);
            if(param2 == const_3298)
            {
               param1.x = _loc4_.x;
               param1.y = _loc4_.y + _loc4_.height + param3;
            }
            else if(param2 == const_2568)
            {
               param1.y = _loc4_.y;
               param1.x = _loc4_.x + _loc4_.width + param3;
            }
            else if(param2 == const_1191)
            {
               param1.x = Number(this.width) / 2 - param1.width / 2;
               param1.y = _loc4_.y + _loc4_.height + param3;
            }
            else if(param2 == const_2037)
            {
               param1.x = _loc4_.x + _loc4_.width + param3;
               param1.y = Number(this.height) / 2 - param1.height / 2;
            }
         }
         this.elements.push(param1);
         this.addChild(param1);
      }
      
      public function method_1864() : Array
      {
         return this.elements;
      }
      
      public function removeAllElements() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.elements.length)
         {
            _loc2_ = this.elements[_loc1_];
            if(_loc2_ != null && Boolean(this.contains(_loc2_)))
            {
               this.removeChild(_loc2_);
            }
            _loc1_++;
         }
         this.elements = [];
      }
      
      public function method_89(param1:int) : class_91
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            _loc3_ = this.elements[_loc2_];
            if(_loc3_.getID() == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function method_3694(param1:int) : class_93
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            _loc3_ = this.elements[_loc2_];
            if(_loc3_.method_3702() == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getElementAt(param1:int) : class_91
      {
         return this.elements[param1];
      }
      
      public function method_632(param1:int) : Array
      {
         var _loc4_:* = null;
         var _loc2_:* = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.elements.length)
         {
            if((_loc4_ = this.elements[_loc3_]).getID() == param1)
            {
               _loc2_.push(_loc4_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function get width() : Number
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc1_:Number = super.width;
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            _loc3_ = this.elements[_loc2_];
            if((_loc4_ = Number(this.method_2844(_loc3_))) > _loc1_)
            {
               _loc1_ = _loc4_;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function method_2844(param1:Object) : Number
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc2_:int = 0;
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = param1 as DisplayObjectContainer;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               if((_loc5_ = _loc3_.getChildAt(_loc4_)) is Sprite)
               {
                  if(_loc5_.width > _loc2_)
                  {
                     _loc2_ = _loc5_.width;
                  }
                  if((_loc6_ = Number(this.method_2844(_loc5_))) > _loc2_)
                  {
                     _loc2_ = _loc6_;
                  }
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      override public function get height() : Number
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc1_:Number = super.height;
         var _loc2_:int = 0;
         while(_loc2_ < this.elements.length)
         {
            _loc3_ = this.elements[_loc2_];
            if((_loc4_ = Number(this.method_1580(_loc3_))) > _loc1_)
            {
               _loc1_ = _loc4_;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function method_1580(param1:Object) : Number
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc2_:int = 0;
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = param1 as DisplayObjectContainer;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               if((_loc5_ = _loc3_.getChildAt(_loc4_)) is Sprite)
               {
                  if(_loc5_.height > _loc2_)
                  {
                     _loc2_ = _loc5_.height;
                  }
                  if((_loc6_ = Number(this.method_1580(_loc5_))) > _loc2_)
                  {
                     _loc2_ = _loc6_;
                  }
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function method_1369() : DisplayObject
      {
         return this.parent;
      }
      
      public function method_558() : void
      {
         var _loc1_:Point = this.name_79[0];
         if(this.method_1161())
         {
            if(this.name_79[1] != null)
            {
               _loc1_ = this.name_79[1];
            }
         }
         if(_loc1_ == null)
         {
            this.method_5942(new Point(10,25));
            _loc1_ = this.name_79[0];
         }
         this.x = _loc1_.x;
         this.y = _loc1_.y;
      }
      
      public function method_5942(param1:Point) : void
      {
         this.name_79.push(param1);
      }
      
      public function method_1161() : Boolean
      {
         return this.var_2803;
      }
      
      public function method_647(param1:Boolean) : void
      {
         this.var_2803 = param1;
      }
      
      public function method_591(param1:int) : void
      {
         this.removeElement(this.method_89(param1));
      }
      
      public function get method_4243() : DisplayObject
      {
         return this;
      }
   }
}
