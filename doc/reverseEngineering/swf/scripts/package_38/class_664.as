package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_664 extends class_650 implements ICommand
   {
      
      public static const ID:int = 18425;
       
      
      public var var_4271:String = "";
      
      public function class_664(param1:String = "", param2:String = "", param3:int = 0, param4:int = 0)
      {
         super(param2,param4,param3);
         this.var_4271 = param1;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 22;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.var_4271 = param1.readUTF();
         param1.readShort();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeUTF(this.var_4271);
         param1.writeShort(21295);
      }
   }
}
