package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_301 implements ICommand
   {
      
      public static const ID:int = 24146;
       
      
      public var var_3865:String = "";
      
      public function class_301(param1:String = "")
      {
         super();
         this.var_3865 = param1;
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
         this.var_3865 = param1.readUTF();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.var_3865);
         param1.writeShort(25284);
      }
   }
}
