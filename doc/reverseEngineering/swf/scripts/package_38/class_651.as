package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_651 extends class_650 implements ICommand
   {
      
      public static const ID:int = 14864;
       
      
      public var var_1156:int = 0;
      
      public function class_651(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super(param1,param4,param3);
         this.var_1156 = param2;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 24;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.var_1156 = param1.readInt();
         this.var_1156 = Number(this.var_1156) << 7 | Number(this.var_1156) >>> 25;
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeInt(Number(this.var_1156) >>> 7 | Number(this.var_1156) << 25);
      }
   }
}
