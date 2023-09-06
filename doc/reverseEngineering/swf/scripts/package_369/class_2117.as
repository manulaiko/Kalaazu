package package_369
{
   import away3d.arcane;
   import flash.display.BitmapData;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import package_434.class_2413;
   import package_441.class_2432;
   
   public class class_2117 extends class_2116
   {
      
      private static var var_4726:Array = [];
      
      private static var var_4967:Array = [];
       
      
      private var _bitmapData:BitmapData;
      
      private var var_1088:BitmapData;
      
      private var var_3136:Boolean;
      
      public function class_2117(param1:BitmapData, param2:Boolean = true)
      {
         super();
         this.bitmapData = param1;
         this.var_3136 = param2;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         if(param1 == this._bitmapData)
         {
            return;
         }
         if(!class_2413.method_2090(param1))
         {
            throw new Error("Invalid bitmapData: Width and height must be power of 2 and cannot exceed 2048");
         }
         method_1112();
         setSize(param1.width,param1.height);
         this._bitmapData = param1;
         if(this.var_3136)
         {
            this.method_6220();
         }
      }
      
      override protected function method_24(param1:TextureBase) : void
      {
         if(this.var_3136)
         {
            class_2432.generateMipMaps(this._bitmapData,param1,this.var_1088,true);
         }
         else
         {
            Texture(param1).uploadFromBitmapData(this._bitmapData,0);
         }
      }
      
      private function method_6220() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         _loc1_ = uint(this._bitmapData.width);
         _loc2_ = uint(this._bitmapData.height);
         if(this.var_1088)
         {
            if(this.var_1088.width == _loc1_ && this._bitmapData.height == _loc2_)
            {
               return;
            }
            this.method_5042();
         }
         if(true)
         {
            var_4726[_loc1_] = [];
            var_4967[_loc1_] = [];
         }
         if(!var_4726[_loc1_][_loc2_])
         {
            this.var_1088 = var_4726[_loc1_][_loc2_] = new BitmapData(_loc1_,_loc2_,true);
            var_4967[_loc1_][_loc2_] = 1;
         }
         else
         {
            var_4967[_loc1_][_loc2_] += 1;
            this.var_1088 = var_4726[_loc1_][_loc2_];
         }
      }
      
      private function method_5042() : void
      {
         var _loc1_:uint = uint(this.var_1088.width);
         var _loc2_:uint = uint(this.var_1088.height);
         if(--var_4967[_loc1_][_loc2_] == 0)
         {
            var_4726[_loc1_][_loc2_].dispose();
            var_4726[_loc1_][_loc2_] = null;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_1088)
         {
            this.method_5042();
         }
      }
   }
}
