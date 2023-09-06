package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_360 implements ICommand
   {
      
      public static const ID:int = 1059;
       
      
      public var replacement:String = "";
      
      public var var_2283:class_117;
      
      public var wildcard:String = "";
      
      public function class_360(param1:String = "", param2:String = "", param3:class_117 = null)
      {
         super();
         this.wildcard = param1;
         this.replacement = param2;
         if(param3 == null)
         {
            this.var_2283 = new class_117();
         }
         else
         {
            this.var_2283 = param3;
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
         this.replacement = param1.readUTF();
         this.var_2283 = class_127.getInstance().createInstance(param1.readShort()) as class_117;
         this.var_2283.read(param1);
         param1.readShort();
         this.wildcard = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.replacement);
         this.var_2283.write(param1);
         param1.writeShort(28496);
         param1.writeUTF(this.wildcard);
      }
   }
}
