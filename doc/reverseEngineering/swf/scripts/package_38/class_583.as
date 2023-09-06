package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_583 implements ICommand
   {
      
      public static const ID:int = 13569;
       
      
      public var price:int = 0;
      
      public var var_4809:class_163;
      
      public function class_583(param1:class_163 = null, param2:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_4809 = new class_163();
         }
         else
         {
            this.var_4809 = param1;
         }
         this.price = param2;
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
         this.price = param1.readInt();
         this.price = Number(this.price) << 13 | Number(this.price) >>> 19;
         param1.readShort();
         this.var_4809 = class_127.getInstance().createInstance(param1.readShort()) as class_163;
         this.var_4809.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.price) >>> 13 | Number(this.price) << 19);
         param1.writeShort(-12903);
         this.var_4809.write(param1);
      }
   }
}
