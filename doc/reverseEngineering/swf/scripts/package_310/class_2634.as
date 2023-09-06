package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_199.class_2253;
   import package_309.class_1774;
   import package_369.class_2116;
   import package_385.class_2237;
   import package_385.class_2250;
   import package_385.class_2251;
   
   public class class_2634 extends class_2241
   {
       
      
      private var var_1463:class_2241;
      
      public function class_2634(param1:Function, param2:class_2241 = null)
      {
         super();
         this.var_1463 = param2 || new class_2241();
         this.var_1463.arcane::var_366 = param1;
         this.var_1463.addEventListener(class_2253.const_3136,this.method_404);
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         this.var_1463.arcane::initVO(param1);
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         this.var_1463.arcane::method_4956(param1);
      }
      
      public function get method_5573() : class_2241
      {
         return this.var_1463;
      }
      
      public function set method_5573(param1:class_2241) : void
      {
         if(this.var_1463 == param1)
         {
            return;
         }
         this.var_1463.removeEventListener(class_2253.const_3136,this.method_404);
         this.var_1463 = param1;
         this.var_1463.addEventListener(class_2253.const_3136,this.method_404,false,0,true);
         method_220();
      }
      
      override public function get gloss() : Number
      {
         return this.var_1463.gloss;
      }
      
      override public function set gloss(param1:Number) : void
      {
         this.var_1463.gloss = param1;
      }
      
      override public function get specular() : Number
      {
         return this.var_1463.specular;
      }
      
      override public function set specular(param1:Number) : void
      {
         this.var_1463.specular = param1;
      }
      
      override public function get method_4325() : Vector.<class_1774>
      {
         return this.var_1463.method_4325;
      }
      
      override public function dispose() : void
      {
         this.var_1463.removeEventListener(class_2253.const_3136,this.method_404);
         this.var_1463.dispose();
      }
      
      override public function get texture() : class_2116
      {
         return this.var_1463.texture;
      }
      
      override public function set texture(param1:class_2116) : void
      {
         this.var_1463.texture = param1;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         this.var_1463.arcane::activate(param1,param2);
      }
      
      override arcane function deactivate(param1:class_2252, param2:class_1208) : void
      {
         this.var_1463.arcane::deactivate(param1,param2);
      }
      
      override arcane function set sharedRegisters(param1:class_2250) : void
      {
         super.arcane::sharedRegisters = this.var_1463.arcane::sharedRegisters = param1;
      }
      
      override arcane function getVertexCode(param1:class_2252, param2:class_2237) : String
      {
         return this.var_1463.arcane::getVertexCode(param1,param2);
      }
      
      override arcane function method_1029(param1:class_2252, param2:class_2237) : String
      {
         return this.var_1463.arcane::method_1029(param1,param2);
      }
      
      override arcane function method_4161(param1:class_2252, param2:class_2251, param3:class_2251, param4:class_2237) : String
      {
         return this.var_1463.arcane::method_4161(param1,param2,param3,param4);
      }
      
      override arcane function method_1573(param1:class_2252, param2:class_2251, param3:String, param4:class_2237) : String
      {
         return this.var_1463.arcane::method_1573(param1,param2,param3,param4);
      }
      
      override arcane function method_5951(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         return this.var_1463.arcane::method_5951(param1,param2,param3);
      }
      
      override arcane function reset() : void
      {
         this.var_1463.arcane::reset();
      }
      
      override arcane function method_3031() : void
      {
         super.arcane::method_3031();
         this.var_1463.arcane::method_3031();
      }
      
      override arcane function set shadowRegister(param1:class_2251) : void
      {
         super.arcane::shadowRegister = param1;
         this.var_1463.arcane::shadowRegister = param1;
      }
      
      private function method_404(param1:class_2253) : void
      {
         method_220();
      }
   }
}
