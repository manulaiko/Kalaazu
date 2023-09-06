package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_815 implements ICommand
   {
      
      public static const ID:int = 13359;
       
      
      public var name:String = "";
      
      public function class_815(param1:String = "")
      {
         super();
         this.name = param1;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 2;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name = param1.readUTF();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name);
         param1.writeShort(9099);
      }
   }
}
