package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_686 implements ICommand
   {
      
      public static const ID:int = 28685;
       
      
      public var mode:class_719;
      
      public function class_686(param1:class_719 = null)
      {
         super();
         if(param1 == null)
         {
            this.mode = new class_719();
         }
         else
         {
            this.mode = param1;
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
         this.mode = class_127.getInstance().createInstance(param1.readShort()) as class_719;
         this.mode.read(param1);
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.mode.write(param1);
         param1.writeShort(-11482);
      }
   }
}
