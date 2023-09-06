package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_611 implements ICommand
   {
      
      public static const ID:int = 21683;
       
      
      public var var_2129:Boolean = false;
      
      public var var_4496:Boolean = false;
      
      public var var_749:Boolean = false;
      
      public var var_692:Boolean = false;
      
      public var var_1670:Boolean = false;
      
      public var var_3177:Boolean = false;
      
      public function class_611(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super();
         this.var_4496 = param1;
         this.var_749 = param2;
         this.var_692 = param3;
         this.var_1670 = param4;
         this.var_3177 = param5;
         this.var_2129 = param6;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 6;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_2129 = param1.readBoolean();
         this.var_4496 = param1.readBoolean();
         this.var_749 = param1.readBoolean();
         this.var_692 = param1.readBoolean();
         param1.readShort();
         this.var_1670 = param1.readBoolean();
         this.var_3177 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.var_2129);
         param1.writeBoolean(this.var_4496);
         param1.writeBoolean(this.var_749);
         param1.writeBoolean(this.var_692);
         param1.writeShort(-19304);
         param1.writeBoolean(this.var_1670);
         param1.writeBoolean(this.var_3177);
      }
   }
}
