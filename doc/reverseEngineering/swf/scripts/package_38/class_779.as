package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_779 implements ICommand
   {
      
      public static const ID:int = 15451;
       
      
      public var var_1156:int = 0;
      
      public var name_128:int = 0;
      
      public function class_779(param1:int = 0, param2:int = 0)
      {
         super();
         this.name_128 = param1;
         this.var_1156 = param2;
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
         this.var_1156 = param1.readInt();
         this.var_1156 = Number(this.var_1156) >>> 13 | Number(this.var_1156) << 19;
         param1.readShort();
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) << 16 | Number(this.name_128) >>> 16;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1156) << 13 | Number(this.var_1156) >>> 19);
         param1.writeShort(2571);
         param1.writeInt(Number(this.name_128) >>> 16 | Number(this.name_128) << 16);
      }
   }
}
