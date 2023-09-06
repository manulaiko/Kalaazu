package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_907 implements ICommand
   {
      
      public static const ID:int = 11917;
       
      
      public var var_1702:String = "";
      
      public var var_2951:int = 0;
      
      public var name_163:int = 0;
      
      public var name_126:int = 0;
      
      public var var_3257:int = 0;
      
      public var var_2464:int = 0;
      
      public var endian:String = "";
      
      public var quality:int = 0;
      
      public var length:int = 0;
      
      public function class_907(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:String = "", param7:int = 0, param8:String = "", param9:int = 0)
      {
         super();
         this.name_163 = param1;
         this.name_126 = param2;
         this.var_2951 = param3;
         this.var_3257 = param4;
         this.var_2464 = param5;
         this.var_1702 = param6;
         this.quality = param7;
         this.endian = param8;
         this.length = param9;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 32;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_1702 = param1.readUTF();
         this.var_2951 = param1.readInt();
         this.var_2951 = Number(this.var_2951) << 2 | Number(this.var_2951) >>> 30;
         this.name_163 = param1.readInt();
         this.name_163 = Number(this.name_163) << 1 | Number(this.name_163) >>> 31;
         param1.readShort();
         this.name_126 = param1.readInt();
         this.name_126 = Number(this.name_126) << 13 | Number(this.name_126) >>> 19;
         this.var_3257 = param1.readInt();
         this.var_3257 = Number(this.var_3257) << 11 | Number(this.var_3257) >>> 21;
         this.var_2464 = param1.readInt();
         this.var_2464 = Number(this.var_2464) >>> 2 | Number(this.var_2464) << 30;
         this.endian = param1.readUTF();
         this.quality = param1.readInt();
         this.quality = Number(this.quality) >>> 7 | Number(this.quality) << 25;
         this.length = param1.readInt();
         this.length = Number(this.length) << 7 | Number(this.length) >>> 25;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeUTF(this.var_1702);
         param1.writeInt(Number(this.var_2951) >>> 2 | Number(this.var_2951) << 30);
         param1.writeInt(Number(this.name_163) >>> 1 | Number(this.name_163) << 31);
         param1.writeShort(-6818);
         param1.writeInt(Number(this.name_126) >>> 13 | Number(this.name_126) << 19);
         param1.writeInt(Number(this.var_3257) >>> 11 | Number(this.var_3257) << 21);
         param1.writeInt(Number(this.var_2464) << 2 | Number(this.var_2464) >>> 30);
         param1.writeUTF(this.endian);
         param1.writeInt(Number(this.quality) << 7 | Number(this.quality) >>> 25);
         param1.writeInt(Number(this.length) >>> 7 | Number(this.length) << 25);
      }
   }
}
