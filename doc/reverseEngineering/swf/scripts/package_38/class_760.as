package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_760 extends class_434 implements ICommand
   {
      
      public static const ID:int = 7717;
       
      
      public var timer:int = 0;
      
      public var var_2481:class_892;
      
      public function class_760(param1:int = 0, param2:class_892 = null)
      {
         super();
         this.timer = param1;
         if(param2 == null)
         {
            this.var_2481 = new class_892();
         }
         else
         {
            this.var_2481 = param2;
         }
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 4;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.timer = param1.readInt();
         this.timer = Number(this.timer) >>> 10 | Number(this.timer) << 22;
         param1.readShort();
         this.var_2481 = class_127.getInstance().createInstance(param1.readShort()) as class_892;
         this.var_2481.read(param1);
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeInt(Number(this.timer) << 10 | Number(this.timer) >>> 22);
         param1.writeShort(-29785);
         this.var_2481.write(param1);
      }
   }
}
