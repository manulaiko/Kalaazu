package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_455 implements ICommand
   {
      
      public static const END:uint = 1;
      
      public static const START:uint = 0;
      
      public static const ID:int = 9161;
       
      
      public var var_2168:int = 0;
      
      public var var_2473:uint = 0;
      
      public function class_455(param1:uint = 0, param2:int = 0)
      {
         super();
         this.var_2473 = param1;
         this.var_2168 = param2;
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
         this.var_2168 = param1.readInt();
         this.var_2168 = Number(this.var_2168) >>> 2 | Number(this.var_2168) << 30;
         this.var_2473 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_2168) << 2 | Number(this.var_2168) >>> 30);
         param1.writeShort(this.var_2473);
      }
   }
}
