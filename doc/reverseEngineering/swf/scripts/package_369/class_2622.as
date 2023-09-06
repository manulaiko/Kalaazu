package package_369
{
   import away3d.arcane;
   import flash.display.BitmapData;
   import flash.display3D.textures.TextureBase;
   import package_434.class_2413;
   import package_441.class_2432;
   
   public class class_2622 extends class_2570
   {
       
      
      private var var_920:Vector.<BitmapData>;
      
      public function class_2622(param1:BitmapData, param2:BitmapData, param3:BitmapData, param4:BitmapData, param5:BitmapData, param6:BitmapData)
      {
         super();
         this.var_920 = new Vector.<BitmapData>(6,true);
         this.method_4886(this.var_920[0] = param1);
         this.method_4886(this.var_920[1] = param2);
         this.method_4886(this.var_920[2] = param3);
         this.method_4886(this.var_920[3] = param4);
         this.method_4886(this.var_920[4] = param5);
         this.method_4886(this.var_920[5] = param6);
         setSize(param1.width,param1.height);
      }
      
      public function get method_4534() : BitmapData
      {
         return this.var_920[0];
      }
      
      public function set method_4534(param1:BitmapData) : void
      {
         this.method_4886(param1);
         method_1112();
         setSize(param1.width,param1.height);
         this.var_920[0] = param1;
      }
      
      public function get method_871() : BitmapData
      {
         return this.var_920[1];
      }
      
      public function set method_871(param1:BitmapData) : void
      {
         this.method_4886(param1);
         method_1112();
         setSize(param1.width,param1.height);
         this.var_920[1] = param1;
      }
      
      public function get method_912() : BitmapData
      {
         return this.var_920[2];
      }
      
      public function set method_912(param1:BitmapData) : void
      {
         this.method_4886(param1);
         method_1112();
         setSize(param1.width,param1.height);
         this.var_920[2] = param1;
      }
      
      public function get method_4422() : BitmapData
      {
         return this.var_920[3];
      }
      
      public function set method_4422(param1:BitmapData) : void
      {
         this.method_4886(param1);
         method_1112();
         setSize(param1.width,param1.height);
         this.var_920[3] = param1;
      }
      
      public function get method_1149() : BitmapData
      {
         return this.var_920[4];
      }
      
      public function set method_1149(param1:BitmapData) : void
      {
         this.method_4886(param1);
         method_1112();
         setSize(param1.width,param1.height);
         this.var_920[4] = param1;
      }
      
      public function get method_5582() : BitmapData
      {
         return this.var_920[5];
      }
      
      public function set method_5582(param1:BitmapData) : void
      {
         this.method_4886(param1);
         method_1112();
         setSize(param1.width,param1.height);
         this.var_920[5] = param1;
      }
      
      private function method_4886(param1:BitmapData) : void
      {
         if(param1.width != param1.height)
         {
            throw new Error("BitmapData should have equal width and height!");
         }
         if(!class_2413.method_2090(param1))
         {
            throw new Error("Invalid bitmapData: Width and height must be power of 2 and cannot exceed 2048");
         }
      }
      
      override protected function method_24(param1:TextureBase) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            class_2432.generateMipMaps(this.var_920[_loc2_],param1,null,this.var_920[_loc2_].transparent,_loc2_);
            _loc2_++;
         }
      }
   }
}
