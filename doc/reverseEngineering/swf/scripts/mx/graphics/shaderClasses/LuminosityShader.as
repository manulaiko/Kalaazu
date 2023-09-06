package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class LuminosityShader extends Shader
   {
      
      private static var ShaderClass:Class = LuminosityShader_ShaderClass;
       
      
      public function LuminosityShader()
      {
         super(new ShaderClass());
      }
   }
}
