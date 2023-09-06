package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class SoftLightShader extends Shader
   {
      
      private static var ShaderClass:Class = SoftLightShader_ShaderClass;
       
      
      public function SoftLightShader()
      {
         super(new ShaderClass());
      }
   }
}
