package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_443 implements ICommand
   {
      
      public static const const_1991:uint = 14;
      
      public static const const_1417:uint = 13;
      
      public static const const_1995:uint = 6;
      
      public static const const_1632:uint = 9;
      
      public static const const_1334:uint = 5;
      
      public static const const_2340:uint = 4;
      
      public static const RADIATION:uint = 8;
      
      public static const const_1400:uint = 7;
      
      public static const const_1593:uint = 12;
      
      public static const DAMAGE:uint = 3;
      
      public static const const_697:uint = 15;
      
      public static const const_29:uint = 16;
      
      public static const const_621:uint = 11;
      
      public static const const_1923:uint = 1;
      
      public static const const_335:uint = 2;
      
      public static const const_2532:uint = 10;
      
      public static const const_1771:uint = 0;
      
      public static const ID:int = 29441;
       
      
      public var var_2008:uint = 0;
      
      public function class_443(param1:uint = 0)
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
         param1.writeShort(22758);
         param1.writeShort(2628);
         param1.writeShort(this.var_2008);
      }
   }
}
