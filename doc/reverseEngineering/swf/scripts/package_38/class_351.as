package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_351 implements ICommand
   {
      
      public static const const_1757:uint = 5;
      
      public static const const_640:uint = 7;
      
      public static const const_2577:uint = 6;
      
      public static const const_1130:uint = 0;
      
      public static const const_655:uint = 3;
      
      public static const const_238:uint = 4;
      
      public static const const_1285:uint = 2;
      
      public static const const_418:uint = 1;
      
      public static const ID:int = 15545;
       
      
      public var var_2171:uint = 0;
      
      public function class_351(param1:uint = 0)
      {
         super();
         this.var_2171 = param1;
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
         this.var_2171 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_2171);
      }
   }
}
