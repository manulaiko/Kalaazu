package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_761 implements ICommand
   {
      
      public static const ID:int = 5862;
       
      
      public var uid:int = 0;
      
      public function class_761(param1:int = 0)
      {
         super();
         this.uid = param1;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         param1.readShort();
         this.uid = param1.readInt();
         this.uid = Number(this.uid) << 2 | Number(this.uid) >>> 30;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-13671);
         param1.writeInt(Number(this.uid) >>> 2 | Number(this.uid) << 30);
      }
   }
}
