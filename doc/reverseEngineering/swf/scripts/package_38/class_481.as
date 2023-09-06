package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_481 implements ICommand
   {
      
      public static const const_1213:uint = 3;
      
      public static const const_1602:uint = 4;
      
      public static const const_3053:uint = 23;
      
      public static const LOGOUT:uint = 31;
      
      public static const const_2555:uint = 33;
      
      public static const const_2647:uint = 5;
      
      public static const const_453:uint = 21;
      
      public static const const_695:uint = 8;
      
      public static const const_1978:uint = 22;
      
      public static const const_2812:uint = 2;
      
      public static const const_1060:uint = 19;
      
      public static const const_1447:uint = 35;
      
      public static const const_220:uint = 14;
      
      public static const const_2353:uint = 1;
      
      public static const const_2127:uint = 28;
      
      public static const const_351:uint = 15;
      
      public static const const_1279:uint = 13;
      
      public static const const_899:uint = 7;
      
      public static const const_2200:uint = 38;
      
      public static const const_2874:uint = 0;
      
      public static const const_725:uint = 36;
      
      public static const const_153:uint = 27;
      
      public static const const_1089:uint = 25;
      
      public static const const_2060:uint = 24;
      
      public static const ROCKET_LAUNCHER:uint = 17;
      
      public static const const_2006:uint = 26;
      
      public static const const_2244:uint = 30;
      
      public static const const_404:uint = 37;
      
      public static const PLASMA:uint = 10;
      
      public static const const_1327:uint = 16;
      
      public static const const_1728:uint = 20;
      
      public static const const_1859:uint = 9;
      
      public static const const_1070:uint = 11;
      
      public static const const_2095:uint = 32;
      
      public static const EMP:uint = 12;
      
      public static const const_2388:uint = 6;
      
      public static const JUMP:uint = 29;
      
      public static const const_406:uint = 34;
      
      public static const const_3165:uint = 18;
      
      public static const ID:int = 9286;
       
      
      public var var_3316:uint = 0;
      
      public function class_481(param1:uint = 0)
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
