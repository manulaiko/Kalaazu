package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_887 implements ICommand
   {
      
      public static const ID:int = 10951;
       
      
      public var active:Boolean = false;
      
      public var var_384:class_424;
      
      public function class_887(param1:class_424 = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            this.var_384 = new class_424();
         }
         else
         {
            this.var_384 = param1;
         }
         this.active = param2;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 1;
      }
      
      public function read(param1:IDataInput) : void
      {
         param1.readShort();
         this.active = param1.readBoolean();
         this.var_384 = class_127.getInstance().createInstance(param1.readShort()) as class_424;
         this.var_384.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-4568);
         param1.writeBoolean(this.active);
         this.var_384.write(param1);
      }
   }
}
