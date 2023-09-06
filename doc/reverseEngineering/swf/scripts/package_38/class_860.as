package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_860 implements ICommand
   {
      
      public static const ID:int = 12258;
       
      
      public var isActive:Boolean = false;
      
      public var var_4905:int = 0;
      
      public function class_860(param1:int = 0, param2:Boolean = false)
      {
         super();
         this.var_4905 = param1;
         this.isActive = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 5;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.isActive = param1.readBoolean();
         this.var_4905 = param1.readInt();
         this.var_4905 = Number(this.var_4905) >>> 15 | Number(this.var_4905) << 17;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.isActive);
         param1.writeInt(Number(this.var_4905) << 15 | Number(this.var_4905) >>> 17);
      }
   }
}
