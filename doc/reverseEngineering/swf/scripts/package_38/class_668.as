package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_668 implements ICommand
   {
      
      public static const ID:int = 28720;
       
      
      public var name_78:Boolean = false;
      
      public var var_2674:class_672;
      
      public function class_668(param1:class_672 = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            this.var_2674 = new class_672();
         }
         else
         {
            this.var_2674 = param1;
         }
         this.name_78 = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 1;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_78 = param1.readBoolean();
         this.var_2674 = class_127.getInstance().createInstance(param1.readShort()) as class_672;
         this.var_2674.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.name_78);
         this.var_2674.write(param1);
      }
   }
}
