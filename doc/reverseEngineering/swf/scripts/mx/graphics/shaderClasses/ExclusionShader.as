package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class ExclusionShader extends Shader
   {
      
      private static var ShaderClass:Class = ExclusionShader_ShaderClass;
       
      
      public function ExclusionShader()
      {
         super(new ShaderClass());
      }
   }
}
