package package_278
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   
   public class class_1687 extends Sprite
   {
      
      public static const const_562:int = 1;
      
      public static const const_2304:int = 2;
      
      public static const const_2076:int = 3;
       
      
      private var var_2068:Bitmap;
      
      private var var_534:Bitmap;
      
      protected var var_3838:Bitmap;
      
      private var var_1734:Boolean;
      
      private var _state:int = 1;
      
      private var var_3338:Boolean = true;
      
      private var var_1540:Boolean;
      
      private var _colors:Array;
      
      private var var_4214:Boolean;
      
      public function class_1687()
      {
         this._colors = [];
         super();
         this._colors[const_2076] = 14102062;
         this._colors[const_2304] = 10066329;
         this._colors[const_562] = 16777215;
         this.method_511();
      }
      
      protected function method_511() : void
      {
         this.var_3838 = new Bitmap(new BitmapData(20,20,true,0));
         this.var_3838.bitmapData.fillRect(new Rectangle(0,0,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,2,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,4,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,6,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,8,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,10,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,12,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,14,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,16,20,1),4294967295);
         this.var_3838.bitmapData.fillRect(new Rectangle(0,18,20,1),4294967295);
      }
      
      public function get method_1736() : Bitmap
      {
         return this.var_534;
      }
      
      public function set method_1736(param1:Bitmap) : void
      {
         if(this.var_2068 != null && Boolean(contains(this.var_2068)))
         {
            removeChild(this.var_2068);
         }
         this.var_534 = param1;
         this.var_2068 = new Bitmap(this.var_534.bitmapData.clone());
         addChild(this.var_2068);
         this.method_1328();
      }
      
      public function set cloaked(param1:Boolean) : void
      {
         if(this.var_1734 != param1)
         {
            this.var_1734 = param1;
            if(this.var_4214)
            {
               return;
            }
            removeChild(this.var_2068);
            this.var_2068 = new Bitmap(this.var_534.bitmapData.clone());
            addChild(this.var_2068);
            if(this.var_1734)
            {
               this.var_2068.bitmapData.draw(this.var_3838,null,null,BlendMode.ERASE);
            }
            this.method_1328();
         }
      }
      
      public function get cloaked() : Boolean
      {
         return this.var_1734;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(this._state != param1)
         {
            this._state = param1;
         }
      }
      
      public function get method_5274() : Boolean
      {
         return this.var_3338;
      }
      
      public function set method_5274(param1:Boolean) : void
      {
         if(this.var_3338 != param1)
         {
            this.var_3338 = param1;
            if(this.var_4214)
            {
               return;
            }
            this.method_1328();
         }
      }
      
      private function method_1328() : void
      {
         if(this.var_4214)
         {
            return;
         }
         var _loc1_:ColorTransform = new ColorTransform();
         if(this.var_1540)
         {
            _loc1_.color = this._colors[const_2076];
         }
         else if(this.var_3338)
         {
            _loc1_.color = this._colors[const_2304];
         }
         else
         {
            _loc1_.color = this._colors[const_562];
         }
         this.var_2068.transform.colorTransform = _loc1_;
      }
      
      public function get name_162() : Boolean
      {
         return this.var_1540;
      }
      
      public function set name_162(param1:Boolean) : void
      {
         if(this.var_1540 != param1)
         {
            this.var_1540 = param1;
            this.method_1328();
         }
      }
      
      public function get name_157() : Boolean
      {
         return this.var_4214;
      }
      
      public function set name_157(param1:Boolean) : void
      {
         if(this.var_4214 != param1)
         {
            this.var_4214 = param1;
         }
      }
   }
}
