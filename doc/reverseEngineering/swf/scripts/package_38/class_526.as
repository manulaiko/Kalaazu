package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_526 implements ICommand
   {
      
      public static const const_810:uint = 12;
      
      public static const const_2989:uint = 13;
      
      public static const const_1606:uint = 6;
      
      public static const const_2624:uint = 4;
      
      public static const const_2256:uint = 5;
      
      public static const const_2760:uint = 7;
      
      public static const const_2164:uint = 19;
      
      public static const const_313:uint = 9;
      
      public static const const_2378:uint = 14;
      
      public static const const_1876:uint = 1;
      
      public static const const_2651:uint = 17;
      
      public static const const_2298:uint = 11;
      
      public static const const_3071:uint = 2;
      
      public static const const_2273:uint = 16;
      
      public static const const_2350:uint = 21;
      
      public static const const_362:uint = 15;
      
      public static const const_2939:uint = 10;
      
      public static const INVISIBLE:uint = 18;
      
      public static const NORMAL:uint = 0;
      
      public static const const_2673:uint = 20;
      
      public static const GALAXY_GATE:uint = 3;
      
      public static const const_1155:uint = 22;
      
      public static const const_2171:uint = 8;
      
      public static const ID:int = 18193;
       
      
      public var var_2008:uint = 0;
      
      public function class_526(param1:uint = 0)
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
         param1.writeShort(-16380);
      }
   }
}
