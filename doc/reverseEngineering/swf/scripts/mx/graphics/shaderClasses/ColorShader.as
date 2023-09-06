package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class ColorShader extends Shader
   {
      
      private static var ShaderClass:Class = ColorShader_ShaderClass;
       
      
      public function ColorShader()
      {
         super(new ShaderClass());
      }
   }
}
