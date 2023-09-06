package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_472 extends class_432 implements ICommand
   {
      
      public static const ID:int = 29238;
       
      
      public var var_4184:class_433;
      
      public var var_2749:class_508;
      
      public var name:String = "";
      
      public function class_472(param1:class_433 = null, param2:String = "", param3:class_508 = null)
      {
         super();
         if(param1 == null)
         {
            this.var_4184 = new class_433();
         }
         else
         {
            this.var_4184 = param1;
         }
         this.name = param2;
         if(param3 == null)
         {
            this.var_2749 = new class_508();
         }
         else
         {
            this.var_2749 = param3;
         }
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 2;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.var_4184 = class_127.getInstance().createInstance(param1.readShort()) as class_433;
         this.var_4184.read(param1);
         this.var_2749 = class_127.getInstance().createInstance(param1.readShort()) as class_508;
         this.var_2749.read(param1);
         this.name = param1.readUTF();
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         this.var_4184.write(param1);
         this.var_2749.write(param1);
         param1.writeUTF(this.name);
      }
   }
}
