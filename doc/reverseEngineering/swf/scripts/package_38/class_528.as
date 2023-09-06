package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_528 implements ICommand
   {
      
      public static const ID:int = 31959;
       
      
      public var var_4378:int = 0;
      
      public var var_1461:int = 0;
      
      public function class_528(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_4378 = param1;
         this.var_1461 = param2;
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
         this.var_4378 = param1.readInt();
         this.var_4378 = Number(this.var_4378) << 3 | Number(this.var_4378) >>> 29;
         this.var_1461 = param1.readInt();
         this.var_1461 = Number(this.var_1461) << 11 | Number(this.var_1461) >>> 21;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_4378) >>> 3 | Number(this.var_4378) << 29);
         param1.writeInt(Number(this.var_1461) >>> 11 | Number(this.var_1461) << 21);
         param1.writeShort(-30106);
      }
   }
}
