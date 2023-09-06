package package_384
{
   import com.adobe.utils.AGALMiniAssembler;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.Program3D;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import package_198.class_1208;
   import package_291.class_1745;
   import package_305.class_1767;
   import package_374.AbstractMethodError;
   
   public class class_2232
   {
       
      
      protected var var_1743:TextureBase;
      
      protected var var_964:Context3D;
      
      protected var var_4643:int = -1;
      
      protected var var_1914:int = -1;
      
      protected var var_1654:int = -1;
      
      protected var var_270:int = -1;
      
      protected var var_217:Boolean = true;
      
      private var var_324:Boolean = true;
      
      private var var_1519:Program3D;
      
      private var var_824:Context3D;
      
      private var _target:TextureBase;
      
      private var var_411:Boolean;
      
      protected var var_56:int = 0;
      
      public function class_2232(param1:Boolean = false)
      {
         super();
         this.var_411 = param1;
      }
      
      public function get method_66() : int
      {
         return this.var_56;
      }
      
      public function set method_66(param1:int) : void
      {
         if(this.var_56 == param1)
         {
            return;
         }
         this.var_56 = param1;
         this.var_4643 = Number(this.var_1654) >> Number(this.var_56);
         this.var_1914 = Number(this.var_270) >> Number(this.var_56);
         this.var_217 = true;
      }
      
      public function get target() : TextureBase
      {
         return this._target;
      }
      
      public function set target(param1:TextureBase) : void
      {
         this._target = param1;
      }
      
      public function get method_1430() : int
      {
         return this.var_1654;
      }
      
      public function set method_1430(param1:int) : void
      {
         if(this.var_1654 == param1)
         {
            return;
         }
         this.var_1654 = param1;
         this.var_4643 = Number(this.var_1654) >> Number(this.var_56);
         if(this.var_4643 < 1)
         {
            this.var_4643 = 1;
         }
         this.var_217 = true;
      }
      
      public function get method_1059() : int
      {
         return this.var_270;
      }
      
      public function set method_1059(param1:int) : void
      {
         if(this.var_270 == param1)
         {
            return;
         }
         this.var_270 = param1;
         this.var_1914 = Number(this.var_270) >> Number(this.var_56);
         if(this.var_1914 < 1)
         {
            this.var_1914 = 1;
         }
         this.var_217 = true;
      }
      
      public function getMainInputTexture(param1:class_1208) : TextureBase
      {
         if(param1.context3D != this.var_964)
         {
            this.var_217 = true;
         }
         if(this.var_217)
         {
            this.method_5255(param1);
         }
         return this.var_1743;
      }
      
      public function dispose() : void
      {
         if(this.var_1743)
         {
            this.var_1743.dispose();
         }
         if(this.var_1519)
         {
            this.var_1519.dispose();
         }
         this.var_824 = null;
      }
      
      protected function method_400() : void
      {
         this.var_324 = true;
      }
      
      protected function method_1713(param1:class_1208) : void
      {
         if(this.var_1519)
         {
            this.var_1519.dispose();
         }
         this.var_824 = param1.context3D;
         this.var_1519 = this.var_824.createProgram();
         this.var_1519.upload(new AGALMiniAssembler(class_1745.active).assemble(Context3DProgramType.VERTEX,this.getVertexCode()),new AGALMiniAssembler(class_1745.active).assemble(Context3DProgramType.FRAGMENT,this.getFragmentCode()));
         this.var_324 = false;
      }
      
      protected function getVertexCode() : String
      {
         return "mov op, va0\nmov v0, va1\n";
      }
      
      protected function getFragmentCode() : String
      {
         throw new AbstractMethodError();
      }
      
      protected function method_5255(param1:class_1208) : void
      {
         if(this.var_1743)
         {
            this.var_1743.dispose();
         }
         this.var_964 = param1.context3D;
         this.var_1743 = this.var_964.createTexture(this.var_4643,this.var_1914,Context3DTextureFormat.BGRA,true);
         this.var_217 = false;
      }
      
      public function method_3985(param1:class_1208) : Program3D
      {
         if(this.var_824 != param1.context3D)
         {
            this.var_324 = true;
         }
         if(this.var_324)
         {
            this.method_1713(param1);
         }
         return this.var_1519;
      }
      
      public function activate(param1:class_1208, param2:class_1767, param3:Texture) : void
      {
      }
      
      public function deactivate(param1:class_1208) : void
      {
      }
      
      public function get method_4805() : Boolean
      {
         return this.var_411;
      }
   }
}
