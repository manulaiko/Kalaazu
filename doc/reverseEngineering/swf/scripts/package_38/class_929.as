package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_929 implements ICommand
   {
      
      public static const ID:int = 11298;
       
      
      public var var_1274:class_499;
      
      public var var_4897:class_485;
      
      public function class_929(param1:class_499 = null, param2:class_485 = null)
      {
         super();
         if(param1 == null)
         {
            this.var_1274 = new class_499();
         }
         else
         {
            this.var_1274 = param1;
         }
         if(param2 == null)
         {
            this.var_4897 = new class_485();
         }
         else
         {
            this.var_4897 = param2;
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
         param1.readShort();
         this.var_1274 = class_127.getInstance().createInstance(param1.readShort()) as class_499;
         this.var_1274.read(param1);
         this.var_4897 = class_127.getInstance().createInstance(param1.readShort()) as class_485;
         this.var_4897.read(param1);
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-20219);
         this.var_1274.write(param1);
         this.var_4897.write(param1);
         param1.writeShort(28155);
      }
   }
}
