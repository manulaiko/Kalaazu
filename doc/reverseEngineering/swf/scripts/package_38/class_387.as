package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_387 implements ICommand
   {
      
      public static const const_2007:uint = 2;
      
      public static const DEFAULT:uint = 0;
      
      public static const const_2756:uint = 1;
      
      public static const ID:int = 14030;
       
      
      public var var_4820:uint = 0;
      
      public function class_387(param1:uint = 0)
      {
         super();
         this.var_4820 = param1;
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
         this.var_4820 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-21374);
         param1.writeShort(this.var_4820);
      }
   }
}
