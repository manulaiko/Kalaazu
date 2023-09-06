package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_569 implements ICommand
   {
      
      public static const const_345:uint = 11;
      
      public static const const_1089:uint = 9;
      
      public static const const_723:uint = 4;
      
      public static const EMP:uint = 2;
      
      public static const const_1859:uint = 7;
      
      public static const const_2371:uint = 12;
      
      public static const const_2959:uint = 0;
      
      public static const const_1367:uint = 10;
      
      public static const const_898:uint = 3;
      
      public static const const_1778:uint = 6;
      
      public static const const_1987:uint = 8;
      
      public static const const_371:uint = 1;
      
      public static const const_2060:uint = 5;
      
      public static const ID:int = 18352;
       
      
      public var var_5026:uint = 0;
      
      public function class_569(param1:uint = 0)
      {
         super();
         this.var_5026 = param1;
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
         this.var_5026 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_5026);
      }
   }
}
