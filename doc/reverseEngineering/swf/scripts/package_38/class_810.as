package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_810 implements ICommand
   {
      
      public static const ID:int = 26150;
       
      
      public var name_128:int = 0;
      
      public var name_45:int = 0;
      
      public var var_704:class_930;
      
      public function class_810(param1:class_930 = null, param2:int = 0, param3:int = 0)
      {
         super();
         if(param1 == null)
         {
            this.var_704 = new class_930();
         }
         else
         {
            this.var_704 = param1;
         }
         this.name_128 = param2;
         this.name_45 = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_128 = param1.readInt();
         this.name_128 = Number(this.name_128) << 14 | Number(this.name_128) >>> 18;
         this.name_45 = param1.readInt();
         this.name_45 = Number(this.name_45) << 8 | Number(this.name_45) >>> 24;
         this.var_704 = class_127.getInstance().createInstance(param1.readShort()) as class_930;
         this.var_704.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_128) >>> 14 | Number(this.name_128) << 18);
         param1.writeInt(Number(this.name_45) >>> 8 | Number(this.name_45) << 24);
         this.var_704.write(param1);
      }
   }
}
