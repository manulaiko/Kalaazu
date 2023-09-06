package package_369
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.textures.TextureBase;
   import package_198.class_1208;
   import package_293.class_1749;
   import package_293.class_1751;
   import package_293.class_2131;
   import package_374.AbstractMethodError;
   
   public class class_2115 extends class_1749 implements class_1751
   {
       
      
      protected var _format:String = "bgra";
      
      protected var var_3740:Boolean = true;
      
      protected var var_2928:Vector.<TextureBase>;
      
      protected var var_1810:Vector.<Context3D>;
      
      protected var _width:int;
      
      protected var _height:int;
      
      public function class_2115()
      {
         super();
         this.var_2928 = new Vector.<TextureBase>(8);
         this.var_1810 = new Vector.<Context3D>(8);
      }
      
      public function get method_5818() : Boolean
      {
         return this.var_3740;
      }
      
      public function get format() : String
      {
         return this._format;
      }
      
      public function get assetType() : String
      {
         return class_2131.TEXTURE;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function method_6425(param1:class_1208) : TextureBase
      {
         var _loc2_:int = int(param1.arcane::var_1572);
         var _loc3_:TextureBase = this.var_2928[_loc2_];
         var _loc4_:Context3D = param1.arcane::var_4582;
         if(!_loc3_ || this.var_1810[_loc2_] != _loc4_)
         {
            this.var_2928[_loc2_] = _loc3_ = this.createTexture(_loc4_);
            this.var_1810[_loc2_] = _loc4_;
            this.method_24(_loc3_);
         }
         return _loc3_;
      }
      
      protected function method_24(param1:TextureBase) : void
      {
         throw new AbstractMethodError();
      }
      
      protected function setSize(param1:int, param2:int) : void
      {
         if(this._width != param1 || this._height != param2)
         {
            this.invalidateSize();
         }
         this._width = param1;
         this._height = param2;
      }
      
      public function method_1112() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.var_1810[_loc1_] = null;
            _loc1_++;
         }
      }
      
      protected function invalidateSize() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = this.var_2928[_loc2_];
            if(_loc1_)
            {
               _loc1_.dispose();
               this.var_2928[_loc2_] = null;
               this.var_1810[_loc2_] = null;
            }
            _loc2_++;
         }
      }
      
      protected function createTexture(param1:Context3D) : TextureBase
      {
         throw new AbstractMethodError();
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            if(this.var_2928[_loc1_])
            {
               this.var_2928[_loc1_].dispose();
            }
            _loc1_++;
         }
      }
   }
}
