package package_112
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_100.class_270;
   import package_100.class_313;
   import package_101.class_1176;
   import package_115.class_316;
   
   public class class_307 extends class_86
   {
       
      
      private var var_1457:class_420;
      
      public function class_307(param1:int, param2:class_316, param3:int, param4:int)
      {
         this.var_1457 = new class_420();
         super(param1,param2,param3 == class_81.userID ? new class_313("mapIcon_pet","minimap",-1) : new class_1176());
         addTrait(this.method_1431);
         this.method_1431.method_4673 = param3;
         this.method_1431.level = param4;
      }
      
      public function method_6014(param1:int, param2:int) : void
      {
         this.method_1431.method_6518 = param2;
         this.method_1431.method_5872 = param1;
      }
      
      public function set name_127(param1:int) : void
      {
         this.method_1431.name_127.value = param1;
      }
      
      public function get name_127() : int
      {
         return this.method_1431.name_127.value;
      }
      
      public function isHeroPet() : Boolean
      {
         return this.method_1431.method_4673 == class_81.userID;
      }
      
      override protected function method_1915() : void
      {
         if(this.isHeroPet() == false)
         {
            super.method_1915();
         }
      }
      
      private function get method_1431() : class_420
      {
         return this.var_1457;
      }
      
      override protected function method_2862(param1:Vector.<Object>) : void
      {
         super.method_2862(param1);
         if(this.isHeroPet())
         {
            param1.push({"id":"heroPet"});
         }
      }
   }
}
