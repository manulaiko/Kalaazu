package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_657 implements ICommand
   {
      
      public static const ID:int = 2157;
       
      
      public var var_4348:Boolean = false;
      
      public var name_73:Number = 0;
      
      public function class_657(param1:Number = 0, param2:Boolean = false)
      {
         super();
         this.name_73 = param1;
         this.var_4348 = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 9;
      }
      
      public function read(param1:IDataInput) : void
      {
         param1.readShort();
         this.var_4348 = param1.readBoolean();
         this.name_73 = param1.readDouble();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-25874);
         param1.writeBoolean(this.var_4348);
         param1.writeDouble(this.name_73);
         param1.writeShort(-14139);
      }
   }
}
