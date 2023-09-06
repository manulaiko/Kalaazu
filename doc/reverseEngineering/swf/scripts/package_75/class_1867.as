package package_75
{
   import package_113.class_2285;
   import package_29.class_85;
   import package_35.Effect;
   import package_35.class_338;
   import package_35.class_348;
   
   public class class_1867 extends class_348
   {
       
      
      private var _level:int;
      
      public function class_1867(param1:class_85, param2:int)
      {
         this._level = param2;
         super(class_338.const_1100,param1,const_2311);
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      override public function method_5571(param1:Effect) : void
      {
         var _loc2_:class_2285 = this.method_3685();
         _loc2_.level.value = this._level = (param1 as class_1867).level;
      }
      
      override public function deactivate() : void
      {
         this.removeTrait();
         super.deactivate();
      }
      
      override public function activate() : Boolean
      {
         var _loc1_:class_2285 = this.method_3685();
         _loc1_.level.value = this.level;
         return super.activate();
      }
      
      private function method_3685() : class_2285
      {
         var _loc1_:class_2285 = source.method_1954(class_2285) as class_2285;
         if(!_loc1_)
         {
            _loc1_ = new class_2285(class_2285.BUFF);
            source.addTrait(_loc1_);
         }
         _loc1_.type.value = class_2285.BUFF;
         return _loc1_;
      }
      
      private function removeTrait() : void
      {
         source.method_2049(class_2285);
      }
   }
}
