package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_729 implements ICommand
   {
      
      public static const ID:int = 2520;
       
      
      public var itemId:int = 0;
      
      public var replace:Boolean = false;
      
      public var slotId:int = 0;
      
      public var var_1529:int = 0;
      
      public function class_729(param1:int = 0, param2:int = 0, param3:int = 0, param4:Boolean = false)
      {
         super();
         this.var_1529 = param1;
         this.itemId = param2;
         this.slotId = param3;
         this.replace = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 13;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.itemId = param1.readInt();
         this.itemId = Number(this.itemId) << 4 | Number(this.itemId) >>> 28;
         this.replace = param1.readBoolean();
         this.slotId = param1.readInt();
         this.slotId = Number(this.slotId) << 5 | Number(this.slotId) >>> 27;
         this.var_1529 = param1.readInt();
         this.var_1529 = Number(this.var_1529) << 4 | Number(this.var_1529) >>> 28;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.itemId) >>> 4 | Number(this.itemId) << 28);
         param1.writeBoolean(this.replace);
         param1.writeInt(Number(this.slotId) >>> 5 | Number(this.slotId) << 27);
         param1.writeInt(Number(this.var_1529) >>> 4 | Number(this.var_1529) << 28);
      }
   }
}
