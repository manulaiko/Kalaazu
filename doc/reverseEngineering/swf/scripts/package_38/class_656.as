package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_656 extends class_606 implements ICommand
   {
      
      public static const ID:int = 3248;
       
      
      public var value:int = 0;
      
      public function class_656(param1:int = 0)
      {
         super();
         this.value = param1;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 4;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.value = param1.readInt();
         this.value = Number(this.value) >>> 6 | Number(this.value) << 26;
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeInt(Number(this.value) << 6 | Number(this.value) >>> 26);
      }
   }
}
