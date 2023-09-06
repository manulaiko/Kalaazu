package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_713 implements ICommand
   {
      
      public static const ID:int = 21825;
       
      
      public var var_221:class_930;
      
      public var var_1573:int = 0;
      
      public var var_4196:class_387;
      
      public var name_127:int = 0;
      
      public var var_1326:int = 0;
      
      public var var_4263:String = "";
      
      public var x:int = 0;
      
      public var var_1072:Boolean = false;
      
      public var var_4626:int = 0;
      
      public var y:int = 0;
      
      public var var_2245:int = 0;
      
      public var var_1461:int = 0;
      
      public var isVisible:Boolean = false;
      
      public var name_145:String = "";
      
      public var var_3452:int = 0;
      
      public var var_2752:int = 0;
      
      public function class_713(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:String = "", param6:int = 0, param7:int = 0, param8:int = 0, param9:String = "", param10:class_930 = null, param11:int = 0, param12:int = 0, param13:int = 0, param14:Boolean = false, param15:Boolean = false, param16:class_387 = null)
      {
         super();
         this.var_1461 = param1;
         this.var_2245 = param2;
         this.var_1573 = param3;
         this.name_127 = param4;
         this.var_4263 = param5;
         this.var_2752 = param6;
         this.var_4626 = param7;
         this.var_3452 = param8;
         this.name_145 = param9;
         if(param10 == null)
         {
            this.var_221 = new class_930();
         }
         else
         {
            this.var_221 = param10;
         }
         this.x = param11;
         this.y = param12;
         this.var_1326 = param13;
         this.var_1072 = param14;
         this.isVisible = param15;
         if(param16 == null)
         {
            this.var_4196 = new class_387();
         }
         else
         {
            this.var_4196 = param16;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 38;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_221 = class_127.getInstance().createInstance(param1.readShort()) as class_930;
         this.var_221.read(param1);
         this.var_1573 = param1.readShort();
         this.var_4196 = class_127.getInstance().createInstance(param1.readShort()) as class_387;
         this.var_4196.read(param1);
         this.name_127 = param1.readShort();
         this.var_1326 = param1.readInt();
         this.var_1326 = Number(this.var_1326) << 5 | Number(this.var_1326) >>> 27;
         this.var_4263 = param1.readUTF();
         this.x = param1.readInt();
         this.x = Number(this.x) >>> 5 | Number(this.x) << 27;
         this.var_1072 = param1.readBoolean();
         param1.readShort();
         this.var_4626 = param1.readInt();
         this.var_4626 = Number(this.var_4626) >>> 2 | Number(this.var_4626) << 30;
         this.y = param1.readInt();
         this.y = Number(this.y) << 15 | Number(this.y) >>> 17;
         this.var_2245 = param1.readInt();
         this.var_2245 = Number(this.var_2245) << 7 | Number(this.var_2245) >>> 25;
         this.var_1461 = param1.readInt();
         this.var_1461 = Number(this.var_1461) << 16 | Number(this.var_1461) >>> 16;
         this.isVisible = param1.readBoolean();
         this.name_145 = param1.readUTF();
         this.var_3452 = param1.readShort();
         this.var_2752 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         this.var_221.write(param1);
         param1.writeShort(this.var_1573);
         this.var_4196.write(param1);
         param1.writeShort(this.name_127);
         param1.writeInt(Number(this.var_1326) >>> 5 | Number(this.var_1326) << 27);
         param1.writeUTF(this.var_4263);
         param1.writeInt(Number(this.x) << 5 | Number(this.x) >>> 27);
         param1.writeBoolean(this.var_1072);
         param1.writeShort(-20860);
         param1.writeInt(Number(this.var_4626) << 2 | Number(this.var_4626) >>> 30);
         param1.writeInt(Number(this.y) >>> 15 | Number(this.y) << 17);
         param1.writeInt(Number(this.var_2245) >>> 7 | Number(this.var_2245) << 25);
         param1.writeInt(Number(this.var_1461) >>> 16 | Number(this.var_1461) << 16);
         param1.writeBoolean(this.isVisible);
         param1.writeUTF(this.name_145);
         param1.writeShort(this.var_3452);
         param1.writeShort(this.var_2752);
      }
   }
}
