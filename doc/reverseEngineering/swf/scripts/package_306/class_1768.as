package package_306
{
   import flash.display3D.textures.*;
   import package_198.*;
   import package_305.*;
   import package_384.*;
   
   public class class_1768
   {
       
      
      private var var_1323:Vector.<class_2232>;
      
      private var var_411:Boolean;
      
      private var var_1654:int;
      
      private var var_270:int;
      
      public function class_1768()
      {
         super();
         this.var_1323 = new Vector.<class_2232>();
      }
      
      public function get method_4805() : Boolean
      {
         return this.var_411;
      }
      
      protected function method_2205(param1:class_2232) : void
      {
         this.var_1323.push(param1);
         this.var_411 = Boolean(this.var_411) || Boolean(param1.method_4805);
      }
      
      public function get method_3054() : Vector.<class_2232>
      {
         return this.var_1323;
      }
      
      public function getMainInputTexture(param1:class_1208) : TextureBase
      {
         return this.var_1323[0].getMainInputTexture(param1);
      }
      
      public function get method_1430() : int
      {
         return this.var_1654;
      }
      
      public function set method_1430(param1:int) : void
      {
         this.var_1654 = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1323.length)
         {
            this.var_1323[_loc2_].method_1430 = param1;
            _loc2_++;
         }
      }
      
      public function get method_1059() : int
      {
         return this.var_270;
      }
      
      public function set method_1059(param1:int) : void
      {
         this.var_270 = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1323.length)
         {
            this.var_1323[_loc2_].method_1059 = param1;
            _loc2_++;
         }
      }
      
      public function method_4953(param1:Texture, param2:class_1208) : void
      {
         this.var_1323[this.var_1323.length - 1].target = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1323.length)
         {
            this.var_1323[_loc1_].dispose();
            _loc1_++;
         }
      }
      
      public function update(param1:class_1208, param2:class_1767) : void
      {
      }
   }
}
