package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_587 implements ICommand
   {
      
      public static const ID:int = 1992;
       
      
      public var name_150:int = 0;
      
      public var var_957:int = 0;
      
      public var name_106:class_427;
      
      public var name_133:int = 0;
      
      public var name_56:Boolean = false;
      
      public function class_587(param1:int = 0, param2:int = 0, param3:Boolean = false, param4:int = 0, param5:class_427 = null)
      {
         super();
         this.name_133 = param1;
         this.name_150 = param2;
         this.name_56 = param3;
         this.var_957 = param4;
         if(param5 == null)
         {
            this.name_106 = new class_427();
         }
         else
         {
            this.name_106 = param5;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 13;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_150 = param1.readInt();
         this.name_150 = Number(this.name_150) >>> 10 | Number(this.name_150) << 22;
         this.var_957 = param1.readInt();
         this.var_957 = Number(this.var_957) << 4 | Number(this.var_957) >>> 28;
         this.name_106 = class_127.getInstance().createInstance(param1.readShort()) as class_427;
         this.name_106.read(param1);
         this.name_133 = param1.readInt();
         this.name_133 = Number(this.name_133) << 14 | Number(this.name_133) >>> 18;
         this.name_56 = param1.readBoolean();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_150) << 10 | Number(this.name_150) >>> 22);
         param1.writeInt(Number(this.var_957) >>> 4 | Number(this.var_957) << 28);
         this.name_106.write(param1);
         param1.writeInt(Number(this.name_133) >>> 14 | Number(this.name_133) << 18);
         param1.writeBoolean(this.name_56);
      }
   }
}
