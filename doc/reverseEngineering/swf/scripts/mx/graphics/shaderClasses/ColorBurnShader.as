package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class ColorBurnShader extends Shader
   {
      
      private static var ShaderClass:Class = ColorBurnShader_ShaderClass;
       
      
      public function ColorBurnShader()
      {
         super(new ShaderClass());
      }
   }
}
