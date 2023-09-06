package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_99 implements ICommand
   {
      
      public static const ID:int = 10996;
       
      
      public var instanceId:int = 0;
      
      public var userID:int = 0;
      
      public var factionID:int = 0;
      
      public var sessionID:String = "";
      
      public var version:String = "";
      
      public function class_99(param1:int = 0, param2:int = 0, param3:String = "", param4:String = "", param5:int = 0)
      {
         super();
         this.userID = param1;
         this.factionID = param2;
         this.sessionID = param3;
         this.version = param4;
         this.instanceId = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 14;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.instanceId = param1.readInt();
         this.instanceId = Number(this.instanceId) << 8 | Number(this.instanceId) >>> 24;
         this.userID = param1.readInt();
         this.userID = Number(this.userID) << 8 | Number(this.userID) >>> 24;
         this.factionID = param1.readShort();
         this.sessionID = param1.readUTF();
         this.version = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.instanceId) >>> 8 | Number(this.instanceId) << 24);
         param1.writeInt(Number(this.userID) >>> 8 | Number(this.userID) << 24);
         param1.writeShort(this.factionID);
         param1.writeUTF(this.sessionID);
         param1.writeUTF(this.version);
      }
   }
}
