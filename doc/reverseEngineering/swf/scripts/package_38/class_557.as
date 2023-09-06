package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_557 extends class_556 implements ICommand
   {
      
      public static const ID:int = 4609;
       
      
      public var var_4801:int = 0;
      
      public var var_1011:int = 0;
      
      public var var_1712:Number = 0;
      
      public function class_557(param1:int = 0, param2:int = 0, param3:String = "", param4:Number = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0)
      {
         super(param3,param2,param1,param5,param6);
         this.var_1011 = param8;
         this.var_4801 = param7;
         this.var_1712 = param4;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 48;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         param1.readShort();
         param1.readShort();
         this.var_4801 = param1.readInt();
         this.var_4801 = Number(this.var_4801) << 6 | Number(this.var_4801) >>> 26;
         this.var_1011 = param1.readInt();
         this.var_1011 = Number(this.var_1011) >>> 10 | Number(this.var_1011) << 22;
         this.var_1712 = param1.readFloat();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeShort(-4713);
         param1.writeShort(24563);
         param1.writeInt(Number(this.var_4801) >>> 6 | Number(this.var_4801) << 26);
         param1.writeInt(Number(this.var_1011) << 10 | Number(this.var_1011) >>> 22);
         param1.writeFloat(this.var_1712);
      }
   }
}
