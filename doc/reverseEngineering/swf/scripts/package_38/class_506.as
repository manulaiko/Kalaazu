package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_506 implements ICommand
   {
      
      public static const ID:int = 31903;
       
      
      public var name_84:Boolean = false;
      
      public var windowId:class_537;
      
      public function class_506(param1:class_537 = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            this.windowId = new class_537();
         }
         else
         {
            this.windowId = param1;
         }
         this.name_84 = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 1;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_84 = param1.readBoolean();
         this.windowId = class_127.getInstance().createInstance(param1.readShort()) as class_537;
         this.windowId.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.name_84);
         this.windowId.write(param1);
      }
   }
}
