package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_684 implements ICommand
   {
      
      public static const ID:int = 25477;
       
      
      public var hash:String = "";
      
      public var name_43:Boolean = false;
      
      public function class_684(param1:String = "", param2:Boolean = false)
      {
         super();
         this.hash = param1;
         this.name_43 = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 3;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.hash = param1.readUTF();
         this.name_43 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.hash);
         param1.writeBoolean(this.name_43);
      }
   }
}
