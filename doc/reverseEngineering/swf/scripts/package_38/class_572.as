package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_572 implements ICommand
   {
      
      public static const ID:int = 32054;
       
      
      public var minutes:int = 0;
      
      public var var_1529:int = 0;
      
      public function class_572(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_1529 = param1;
         this.minutes = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.minutes = param1.readInt();
         this.minutes = Number(this.minutes) << 9 | Number(this.minutes) >>> 23;
         this.var_1529 = param1.readInt();
         this.var_1529 = Number(this.var_1529) >>> 7 | Number(this.var_1529) << 25;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.minutes) >>> 9 | Number(this.minutes) << 23);
         param1.writeInt(Number(this.var_1529) << 7 | Number(this.var_1529) >>> 25);
      }
   }
}
