package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_746 implements ICommand
   {
      
      public static const const_222:uint = 1;
      
      public static const const_447:uint = 0;
      
      public static const ID:int = 368;
       
      
      public var command:uint = 0;
      
      public function class_746(param1:uint = 0)
      {
         super();
         this.command = param1;
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
         param1.readShort();
         this.command = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(15583);
         param1.writeShort(-23411);
         param1.writeShort(this.command);
      }
   }
}
