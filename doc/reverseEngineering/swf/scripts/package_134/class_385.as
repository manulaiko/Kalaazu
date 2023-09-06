package package_134
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import package_67.class_384;
   
   public class class_385 implements class_384
   {
      
      public static const const_1625:int = 1;
      
      public static const const_999:int = 3;
      
      public static const const_852:int = 3;
       
      
      public var type:int;
      
      public var status:int;
      
      public var isActive:Boolean = false;
      
      public var var_3045:Boolean = false;
      
      public var equipped:Boolean = false;
      
      public var main:class_9;
      
      public var var_3073:Number;
      
      public var name:String;
      
      public var var_2403:int = 15;
      
      public var var_4031:Boolean;
      
      public function class_385(param1:int, param2:class_9)
      {
         super();
         this.main = param2;
         this.type = param1;
         this.name = class_386.method_1243(this.type);
      }
      
      public function setEquipped() : void
      {
         this.equipped = true;
         class_81.var_2083[this.type] = true;
      }
      
      public function unEquip() : void
      {
         this.equipped = false;
         class_81.var_2083[this.type] = false;
      }
      
      public function setReady() : void
      {
         this.equipped = true;
         this.status = const_1625;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function method_80() : int
      {
         return this.status;
      }
   }
}
