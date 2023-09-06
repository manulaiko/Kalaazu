package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_685 implements ICommand
   {
      
      public static const ID:int = 4479;
       
      
      public var windowId:int = 0;
      
      public function class_685(param1:int = 0)
      {
         super();
         this.windowId = param1;
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
         this.windowId = param1.readInt();
         this.windowId = Number(this.windowId) >>> 11 | Number(this.windowId) << 21;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.windowId) << 11 | Number(this.windowId) >>> 21);
         param1.writeShort(-17680);
      }
   }
}
