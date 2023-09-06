package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_770 implements ICommand
   {
      
      public static const ID:int = 19121;
       
      
      public var var_1775:int = 0;
      
      public var state:class_871;
      
      public function class_770(param1:int = 0, param2:class_871 = null)
      {
         super();
         this.var_1775 = param1;
         if(param2 == null)
         {
            this.state = new class_871();
         }
         else
         {
            this.state = param2;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_1775 = param1.readInt();
         this.var_1775 = Number(this.var_1775) >>> 12 | Number(this.var_1775) << 20;
         param1.readShort();
         this.state = class_127.getInstance().createInstance(param1.readShort()) as class_871;
         this.state.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_1775) << 12 | Number(this.var_1775) >>> 20);
         param1.writeShort(12751);
         this.state.write(param1);
      }
   }
}
