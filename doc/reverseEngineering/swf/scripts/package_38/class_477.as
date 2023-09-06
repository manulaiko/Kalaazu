package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_477 extends class_467 implements ICommand
   {
      
      public static const ID:int = 11604;
       
      
      public var var_4654:int = 0;
      
      public function class_477(param1:int = 0)
      {
         super();
         this.var_4654 = param1;
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 4;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         param1.readShort();
         this.var_4654 = param1.readInt();
         this.var_4654 = Number(this.var_4654) << 15 | Number(this.var_4654) >>> 17;
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeShort(-23122);
         param1.writeInt(Number(this.var_4654) >>> 15 | Number(this.var_4654) << 17);
      }
   }
}
