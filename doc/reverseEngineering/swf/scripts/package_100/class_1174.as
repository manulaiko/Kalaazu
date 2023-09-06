package package_100
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   
   public class class_1174 extends class_270
   {
      
      private static const BITMAP_DATA:BitmapData = new BitmapData(2,2,false,0);
       
      
      private var _color:uint;
      
      public function class_1174(param1:uint, param2:int = 0)
      {
         super(new Bitmap(BITMAP_DATA),true,true,param2);
         this.color = param1;
      }
      
      public function reset() : void
      {
         (_icon as Bitmap).bitmapData = BITMAP_DATA;
         this.color = this._color;
      }
      
      public function set color(param1:uint) : void
      {
         var _loc2_:* = null;
         if(this._color != param1)
         {
            this._color = param1;
            _loc2_ = _icon.transform.colorTransform || new ColorTransform();
            _loc2_.color = param1;
            _icon.transform.colorTransform = _loc2_;
         }
      }
      
      public function get color() : uint
      {
         return this._color;
      }
   }
}
