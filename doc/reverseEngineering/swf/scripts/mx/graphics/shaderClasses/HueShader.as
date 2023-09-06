package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class HueShader extends Shader
   {
      
      private static var ShaderClass:Class = HueShader_ShaderClass;
       
      
      public function HueShader()
      {
         super(new ShaderClass());
      }
   }
}
