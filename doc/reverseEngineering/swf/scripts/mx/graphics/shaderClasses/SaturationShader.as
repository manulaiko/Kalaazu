package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class SaturationShader extends Shader
   {
      
      private static var ShaderClass:Class = SaturationShader_ShaderClass;
       
      
      public function SaturationShader()
      {
         super(new ShaderClass());
      }
   }
}
