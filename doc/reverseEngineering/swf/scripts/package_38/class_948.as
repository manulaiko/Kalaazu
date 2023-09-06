package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_948 implements ICommand
   {
      
      public static const ROCKET:uint = 1;
      
      public static const LASER:uint = 0;
      
      public static const const_1466:uint = 2;
      
      public static const ID:int = 27151;
       
      
      public var var_986:Boolean = false;
      
      public var var_861:uint = 0;
      
      public function class_948(param1:uint = 0, param2:Boolean = false)
      {
         super();
         this.var_861 = param1;
         this.var_986 = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 1;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_986 = param1.readBoolean();
         this.var_861 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.var_986);
         param1.writeShort(this.var_861);
      }
   }
}
