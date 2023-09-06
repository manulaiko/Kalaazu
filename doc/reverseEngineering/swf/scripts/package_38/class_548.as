package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_548 implements ICommand
   {
      
      public static const ID:int = 32409;
       
      
      public var x:int = 0;
      
      public var factionId:int = 0;
      
      public var var_3452:int = 0;
      
      public var var_4196:class_387;
      
      public var y:int = 0;
      
      public var var_2245:int = 0;
      
      public var var_1461:int = 0;
      
      public var var_4263:String = "";
      
      public var name_145:String = "";
      
      public var name_127:int = 0;
      
      public var var_4184:int = 0;
      
      public var name_45:int = 0;
      
      public var var_1326:int = 0;
      
      public function class_548(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:String = "", param6:int = 0, param7:int = 0, param8:int = 0, param9:String = "", param10:int = 0, param11:int = 0, param12:int = 0, param13:class_387 = null)
      {
         super();
         this.var_1461 = param1;
         this.var_2245 = param2;
         this.var_4184 = param3;
         this.name_127 = param4;
         this.var_4263 = param5;
         this.factionId = param6;
         this.name_45 = param7;
         this.var_3452 = param8;
         this.name_145 = param9;
         this.x = param10;
         this.y = param11;
         this.var_1326 = param12;
         if(param13 == null)
         {
            this.var_4196 = new class_387();
         }
         else
         {
            this.var_4196 = param13;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 36;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.x = param1.readInt();
         this.x = Number(this.x) << 4 | Number(this.x) >>> 28;
         this.factionId = param1.readShort();
         this.var_3452 = param1.readShort();
         this.var_4196 = class_127.getInstance().createInstance(param1.readShort()) as class_387;
         this.var_4196.read(param1);
         this.y = param1.readInt();
         this.y = Number(this.y) << 6 | Number(this.y) >>> 26;
         param1.readShort();
         this.var_2245 = param1.readInt();
         this.var_2245 = Number(this.var_2245) >>> 13 | Number(this.var_2245) << 19;
         this.var_1461 = param1.readInt();
         this.var_1461 = Number(this.var_1461) >>> 2 | Number(this.var_1461) << 30;
         this.var_4263 = param1.readUTF();
         this.name_145 = param1.readUTF();
         this.name_127 = param1.readShort();
         this.var_4184 = param1.readShort();
         this.name_45 = param1.readInt();
         this.name_45 = Number(this.name_45) << 12 | Number(this.name_45) >>> 20;
         this.var_1326 = param1.readInt();
         this.var_1326 = Number(this.var_1326) << 1 | Number(this.var_1326) >>> 31;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.x) >>> 4 | Number(this.x) << 28);
         param1.writeShort(this.factionId);
         param1.writeShort(this.var_3452);
         this.var_4196.write(param1);
         param1.writeInt(Number(this.y) >>> 6 | Number(this.y) << 26);
         param1.writeShort(-19144);
         param1.writeInt(Number(this.var_2245) << 13 | Number(this.var_2245) >>> 19);
         param1.writeInt(Number(this.var_1461) << 2 | Number(this.var_1461) >>> 30);
         param1.writeUTF(this.var_4263);
         param1.writeUTF(this.name_145);
         param1.writeShort(this.name_127);
         param1.writeShort(this.var_4184);
         param1.writeInt(Number(this.name_45) >>> 12 | Number(this.name_45) << 20);
         param1.writeInt(Number(this.var_1326) >>> 1 | Number(this.var_1326) << 31);
      }
   }
}
