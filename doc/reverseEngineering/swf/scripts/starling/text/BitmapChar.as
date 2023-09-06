package starling.text
{
   import flash.utils.Dictionary;
   import starling.display.Image;
   import starling.textures.Texture;
   
   public class BitmapChar
   {
       
      
      private var mTexture:Texture;
      
      private var mCharID:int;
      
      private var mXOffset:Number;
      
      private var mYOffset:Number;
      
      private var mXAdvance:Number;
      
      private var mKernings:Dictionary;
      
      public function BitmapChar(param1:int, param2:Texture, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.mCharID = param1;
         this.mTexture = param2;
         this.mXOffset = param3;
         this.mYOffset = param4;
         this.mXAdvance = param5;
         this.mKernings = null;
      }
      
      public function addKerning(param1:int, param2:Number) : void
      {
         if(this.mKernings == null)
         {
            this.mKernings = new Dictionary();
         }
         this.mKernings[param1] = param2;
      }
      
      public function getKerning(param1:int) : Number
      {
         if(this.mKernings == null || this.mKernings[param1] == undefined)
         {
            return 0;
         }
         return this.mKernings[param1];
      }
      
      public function createImage() : Image
      {
         return new Image(this.mTexture);
      }
      
      public function get charID() : int
      {
         return this.mCharID;
      }
      
      public function get xOffset() : Number
      {
         return this.mXOffset;
      }
      
      public function get yOffset() : Number
      {
         return this.mYOffset;
      }
      
      public function get xAdvance() : Number
      {
         return this.mXAdvance;
      }
      
      public function get texture() : Texture
      {
         return this.mTexture;
      }
      
      public function get width() : Number
      {
         return this.mTexture.width;
      }
      
      public function get height() : Number
      {
         return this.mTexture.height;
      }
   }
}
