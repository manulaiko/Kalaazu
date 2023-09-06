package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_494 implements ICommand
   {
      
      public static const ID:int = 3561;
       
      
      public var var_4862:int = 0;
      
      public function class_494(param1:int = 0)
      {
         super();
         this.var_4862 = param1;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_4862 = param1.readInt();
         this.var_4862 = Number(this.var_4862) << 8 | Number(this.var_4862) >>> 24;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_4862) >>> 8 | Number(this.var_4862) << 24);
      }
   }
}
