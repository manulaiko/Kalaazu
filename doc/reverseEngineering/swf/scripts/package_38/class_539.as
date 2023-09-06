package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_539 implements ICommand
   {
      
      public static const TECH_FACTORY:uint = 0;
      
      public static const ID:int = 8401;
       
      
      public var name_87:Boolean = false;
      
      public var var_670:uint = 0;
      
      public function class_539(param1:uint = 0, param2:Boolean = false)
      {
         super();
         this.var_670 = param1;
         this.name_87 = param2;
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
         param1.readShort();
         this.name_87 = param1.readBoolean();
         this.var_670 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(1406);
         param1.writeBoolean(this.name_87);
         param1.writeShort(this.var_670);
      }
   }
}
