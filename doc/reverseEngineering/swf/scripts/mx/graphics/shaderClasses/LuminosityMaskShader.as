package mx.graphics.shaderClasses
{
   import flash.display.Shader;
   
   public class LuminosityMaskShader extends Shader
   {
      
      private static var ShaderClass:Class = LuminosityMaskShader_ShaderClass;
       
      
      public function LuminosityMaskShader()
      {
         super(new ShaderClass());
      }
      
      public function get mode() : int
      {
         return this.data.mode.value;
      }
      
      public function set mode(param1:int) : void
      {
         if(this.mode == -1)
         {
            return;
         }
         this.data.mode.value = [param1];
      }
   }
}
