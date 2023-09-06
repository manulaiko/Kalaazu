package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_872 implements ICommand
   {
      
      public static const const_697:uint = 10;
      
      public static const SIMPLE:uint = 6;
      
      public static const const_2220:uint = 1;
      
      public static const NONE:uint = 0;
      
      public static const const_2268:uint = 5;
      
      public static const const_1009:uint = 2;
      
      public static const const_2094:uint = 4;
      
      public static const const_1991:uint = 9;
      
      public static const const_1417:uint = 8;
      
      public static const const_1616:uint = 3;
      
      public static const const_1593:uint = 7;
      
      public static const ID:int = 20767;
       
      
      public var var_2918:uint = 0;
      
      public function class_872(param1:uint = 0)
      {
         super();
         this.var_2918 = param1;
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
         this.var_2918 = param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-19291);
         param1.writeShort(this.var_2918);
         param1.writeShort(26576);
      }
   }
}
