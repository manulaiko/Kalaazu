package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_880 implements ICommand
   {
      
      public static const ID:int = 18777;
       
      
      public var name_128:int = 0;
      
      public var var_1728:int = 0;
      
      public function class_880(param1:int = 0, param2:int = 0)
      {
         super();
         this.name_128 = param1;
         this.var_1728 = param2;
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
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) >>> 4 | Number(this.name_128) << 28;
         this.var_1728 = param1.readInt();
         this.var_1728 = Number(this.var_1728) >>> 11 | Number(this.var_1728) << 21;
         param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_128) << 4 | Number(this.name_128) >>> 28);
         param1.writeInt(Number(this.var_1728) << 11 | Number(this.var_1728) >>> 21);
         param1.writeShort(187);
         param1.writeShort(-25639);
      }
   }
}
