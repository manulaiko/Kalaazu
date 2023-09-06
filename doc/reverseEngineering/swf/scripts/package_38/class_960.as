package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_960 implements ICommand
   {
      
      public static const ID:int = 22275;
       
      
      public var var_3869:int = 0;
      
      public var var_3079:Boolean = false;
      
      public function class_960(param1:int = 0, param2:Boolean = false)
      {
         super();
         this.var_3869 = param1;
         this.var_3079 = param2;
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
         this.var_3869 = param1.readInt();
         this.var_3869 = Number(this.var_3869) << 11 | Number(this.var_3869) >>> 21;
         this.var_3079 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_3869) >>> 11 | Number(this.var_3869) << 21);
         param1.writeBoolean(this.var_3079);
      }
   }
}
