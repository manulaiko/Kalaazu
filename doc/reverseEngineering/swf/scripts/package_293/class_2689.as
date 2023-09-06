package package_293
{
   import flash.display.BitmapData;
   
   public class class_2689 extends class_1749 implements class_1751
   {
       
      
      private var _bitmapData:BitmapData;
      
      public function class_2689(param1:BitmapData = null)
      {
         super();
         this._bitmapData = param1;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         this._bitmapData = param1;
      }
      
      public function get assetType() : String
      {
         return class_2131.TEXTURE;
      }
      
      public function dispose() : void
      {
         this._bitmapData.dispose();
      }
   }
}
