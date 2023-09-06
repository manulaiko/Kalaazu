package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_632 implements ICommand
   {
      
      public static const ID:int = 31644;
       
      
      public var credits:int = 0;
      
      public var uridium:int = 0;
      
      public var jackpot:Number = 0;
      
      public function class_632(param1:int = 0, param2:int = 0, param3:Number = 0)
      {
         super();
         this.credits = param1;
         this.uridium = param2;
         this.jackpot = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 12;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.credits = param1.readInt();
         this.credits = Number(this.credits) << 15 | Number(this.credits) >>> 17;
         this.uridium = param1.readInt();
         this.uridium = Number(this.uridium) >>> 12 | Number(this.uridium) << 20;
         this.jackpot = param1.readFloat();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.credits) >>> 15 | Number(this.credits) << 17);
         param1.writeInt(Number(this.uridium) << 12 | Number(this.uridium) >>> 20);
         param1.writeFloat(this.jackpot);
         param1.writeShort(-32144);
      }
   }
}
