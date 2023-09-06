package package_467
{
   import away3d.arcane;
   import flash.net.URLRequest;
   import package_293.class_1751;
   import package_293.class_2131;
   import package_307.class_1772;
   import package_307.class_1776;
   import package_368.class_2416;
   import package_369.class_2116;
   import package_369.class_2118;
   import package_466.class_2598;
   
   public class TextureMaterialSubParser extends class_2596
   {
       
      
      private var _texture:class_1776;
      
      private var _repeat:Boolean;
      
      private var _smooth:Boolean;
      
      private var var_979:Boolean;
      
      private var var_1893:Number = 0;
      
      public function TextureMaterialSubParser()
      {
         super();
      }
      
      public static function get identifier() : *
      {
         return class_2598.TextureMaterialSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         if(var_117)
         {
            this._repeat = _data.repeat;
            this._smooth = _data.smooth;
            this.var_979 = _data.alphaBlending;
            this.var_1893 = _data.alphaThreshold;
            if(true)
            {
               method_444("no texture url");
               return const_2971;
            }
            _loc1_ = new URLRequest(_data.url);
            method_597("default1",_loc1_);
         }
         return super.method_196();
      }
      
      override arcane function method_3765(param1:class_2416) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:Vector.<class_1751> = param1.assets;
         var _loc3_:int = _loc2_.length;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = _loc2_[_loc4_]).assetType == class_2131.TEXTURE)
            {
               this._texture = new class_1776(_loc5_ as class_2116,this._smooth,this._repeat);
               this._texture.bothSides = var_1273;
               this._texture.alphaBlending = this.var_979;
               this._texture.blendMode = _blendMode;
               this._texture.alphaThreshold = this.var_1893;
               this._texture.alphaPremultiplied = !(_loc5_ is class_2118);
               method_3342(this._texture);
               return;
            }
            _loc4_++;
         }
         method_444("resolveDependencyFailure");
      }
      
      override arcane function resolveDependencyFailure(param1:class_2416) : void
      {
         method_444("resolveDependencyFailure");
      }
      
      override public function get material() : class_1772
      {
         return this._texture;
      }
   }
}
