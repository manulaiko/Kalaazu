package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_720 implements ICommand
   {
      
      public static const ID:int = 26941;
       
      
      public var slotId:int = 0;
      
      public var var_1529:int = 0;
      
      public function class_720(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_1529 = param1;
         this.slotId = param2;
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
         this.slotId = param1.readInt();
         this.slotId = Number(this.slotId) << 4 | Number(this.slotId) >>> 28;
         this.var_1529 = param1.readInt();
         this.var_1529 = Number(this.var_1529) << 5 | Number(this.var_1529) >>> 27;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.slotId) >>> 4 | Number(this.slotId) << 28);
         param1.writeInt(Number(this.var_1529) >>> 5 | Number(this.var_1529) << 27);
      }
   }
}
