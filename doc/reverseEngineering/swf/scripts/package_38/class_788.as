package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_788 implements ICommand
   {
      
      public static const ID:int = 16131;
       
      
      public var var_1529:int = 0;
      
      public var itemId:int = 0;
      
      public function class_788(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_1529 = param1;
         this.itemId = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_1529 = param1.readInt();
         this.var_1529 = Number(this.var_1529) << 5 | Number(this.var_1529) >>> 27;
         param1.readShort();
         param1.readShort();
         this.itemId = param1.readInt();
         this.itemId = Number(this.itemId) << 12 | Number(this.itemId) >>> 20;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1529) >>> 5 | Number(this.var_1529) << 27);
         param1.writeShort(-29165);
         param1.writeShort(10654);
         param1.writeInt(Number(this.itemId) >>> 12 | Number(this.itemId) << 20);
      }
   }
}
