package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_567 implements ICommand
   {
      
      public static const const_3014:uint = 0;
      
      public static const const_1695:uint = 1;
      
      public static const const_297:uint = 2;
      
      public static const const_512:uint = 3;
      
      public static const ID:int = 30964;
       
      
      public var type:uint = 0;
      
      public function class_567(param1:uint = 0)
      {
         super();
         this.type = param1;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 0;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.type = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.type);
      }
   }
}
