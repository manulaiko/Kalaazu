package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_298 implements ICommand
   {
      
      public static const ID:int = 6532;
       
      
      public var var_3665:int = 0;
      
      public var var_2295:int = 0;
      
      public var var_701:int = 0;
      
      public var var_4787:int = 0;
      
      public var var_3865:String = "";
      
      public function class_298(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.var_3865 = param1;
         this.var_3665 = param2;
         this.var_701 = param3;
         this.var_4787 = param4;
         this.var_2295 = param5;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 18;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_3665 = param1.readInt();
         this.var_3665 = Number(this.var_3665) >>> 3 | Number(this.var_3665) << 29;
         this.var_2295 = param1.readInt();
         this.var_2295 = Number(this.var_2295) >>> 2 | Number(this.var_2295) << 30;
         this.var_701 = param1.readInt();
         this.var_701 = Number(this.var_701) << 14 | Number(this.var_701) >>> 18;
         this.var_4787 = param1.readInt();
         this.var_4787 = Number(this.var_4787) >>> 1 | Number(this.var_4787) << 31;
         this.var_3865 = param1.readUTF();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.var_3665) << 3 | Number(this.var_3665) >>> 29);
         param1.writeInt(Number(this.var_2295) << 2 | Number(this.var_2295) >>> 30);
         param1.writeInt(Number(this.var_701) >>> 14 | Number(this.var_701) << 18);
         param1.writeInt(Number(this.var_4787) << 1 | Number(this.var_4787) >>> 31);
         param1.writeUTF(this.var_3865);
      }
   }
}
