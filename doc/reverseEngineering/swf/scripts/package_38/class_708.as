package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_708 implements ICommand
   {
      
      public static const ID:int = 3220;
       
      
      public var score:int = 0;
      
      public var var_5014:int = 0;
      
      public var factionId:int = 0;
      
      public function class_708(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.factionId = param1;
         this.score = param2;
         this.var_5014 = param3;
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
         this.score = param1.readInt();
         this.score = Number(this.score) >>> 7 | Number(this.score) << 25;
         this.var_5014 = param1.readInt();
         this.var_5014 = Number(this.var_5014) << 10 | Number(this.var_5014) >>> 22;
         this.factionId = param1.readInt();
         this.factionId = Number(this.factionId) << 5 | Number(this.factionId) >>> 27;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.score) << 7 | Number(this.score) >>> 25);
         param1.writeInt(Number(this.var_5014) >>> 10 | Number(this.var_5014) << 22);
         param1.writeInt(Number(this.factionId) >>> 5 | Number(this.factionId) << 27);
         param1.writeShort(677);
      }
   }
}
