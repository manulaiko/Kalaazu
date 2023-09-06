package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_913 extends class_650 implements ICommand
   {
      
      public static const ID:int = 2357;
       
      
      public var name_126:int = 0;
      
      public var var_3582:int = 0;
      
      public var var_3851:String = "";
      
      public function class_913(param1:String = "", param2:String = "", param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0)
      {
         super(param1,param6,param5);
         this.name_126 = param4;
         this.var_3582 = param3;
         this.var_3851 = param2;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 30;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.name_126 = param1.readInt();
         this.name_126 = Number(this.name_126) >>> 1 | Number(this.name_126) << 31;
         param1.readShort();
         this.var_3582 = param1.readInt();
         this.var_3582 = Number(this.var_3582) << 13 | Number(this.var_3582) >>> 19;
         param1.readShort();
         this.var_3851 = param1.readUTF();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeInt(Number(this.name_126) << 1 | Number(this.name_126) >>> 31);
         param1.writeShort(-426);
         param1.writeInt(Number(this.var_3582) >>> 13 | Number(this.var_3582) << 19);
         param1.writeShort(-1831);
         param1.writeUTF(this.var_3851);
      }
   }
}
