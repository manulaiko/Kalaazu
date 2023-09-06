package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_571 implements ICommand
   {
      
      public static const ID:int = 29105;
       
      
      public var var_5046:Boolean = false;
      
      public var var_2971:class_433;
      
      public var faction:class_439;
      
      public var name:String = "";
      
      public var var_2749:class_508;
      
      public var target:class_472;
      
      public var active:Boolean = false;
      
      public var location:class_568;
      
      public var name_162:Boolean = false;
      
      public var level:int = 0;
      
      public var var_2506:Boolean = false;
      
      public var cloaked:Boolean = false;
      
      public var var_3695:class_493;
      
      public var id:int = 0;
      
      public var name_123:class_791;
      
      public function class_571(param1:String = "", param2:int = 0, param3:class_508 = null, param4:class_568 = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:class_791 = null, param12:class_439 = null, param13:class_472 = null, param14:class_433 = null, param15:class_493 = null)
      {
         super();
         this.name = param1;
         this.id = param2;
         if(param3 == null)
         {
            this.var_2749 = new class_508();
         }
         else
         {
            this.var_2749 = param3;
         }
         if(param4 == null)
         {
            this.location = new class_568();
         }
         else
         {
            this.location = param4;
         }
         this.level = param5;
         this.active = param6;
         this.cloaked = param7;
         this.name_162 = param8;
         this.var_5046 = param9;
         this.var_2506 = param10;
         if(param11 == null)
         {
            this.name_123 = new class_791();
         }
         else
         {
            this.name_123 = param11;
         }
         if(param12 == null)
         {
            this.faction = new class_439();
         }
         else
         {
            this.faction = param12;
         }
         if(param13 == null)
         {
            this.target = new class_472();
         }
         else
         {
            this.target = param13;
         }
         if(param14 == null)
         {
            this.var_2971 = new class_433();
         }
         else
         {
            this.var_2971 = param14;
         }
         if(param15 == null)
         {
            this.var_3695 = new class_493();
         }
         else
         {
            this.var_3695 = param15;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 15;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.var_5046 = param1.readBoolean();
         this.var_2971 = class_127.getInstance().createInstance(param1.readShort()) as class_433;
         this.var_2971.read(param1);
         param1.readShort();
         this.faction = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.faction.read(param1);
         this.name = param1.readUTF();
         this.var_2749 = class_127.getInstance().createInstance(param1.readShort()) as class_508;
         this.var_2749.read(param1);
         this.target = class_127.getInstance().createInstance(param1.readShort()) as class_472;
         this.target.read(param1);
         this.active = param1.readBoolean();
         this.location = class_127.getInstance().createInstance(param1.readShort()) as class_568;
         this.location.read(param1);
         this.name_162 = param1.readBoolean();
         this.level = param1.readInt();
         this.level = Number(this.level) << 3 | Number(this.level) >>> 29;
         this.var_2506 = param1.readBoolean();
         this.cloaked = param1.readBoolean();
         this.var_3695 = class_127.getInstance().createInstance(param1.readShort()) as class_493;
         this.var_3695.read(param1);
         this.id = param1.readInt();
         this.id = Number(this.id) << 16 | Number(this.id) >>> 16;
         this.name_123 = class_127.getInstance().createInstance(param1.readShort()) as class_791;
         this.name_123.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.var_5046);
         this.var_2971.write(param1);
         param1.writeShort(19162);
         this.faction.write(param1);
         param1.writeUTF(this.name);
         this.var_2749.write(param1);
         this.target.write(param1);
         param1.writeBoolean(this.active);
         this.location.write(param1);
         param1.writeBoolean(this.name_162);
         param1.writeInt(Number(this.level) >>> 3 | Number(this.level) << 29);
         param1.writeBoolean(this.var_2506);
         param1.writeBoolean(this.cloaked);
         this.var_3695.write(param1);
         param1.writeInt(Number(this.id) >>> 16 | Number(this.id) << 16);
         this.name_123.write(param1);
      }
   }
}
