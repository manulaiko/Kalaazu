package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_525 implements ICommand
   {
      
      public static const ID:int = 15997;
       
      
      public var name_90:int = 0;
      
      public var name_37:int = 0;
      
      public var var_2217:int = 0;
      
      public var var_3738:int = 0;
      
      public function class_525(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.name_90 = param1;
         this.name_37 = param2;
         this.var_2217 = param3;
         this.var_3738 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 16;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_90 = param1.readInt();
         this.name_90 = Number(this.name_90) << 3 | Number(this.name_90) >>> 29;
         this.name_37 = param1.readInt();
         this.name_37 = Number(this.name_37) >>> 6 | Number(this.name_37) << 26;
         this.var_2217 = param1.readInt();
         this.var_2217 = Number(this.var_2217) << 8 | Number(this.var_2217) >>> 24;
         this.var_3738 = param1.readInt();
         this.var_3738 = Number(this.var_3738) >>> 6 | Number(this.var_3738) << 26;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_90) >>> 3 | Number(this.name_90) << 29);
         param1.writeInt(Number(this.name_37) << 6 | Number(this.name_37) >>> 26);
         param1.writeInt(Number(this.var_2217) >>> 8 | Number(this.var_2217) << 24);
         param1.writeInt(Number(this.var_3738) << 6 | Number(this.var_3738) >>> 26);
      }
   }
}
