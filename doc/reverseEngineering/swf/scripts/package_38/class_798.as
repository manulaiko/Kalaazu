package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_798 implements ICommand
   {
      
      public static const ID:int = 16508;
       
      
      public var var_1675:int = 0;
      
      public var rank:int = 0;
      
      public var var_2265:int = 0;
      
      public var name:String = "";
      
      public var name_120:String = "";
      
      public function class_798(param1:String = "", param2:String = "", param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.name = param1;
         this.name_120 = param2;
         this.rank = param3;
         this.var_1675 = param4;
         this.var_2265 = param5;
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
         this.var_1675 = param1.readInt();
         this.var_1675 = Number(this.var_1675) >>> 5 | Number(this.var_1675) << 27;
         this.rank = param1.readInt();
         this.rank = Number(this.rank) >>> 5 | Number(this.rank) << 27;
         this.var_2265 = param1.readInt();
         this.var_2265 = Number(this.var_2265) << 6 | Number(this.var_2265) >>> 26;
         this.name = param1.readUTF();
         this.name_120 = param1.readUTF();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1675) << 5 | Number(this.var_1675) >>> 27);
         param1.writeInt(Number(this.rank) << 5 | Number(this.rank) >>> 27);
         param1.writeInt(Number(this.var_2265) >>> 6 | Number(this.var_2265) << 26);
         param1.writeUTF(this.name);
         param1.writeUTF(this.name_120);
         param1.writeShort(-10417);
      }
   }
}
