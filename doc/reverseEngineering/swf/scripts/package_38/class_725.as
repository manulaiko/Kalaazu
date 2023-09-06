package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_725 implements ICommand
   {
      
      public static const ID:int = 8216;
       
      
      public var var_4868:Number = 0;
      
      public var var_4983:Number = 0;
      
      public function class_725(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.var_4983 = param1;
         this.var_4868 = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_4868 = param1.readDouble();
         param1.readShort();
         this.var_4983 = param1.readDouble();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeDouble(this.var_4868);
         param1.writeShort(-31735);
         param1.writeDouble(this.var_4983);
      }
   }
}
