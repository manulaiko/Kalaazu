package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_671 implements ICommand
   {
      
      public static const ID:int = 14620;
       
      
      public var var_2092:String = "";
      
      public var slotId:int = 0;
      
      public function class_671(param1:int = 0, param2:String = "")
      {
         super();
         this.slotId = param1;
         this.var_2092 = param2;
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
         this.var_2092 = param1.readUTF();
         this.slotId = param1.readInt();
         this.slotId = Number(this.slotId) >>> 5 | Number(this.slotId) << 27;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.var_2092);
         param1.writeInt(Number(this.slotId) << 5 | Number(this.slotId) >>> 27);
      }
   }
}
