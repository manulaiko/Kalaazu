package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_660 implements ICommand
   {
      
      public static const ID:int = 28000;
       
      
      public var var_313:int = 0;
      
      public var var_4761:int = 0;
      
      public function class_660(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_313 = param1;
         this.var_4761 = param2;
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
         param1.readShort();
         this.var_313 = param1.readInt();
         this.var_313 = Number(this.var_313) >>> 12 | Number(this.var_313) << 20;
         this.var_4761 = param1.readInt();
         this.var_4761 = Number(this.var_4761) << 5 | Number(this.var_4761) >>> 27;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(31140);
         param1.writeInt(Number(this.var_313) << 12 | Number(this.var_313) >>> 20);
         param1.writeInt(Number(this.var_4761) >>> 5 | Number(this.var_4761) << 27);
      }
   }
}
