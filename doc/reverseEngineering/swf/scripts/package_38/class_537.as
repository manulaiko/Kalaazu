package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_537 implements ICommand
   {
      
      public static const SETTINGS:uint = 5;
      
      public static const VIDEO_WINDOW:uint = 20;
      
      public static const CLI:uint = 15;
      
      public static const MINIMAP_WINDOW:uint = 22;
      
      public static const const_2526:uint = 2;
      
      public static const const_115:uint = 17;
      
      public static const const_1826:uint = 16;
      
      public static const const_938:uint = 12;
      
      public static const PET:uint = 19;
      
      public static const const_2231:uint = 8;
      
      public static const const_531:uint = 26;
      
      public static const const_2019:uint = 25;
      
      public static const const_2850:uint = 1;
      
      public static const const_2427:uint = 0;
      
      public static const const_3191:uint = 4;
      
      public static const LOG:uint = 3;
      
      public static const const_2490:uint = 7;
      
      public static const const_41:uint = 21;
      
      public static const ACHIEVEMENTS:uint = 18;
      
      public static const const_2792:uint = 9;
      
      public static const const_2857:uint = 14;
      
      public static const const_1790:uint = 10;
      
      public static const const_2221:uint = 24;
      
      public static const HELP:uint = 6;
      
      public static const const_1893:uint = 11;
      
      public static const const_1885:uint = 23;
      
      public static const TDM:uint = 13;
      
      public static const ID:int = 12479;
       
      
      public var var_3316:uint = 0;
      
      public function class_537(param1:uint = 0)
      {
         super();
         this.var_3316 = param1;
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
         this.var_3316 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_3316);
      }
   }
}
