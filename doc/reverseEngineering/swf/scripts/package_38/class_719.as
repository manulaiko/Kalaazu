package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_719 implements ICommand
   {
      
      public static const const_1141:uint = 1;
      
      public static const const_145:uint = 0;
      
      public static const ID:int = 19280;
       
      
      public var mode:uint = 0;
      
      public function class_719(param1:uint = 0)
      {
         super();
         this.mode = param1;
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
         this.mode = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(22289);
         param1.writeShort(this.mode);
      }
   }
}
