package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_609 implements ICommand
   {
      
      public static const const_1086:uint = 6;
      
      public static const const_789:uint = 3;
      
      public static const const_550:uint = 4;
      
      public static const const_3184:uint = 2;
      
      public static const const_1511:uint = 1;
      
      public static const const_1387:uint = 5;
      
      public static const const_1109:uint = 0;
      
      public static const ID:int = 21125;
       
      
      public var var_2454:uint = 0;
      
      public var var_1324:class_434;
      
      public function class_609(param1:class_434 = null, param2:uint = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_1324 = new class_434();
         }
         else
         {
            this.var_1324 = param1;
         }
         this.var_2454 = param2;
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
         this.var_2454 = param1.readShort();
         this.var_1324 = class_127.getInstance().createInstance(param1.readShort()) as class_434;
         this.var_1324.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-11683);
         param1.writeShort(this.var_2454);
         this.var_1324.write(param1);
      }
   }
}
