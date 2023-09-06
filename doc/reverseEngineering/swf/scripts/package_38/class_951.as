package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_951 implements ICommand
   {
      
      public static const const_1652:uint = 1;
      
      public static const const_765:uint = 0;
      
      public static const ID:int = 26667;
       
      
      public var var_2454:uint = 0;
      
      public var var_276:int = 0;
      
      public function class_951(param1:int = 0, param2:uint = 0)
      {
         super();
         this.var_276 = param1;
         this.var_2454 = param2;
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
         this.var_2454 = param1.readShort();
         this.var_276 = param1.readInt();
         this.var_276 = Number(this.var_276) >>> 16 | Number(this.var_276) << 16;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_2454);
         param1.writeInt(Number(this.var_276) << 16 | Number(this.var_276) >>> 16);
      }
   }
}
