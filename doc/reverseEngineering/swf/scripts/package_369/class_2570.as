package package_369
{
   import flash.display3D.Context3D;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.textures.TextureBase;
   
   public class class_2570 extends class_2115
   {
       
      
      public function class_2570()
      {
         super();
      }
      
      public function get size() : int
      {
         return _width;
      }
      
      override protected function createTexture(param1:Context3D) : TextureBase
      {
         return param1.createCubeTexture(width,Context3DTextureFormat.BGRA,false);
      }
   }
}
