package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_429 implements ICommand
   {
      
      public static const const_1020:uint = 7;
      
      public static const const_1982:uint = 8;
      
      public static const DAMAGE:uint = 2;
      
      public static const const_120:uint = 9;
      
      public static const const_541:uint = 5;
      
      public static const EP:uint = 0;
      
      public static const const_1018:uint = 10;
      
      public static const SHIELD:uint = 3;
      
      public static const HONOUR:uint = 1;
      
      public static const REPAIR:uint = 4;
      
      public static const const_73:uint = 6;
      
      public static const ID:int = 19265;
       
      
      public var var_2008:uint = 0;
      
      public function class_429(param1:uint = 0)
      {
         super();
         this.var_2008 = param1;
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
         this.var_2008 = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_2008);
         param1.writeShort(2096);
      }
   }
}
