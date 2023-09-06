package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_875 implements ICommand
   {
      
      public static const ID:int = 22742;
       
      
      public var visible:Boolean = false;
      
      public var var_2618:int = 0;
      
      public function class_875(param1:int = 0, param2:Boolean = false)
      {
         super();
         this.var_2618 = param1;
         this.visible = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 5;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.visible = param1.readBoolean();
         this.var_2618 = param1.readInt();
         this.var_2618 = Number(this.var_2618) >>> 4 | Number(this.var_2618) << 28;
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.visible);
         param1.writeInt(Number(this.var_2618) << 4 | Number(this.var_2618) >>> 28);
         param1.writeShort(-22025);
      }
   }
}
