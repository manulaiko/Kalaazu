package package_369
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import package_19.class_1199;
   import package_198.class_1208;
   
   public class class_2118 extends class_2116
   {
       
      
      public const ready:class_1199 = new class_1199();
      
      private var var_3706:class_2433;
      
      private var var_4755:Vector.<Boolean>;
      
      private var var_1344:Boolean;
      
      public function class_2118(param1:ByteArray, param2:Boolean = true)
      {
         this.var_4755 = new Vector.<Boolean>(8);
         this.var_1344 = param2;
         super();
         this.atfData = new class_2433(param1);
         _format = this.atfData.format;
         var_3740 = this.var_3706.numTextures > 1;
      }
      
      public function get atfData() : class_2433
      {
         return this.var_3706;
      }
      
      public function set atfData(param1:class_2433) : void
      {
         this.var_3706 = param1;
         method_1112();
         setSize(param1.width,param1.height);
      }
      
      override public function method_6425(param1:class_1208) : TextureBase
      {
         var _loc2_:int = int(param1.arcane::var_1572);
         var _loc3_:Texture = var_2928[_loc2_] as Texture;
         var _loc4_:Context3D = param1.arcane::var_4582;
         if(!_loc3_ || var_1810[_loc2_] != _loc4_)
         {
            this.ready.reset();
            var_2928[_loc2_] = _loc3_ = _loc4_.createTexture(_width,_height,this.atfData.format,false);
            var_1810[_loc2_] = _loc4_;
            if(this.var_1344)
            {
               _loc3_.addEventListener(Event.TEXTURE_READY,this.method_1113);
            }
            else
            {
               this.var_4755[_loc2_] = true;
            }
            _loc3_.uploadCompressedTextureFromByteArray(this.var_3706.data,0,this.var_1344);
         }
         return !!this.var_4755[_loc2_] ? _loc3_ : null;
      }
      
      override protected function invalidateSize() : void
      {
         super.invalidateSize();
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.var_4755[_loc1_] = null;
            _loc1_++;
         }
      }
      
      private function method_1113(param1:Event) : void
      {
         param1.currentTarget.removeEventListener(Event.TEXTURE_READY,this.method_1113);
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            if(var_2928[_loc2_] == param1.currentTarget)
            {
               this.var_4755[_loc2_] = true;
               break;
            }
            _loc2_++;
         }
         this.ready.dispatch();
      }
      
      public function get async() : Boolean
      {
         return this.var_1344;
      }
   }
}
