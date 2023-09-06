package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_814 implements ICommand
   {
      
      public static const ID:int = 17224;
       
      
      public var var_4280:int = 0;
      
      public var var_3126:int = 0;
      
      public var var_1956:int = 0;
      
      public function class_814(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.var_3126 = param1;
         this.var_1956 = param2;
         this.var_4280 = param3;
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
         this.var_4280 = param1.readInt();
         this.var_4280 = Number(this.var_4280) << 1 | Number(this.var_4280) >>> 31;
         this.var_3126 = param1.readInt();
         this.var_3126 = Number(this.var_3126) << 10 | Number(this.var_3126) >>> 22;
         this.var_1956 = param1.readInt();
         this.var_1956 = Number(this.var_1956) >>> 14 | Number(this.var_1956) << 18;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_4280) >>> 1 | Number(this.var_4280) << 31);
         param1.writeInt(Number(this.var_3126) >>> 10 | Number(this.var_3126) << 22);
         param1.writeInt(Number(this.var_1956) << 14 | Number(this.var_1956) >>> 18);
      }
   }
}
