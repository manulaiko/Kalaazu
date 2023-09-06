package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_867 implements ICommand
   {
      
      public static const ID:int = 28800;
       
      
      public var var_158:class_647;
      
      public var var_3842:int = 0;
      
      public function class_867(param1:class_647 = null, param2:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_158 = new class_647();
         }
         else
         {
            this.var_158 = param1;
         }
         this.var_3842 = param2;
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
         this.var_158 = class_127.getInstance().createInstance(param1.readShort()) as class_647;
         this.var_158.read(param1);
         this.var_3842 = param1.readInt();
         this.var_3842 = Number(this.var_3842) >>> 6 | Number(this.var_3842) << 26;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.var_158.write(param1);
         param1.writeInt(Number(this.var_3842) << 6 | Number(this.var_3842) >>> 26);
      }
   }
}
