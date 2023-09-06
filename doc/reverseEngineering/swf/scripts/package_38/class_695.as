package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_695 implements ICommand
   {
      
      public static const ID:int = 9181;
       
      
      public var name_128:int = 0;
      
      public var var_3280:int = 0;
      
      public var var_15:int = 0;
      
      public var name_150:int = 0;
      
      public function class_695(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.name_128 = param1;
         this.name_150 = param2;
         this.var_3280 = param3;
         this.var_15 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) << 13 | Number(this.name_128) >>> 19;
         this.var_3280 = param1.readInt();
         this.var_3280 = Number(this.var_3280) >>> 6 | Number(this.var_3280) << 26;
         this.var_15 = param1.readInt();
         this.var_15 = Number(this.var_15) << 4 | Number(this.var_15) >>> 28;
         param1.readShort();
         this.name_150 = param1.readInt();
         this.name_150 = Number(this.name_150) << 6 | Number(this.name_150) >>> 26;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_128) >>> 13 | Number(this.name_128) << 19);
         param1.writeInt(Number(this.var_3280) << 6 | Number(this.var_3280) >>> 26);
         param1.writeInt(Number(this.var_15) >>> 4 | Number(this.var_15) << 28);
         param1.writeShort(6545);
         param1.writeInt(Number(this.name_150) >>> 6 | Number(this.name_150) << 26);
         param1.writeShort(-14762);
      }
   }
}
