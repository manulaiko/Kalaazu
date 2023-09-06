package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_856 implements ICommand
   {
      
      public static const const_2603:uint = 1;
      
      public static const const_2280:uint = 2;
      
      public static const const_380:uint = 0;
      
      public static const ID:int = 8492;
       
      
      public var var_4471:class_546;
      
      public var var_95:uint = 0;
      
      public var var_3308:class_546;
      
      public function class_856(param1:uint = 0, param2:class_546 = null, param3:class_546 = null)
      {
         super();
         this.var_95 = param1;
         if(param2 == null)
         {
            this.var_4471 = new class_546();
         }
         else
         {
            this.var_4471 = param2;
         }
         if(param3 == null)
         {
            this.var_3308 = new class_546();
         }
         else
         {
            this.var_3308 = param3;
         }
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
         this.var_4471 = class_127.getInstance().createInstance(param1.readShort()) as class_546;
         this.var_4471.read(param1);
         this.var_95 = param1.readShort();
         param1.readShort();
         this.var_3308 = class_127.getInstance().createInstance(param1.readShort()) as class_546;
         this.var_3308.read(param1);
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.var_4471.write(param1);
         param1.writeShort(this.var_95);
         param1.writeShort(12382);
         this.var_3308.write(param1);
         param1.writeShort(18285);
      }
   }
}
