package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_799 implements ICommand
   {
      
      public static const ID:int = 28186;
       
      
      public var var_1898:Number = 0;
      
      public var var_3657:Number = 0;
      
      public var var_4723:Number = 0;
      
      public var var_3889:int = 0;
      
      public function class_799(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:int = 0)
      {
         super();
         this.var_4723 = param1;
         this.var_3657 = param2;
         this.var_1898 = param3;
         this.var_3889 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 28;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_1898 = param1.readDouble();
         this.var_3657 = param1.readDouble();
         this.var_4723 = param1.readDouble();
         this.var_3889 = param1.readInt();
         this.var_3889 = Number(this.var_3889) >>> 12 | Number(this.var_3889) << 20;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeDouble(this.var_1898);
         param1.writeDouble(this.var_3657);
         param1.writeDouble(this.var_4723);
         param1.writeInt(Number(this.var_3889) << 12 | Number(this.var_3889) >>> 20);
      }
   }
}
