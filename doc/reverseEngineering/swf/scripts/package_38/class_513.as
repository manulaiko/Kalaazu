package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_513 extends class_467 implements ICommand
   {
      
      public static const ID:int = 31080;
       
      
      public var var_3438:String = "";
      
      public function class_513(param1:String = "")
      {
         super();
         this.var_3438 = param1;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 2;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         param1.readShort();
         this.var_3438 = param1.readUTF();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeShort(23356);
         param1.writeUTF(this.var_3438);
      }
   }
}
