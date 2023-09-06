package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_441 implements ICommand
   {
      
      public static const const_1837:uint = 8;
      
      public static const const_1584:uint = 26;
      
      public static const const_2912:uint = 13;
      
      public static const const_1106:uint = 11;
      
      public static const const_2712:uint = 24;
      
      public static const const_1618:uint = 23;
      
      public static const const_1046:uint = 0;
      
      public static const const_2565:uint = 15;
      
      public static const const_2763:uint = 19;
      
      public static const const_2922:uint = 25;
      
      public static const const_1688:uint = 22;
      
      public static const const_2963:uint = 21;
      
      public static const const_2612:uint = 1;
      
      public static const const_240:uint = 20;
      
      public static const const_2988:uint = 3;
      
      public static const const_3133:uint = 6;
      
      public static const const_2348:uint = 5;
      
      public static const const_1143:uint = 14;
      
      public static const const_864:uint = 18;
      
      public static const const_799:uint = 9;
      
      public static const const_2626:uint = 12;
      
      public static const const_1761:uint = 2;
      
      public static const const_1298:uint = 7;
      
      public static const const_476:uint = 16;
      
      public static const const_2395:uint = 17;
      
      public static const const_2082:uint = 4;
      
      public static const const_2617:uint = 10;
      
      public static const ID:int = 26950;
       
      
      public var var_2008:uint = 0;
      
      public function class_441(param1:uint = 0)
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
         param1.readShort();
         param1.readShort();
         this.var_2008 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(16615);
         param1.writeShort(4539);
         param1.writeShort(this.var_2008);
      }
   }
}
