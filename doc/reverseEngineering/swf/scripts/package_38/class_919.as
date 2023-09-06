package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_919 implements ICommand
   {
      
      public static const ID:int = 21586;
       
      
      public var isActive:Boolean = false;
      
      public function class_919(param1:Boolean = false)
      {
         super();
         this.isActive = param1;
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
         this.isActive = param1.readBoolean();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.isActive);
         param1.writeShort(-22190);
      }
   }
}
