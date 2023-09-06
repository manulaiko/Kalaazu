package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_515 implements ICommand
   {
      
      public static const const_1816:uint = 2;
      
      public static const NONE:uint = 0;
      
      public static const const_1887:uint = 1;
      
      public static const ID:int = 14175;
       
      
      public var var_2241:int = 0;
      
      public var reason:uint = 0;
      
      public function class_515(param1:int = 0, param2:uint = 0)
      {
         super();
         this.var_2241 = param1;
         this.reason = param2;
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
         param1.readShort();
         param1.readShort();
         this.var_2241 = param1.readInt();
         this.var_2241 = Number(this.var_2241) << 7 | Number(this.var_2241) >>> 25;
         this.reason = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(18980);
         param1.writeShort(16336);
         param1.writeInt(Number(this.var_2241) >>> 7 | Number(this.var_2241) << 25);
         param1.writeShort(this.reason);
      }
   }
}
