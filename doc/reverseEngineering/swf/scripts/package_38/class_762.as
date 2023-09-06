package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_762 implements ICommand
   {
      
      public static const const_1488:uint = 3;
      
      public static const const_3150:uint = 2;
      
      public static const const_1420:uint = 1;
      
      public static const const_1830:uint = 0;
      
      public static const ID:int = 20985;
       
      
      public var var_4840:uint = 0;
      
      public function class_762(param1:uint = 0)
      {
         super();
         this.var_4840 = param1;
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
         param1.readShort();
         this.var_4840 = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-24180);
         param1.writeShort(this.var_4840);
         param1.writeShort(-31119);
      }
   }
}
