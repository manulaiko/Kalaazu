package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class ColorDodgeShader extends Shader
   {
      
      private static var ShaderClass:Class = ColorDodgeShader_ShaderClass;
       
      
      public function ColorDodgeShader()
      {
         super(new ShaderClass());
      }
   }
}
