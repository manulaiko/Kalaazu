package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_514 implements ICommand
   {
      
      public static const const_1245:uint = 1;
      
      public static const const_1229:uint = 2;
      
      public static const const_57:uint = 4;
      
      public static const const_942:uint = 5;
      
      public static const MINE:uint = 3;
      
      public static const const_682:uint = 0;
      
      public static const ID:int = 19134;
       
      
      public var var_2490:uint = 0;
      
      public function class_514(param1:uint = 0)
      {
         super();
         this.var_2490 = param1;
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
         this.var_2490 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(26620);
         param1.writeShort(this.var_2490);
      }
   }
}
