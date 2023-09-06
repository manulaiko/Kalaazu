package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_390 implements ICommand
   {
      
      public static const const_1478:uint = 0;
      
      public static const const_3221:uint = 2;
      
      public static const const_3208:uint = 1;
      
      public static const const_385:uint = 3;
      
      public static const ID:int = 21185;
       
      
      public var var_4259:uint = 0;
      
      public function class_390(param1:uint = 0)
      {
         super();
         this.var_4259 = param1;
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
         this.var_4259 = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_4259);
         param1.writeShort(31649);
      }
   }
}
