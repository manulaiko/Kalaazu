package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_623 implements ICommand
   {
      
      public static const ID:int = 30515;
       
      
      public var name_128:int = 0;
      
      public var var_3862:Boolean = false;
      
      public function class_623(param1:int = 0, param2:Boolean = false)
      {
         super();
         this.name_128 = param1;
         this.var_3862 = param2;
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
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) >>> 7 | Number(this.name_128) << 25;
         param1.readShort();
         this.var_3862 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_128) << 7 | Number(this.name_128) >>> 25);
         param1.writeShort(-30128);
         param1.writeBoolean(this.var_3862);
      }
   }
}
