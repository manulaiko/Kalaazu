package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_675 implements ICommand
   {
      
      public static const ID:int = 31697;
       
      
      public var var_4278:Boolean = false;
      
      public function class_675(param1:Boolean = false)
      {
         super();
         this.var_4278 = param1;
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
         param1.readShort();
         this.var_4278 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-14623);
         param1.writeShort(-13135);
         param1.writeBoolean(this.var_4278);
      }
   }
}
