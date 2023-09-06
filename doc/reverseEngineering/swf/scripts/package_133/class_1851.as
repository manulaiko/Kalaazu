package package_133
{
   import package_132.class_382;
   import package_322.class_1808;
   import package_38.class_439;
   import package_38.class_445;
   
   public class class_1851 implements class_382
   {
      
      private static const const_1221:Object = {};
      
      {
         const_1221[class_439.MMO] = {};
         const_1221[class_439.MMO][class_445.const_2477] = "headquarters_mmo_demolished";
         const_1221[class_439.MMO][class_445.const_1965] = "headquarters_mmo_demolished";
         const_1221[class_439.EIC] = {};
         const_1221[class_439.EIC][class_445.const_2477] = "headquarters_eic_demolished";
         const_1221[class_439.EIC][class_445.const_1965] = "headquarters_eic_demolished";
         const_1221[class_439.VRU] = {};
         const_1221[class_439.VRU][class_445.const_2477] = "headquarters_vru_demolished";
         const_1221[class_439.VRU][class_445.const_1965] = "headquarters_vru_demolished";
      }
      
      private var _isActive:Boolean;
      
      private var _id:int;
      
      public function class_1851(param1:uint, param2:Boolean)
      {
         super();
         this._id = param1;
         this._isActive = param2;
         this.method_3769();
      }
      
      public function get isActive() : Boolean
      {
         return this._isActive;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      private function method_3769() : void
      {
         class_1808.method_5437(!!this._isActive ? const_1221 : null);
      }
   }
}
