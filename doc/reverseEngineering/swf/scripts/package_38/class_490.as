package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_490 implements ICommand
   {
      
      public static const ID:int = 28142;
       
      
      public var var_3294:int = 0;
      
      public function class_490(param1:int = 0)
      {
         super();
         this.var_3294 = param1;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 2;
      }
      
      public function read(param1:IDataInput) : void
      {
         param1.readShort();
         param1.readShort();
         this.var_3294 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(19619);
         param1.writeShort(13002);
         param1.writeShort(this.var_3294);
      }
   }
}
