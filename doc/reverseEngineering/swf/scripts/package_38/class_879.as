package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_879 implements ICommand
   {
      
      public static const DRIVING:uint = 2;
      
      public static const LASER:uint = 0;
      
      public static const SHIELD:uint = 3;
      
      public static const const_170:uint = 1;
      
      public static const ID:int = 30075;
       
      
      public var var_3265:uint = 0;
      
      public function class_879(param1:uint = 0)
      {
         super();
         this.var_3265 = param1;
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
         this.var_3265 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_3265);
      }
   }
}
