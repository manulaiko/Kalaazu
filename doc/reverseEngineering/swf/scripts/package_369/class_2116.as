package package_369
{
   import flash.display3D.Context3D;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.textures.TextureBase;
   
   public class class_2116 extends class_2115
   {
       
      
      public function class_2116()
      {
         super();
      }
      
      override protected function createTexture(param1:Context3D) : TextureBase
      {
         return param1.createTexture(_width,_height,Context3DTextureFormat.BGRA,false);
      }
   }
}
