package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_767 extends class_432 implements ICommand
   {
      
      public static const ID:int = 30963;
       
      
      public var var_5046:Boolean = false;
      
      public function class_767(param1:Boolean = false)
      {
         super();
         this.var_5046 = param1;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 1;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.var_5046 = param1.readBoolean();
         param1.readShort();
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
         param1.writeBoolean(this.var_5046);
         param1.writeShort(-32473);
         param1.writeShort(-30202);
      }
   }
}
