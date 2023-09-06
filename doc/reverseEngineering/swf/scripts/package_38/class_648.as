package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_648 implements ICommand
   {
      
      public static const ID:int = 31344;
       
      
      public var var_4733:class_841;
      
      public var var_257:class_447;
      
      public var itemId:String = "";
      
      public function class_648(param1:class_841 = null, param2:String = "", param3:class_447 = null)
      {
         super();
         if(param1 == null)
         {
            this.var_4733 = new class_841();
         }
         else
         {
            this.var_4733 = param1;
         }
         this.itemId = param2;
         if(param3 == null)
         {
            this.var_257 = new class_447();
         }
         else
         {
            this.var_257 = param3;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 2;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_4733 = class_127.getInstance().createInstance(param1.readShort()) as class_841;
         this.var_4733.read(param1);
         param1.readShort();
         this.var_257 = class_127.getInstance().createInstance(param1.readShort()) as class_447;
         this.var_257.read(param1);
         this.itemId = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.var_4733.write(param1);
         param1.writeShort(-10359);
         this.var_257.write(param1);
         param1.writeUTF(this.itemId);
      }
   }
}
