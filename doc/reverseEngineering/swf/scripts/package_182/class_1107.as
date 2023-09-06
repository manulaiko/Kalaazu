package package_182
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import package_11.class_39;
   import package_9.ResourceManager;
   
   public class class_1107 extends Sprite
   {
       
      
      private var var_185:Bitmap;
      
      private var var_2144:Bitmap;
      
      private var container:Sprite;
      
      private var items:Array;
      
      public var gearID:int;
      
      public function class_1107(param1:int = -1)
      {
         this.items = [];
         super();
         this.gearID = param1;
         this.visible = false;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         this.var_185 = _loc1_.getEmbeddedBitmap("top.png");
         this.var_2144 = _loc1_.getEmbeddedBitmap("down.png");
         this.var_2144.x = -1;
         this.var_185.visible = false;
         this.var_2144.visible = false;
         this.container = new Sprite();
         this.container.y = this.var_185.height;
         this.addChild(this.var_185);
         this.addChild(this.var_2144);
         this.addChild(this.container);
      }
      
      public function addElement(param1:class_1490) : void
      {
         param1.parentgearID = this.gearID;
         this.container.addChild(param1);
         this.items.push(param1);
         this.setPosition();
         this.var_2144.visible = true;
         this.var_185.visible = true;
      }
      
      private function setPosition() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.items.length)
         {
            _loc2_ = this.items[_loc3_];
            if(_loc2_ != null)
            {
               _loc2_.y = _loc1_;
               _loc1_ += _loc2_.height;
            }
            _loc3_++;
         }
         this.var_2144.y = _loc1_ + this.var_185.height;
      }
      
      public function removeElement(param1:class_1490) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.items.length)
         {
            _loc2_ = this.items[_loc3_];
            if(_loc2_ != null && _loc2_.gearID == param1.gearID)
            {
               this.container.removeChild(_loc2_);
               this.items[_loc3_] = null;
            }
            _loc3_++;
         }
         this.setPosition();
      }
      
      public function removeAllElements() : void
      {
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(this.container.numChildren - 1);
         }
         this.var_185.visible = false;
         this.var_2144.visible = false;
         this.items = [];
      }
      
      public function show() : void
      {
         this.visible = true;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
      
      public function toggleVisibility() : void
      {
         this.visible = !this.visible;
      }
      
      public function method_89(param1:int) : class_1490
      {
         return this.items[param1] as class_1490;
      }
      
      public function getElementByID(param1:int) : class_1490
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.items.length)
         {
            _loc2_ = this.items[_loc3_] as class_1490;
            if(_loc2_ != null && _loc2_.gearID == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
   }
}
