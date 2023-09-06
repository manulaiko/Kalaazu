package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_899 implements ICommand
   {
      
      public static const ID:int = 23311;
       
      
      public var type:class_523;
      
      public function class_899(param1:class_523 = null)
      {
         super();
         if(param1 == null)
         {
            this.type = new class_523();
         }
         else
         {
            this.type = param1;
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
         this.type = class_127.getInstance().createInstance(param1.readShort()) as class_523;
         this.type.read(param1);
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.type.write(param1);
         param1.writeShort(-15693);
      }
   }
}
