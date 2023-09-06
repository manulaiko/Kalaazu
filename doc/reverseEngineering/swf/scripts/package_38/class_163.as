package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_163 implements ICommand
   {
      
      public static const const_1025:uint = 3;
      
      public static const PROMERIUM:uint = 6;
      
      public static const const_98:uint = 0;
      
      public static const const_225:uint = 1;
      
      public static const SEPROM:uint = 7;
      
      public static const const_2322:uint = 5;
      
      public static const const_763:uint = 4;
      
      public static const PALLADIUM:uint = 8;
      
      public static const const_2375:uint = 2;
      
      public static const ID:int = 5452;
       
      
      public var var_2008:uint = 0;
      
      public function class_163(param1:uint = 0)
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
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.var_2008);
      }
   }
}
