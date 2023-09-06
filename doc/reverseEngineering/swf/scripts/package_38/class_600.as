package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_600 extends class_599 implements ICommand
   {
      
      public static const ID:int = 9048;
       
      
      public var var_2093:int = 0;
      
      public function class_600(param1:int = 0)
      {
         super();
         this.var_2093 = param1;
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
         this.var_2093 = param1.readInt();
         this.var_2093 = Number(this.var_2093) >>> 14 | Number(this.var_2093) << 18;
         param1.readShort();
         param1.readShort();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeInt(Number(this.var_2093) << 14 | Number(this.var_2093) >>> 18);
         param1.writeShort(20784);
         param1.writeShort(-27948);
      }
   }
}
