package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_886 implements ICommand
   {
      
      public static const ID:int = 26002;
       
      
      public var var_3184:int = 0;
      
      public var var_3770:class_834;
      
      public function class_886(param1:int = 0, param2:class_834 = null)
      {
         super();
         this.var_3184 = param1;
         if(param2 == null)
         {
            this.var_3770 = new class_834();
         }
         else
         {
            this.var_3770 = param2;
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
         param1.readShort();
         this.var_3184 = param1.readInt();
         this.var_3184 = Number(this.var_3184) << 16 | Number(this.var_3184) >>> 16;
         this.var_3770 = class_127.getInstance().createInstance(param1.readShort()) as class_834;
         this.var_3770.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(-27300);
         param1.writeInt(Number(this.var_3184) >>> 16 | Number(this.var_3184) << 16);
         this.var_3770.write(param1);
      }
   }
}
