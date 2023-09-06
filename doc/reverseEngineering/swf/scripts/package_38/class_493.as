package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_493 extends class_432 implements ICommand
   {
      
      public static const ID:int = 32090;
       
      
      public var var_3867:int = 0;
      
      public var var_881:Boolean = false;
      
      public function class_493(param1:Boolean = false, param2:int = 0)
      {
         super();
         this.var_881 = param1;
         this.var_3867 = param2;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 5;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.var_3867 = param1.readInt();
         this.var_3867 = Number(this.var_3867) << 8 | Number(this.var_3867) >>> 24;
         this.var_881 = param1.readBoolean();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeInt(Number(this.var_3867) >>> 8 | Number(this.var_3867) << 24);
         param1.writeBoolean(this.var_881);
      }
   }
}
