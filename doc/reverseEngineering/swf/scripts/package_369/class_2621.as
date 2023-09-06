package package_369
{
   import flash.display3D.Context3D;
   import flash.display3D.textures.CubeTexture;
   import flash.display3D.textures.TextureBase;
   import flash.utils.ByteArray;
   
   public class class_2621 extends class_2570
   {
       
      
      private var var_3706:class_2433;
      
      public function class_2621(param1:ByteArray)
      {
         super();
         this.atfData = new class_2433(param1);
         if(this.atfData.type != class_2433.const_100)
         {
            throw new Error("ATF isn\'t cubetexture");
         }
         _format = this.atfData.format;
         var_3740 = this.var_3706.numTextures > 1;
      }
      
      public function get atfData() : class_2433
      {
         return this.var_3706;
      }
      
      public function set atfData(param1:class_2433) : void
      {
         this.var_3706 = param1;
         method_1112();
         setSize(param1.width,param1.height);
      }
      
      override protected function method_24(param1:TextureBase) : void
      {
         CubeTexture(param1).uploadCompressedTextureFromByteArray(this.var_3706.data,0,false);
      }
      
      override protected function createTexture(param1:Context3D) : TextureBase
      {
         return param1.createCubeTexture(this.var_3706.width,this.var_3706.format,false);
      }
   }
}
