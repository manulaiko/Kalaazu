package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_346 implements ICommand
   {
      
      public static const CREDITS:uint = 0;
      
      public static const URIDIUM:uint = 1;
      
      public static const ID:int = 10487;
       
      
      public var type:uint = 0;
      
      public var amount:int = 0;
      
      public function class_346(param1:uint = 0, param2:int = 0)
      {
         super();
         this.type = param1;
         this.amount = param2;
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
         this.type = param1.readShort();
         this.amount = param1.readInt();
         this.amount = Number(this.amount) << 14 | Number(this.amount) >>> 18;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.type);
         param1.writeInt(Number(this.amount) >>> 14 | Number(this.amount) << 18);
      }
   }
}
