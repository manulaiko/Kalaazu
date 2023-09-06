package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_906 implements ICommand
   {
      
      public static const ID:int = 14534;
       
      
      public var var_428:class_353;
      
      public var var_200:class_879;
      
      public function class_906(param1:class_879 = null, param2:class_353 = null)
      {
         super();
         if(param1 == null)
         {
            this.var_200 = new class_879();
         }
         else
         {
            this.var_200 = param1;
         }
         if(param2 == null)
         {
            this.var_428 = new class_353();
         }
         else
         {
            this.var_428 = param2;
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
         this.var_428 = class_127.getInstance().createInstance(param1.readShort()) as class_353;
         this.var_428.read(param1);
         this.var_200 = class_127.getInstance().createInstance(param1.readShort()) as class_879;
         this.var_200.read(param1);
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(29324);
         this.var_428.write(param1);
         this.var_200.write(param1);
         param1.writeShort(-1628);
      }
   }
}
