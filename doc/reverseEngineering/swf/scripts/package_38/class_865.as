package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_865 extends class_864 implements ICommand
   {
      
      public static const ID:int = 14317;
       
      
      public var height:int = 0;
      
      public var maximized:Boolean = false;
      
      public var width:int = 0;
      
      public var var_1711:String = "";
      
      public var var_2295:int = 0;
      
      public var helpText:class_358;
      
      public var var_4787:int = 0;
      
      public function class_865(param1:Boolean = false, param2:int = 0, param3:Boolean = false, param4:int = 0, param5:int = 0, param6:class_358 = null, param7:String = "", param8:int = 0, param9:class_358 = null, param10:String = "")
      {
         super(param10,param3,param6);
         this.var_1711 = param7;
         this.var_4787 = param5;
         this.var_2295 = param4;
         this.width = param8;
         this.height = param2;
         this.maximized = param1;
         if(param9 == null)
         {
            this.helpText = new class_358();
         }
         else
         {
            this.helpText = param9;
         }
      }
      
      override public function method_1330() : int
      {
         return ID;
      }
      
      override public function method_1260() : int
      {
         return 25;
      }
      
      override public function read(param1:IDataInput) : void
      {
         super.read(param1);
         this.height = param1.readInt();
         this.height = Number(this.height) << 14 | Number(this.height) >>> 18;
         this.maximized = param1.readBoolean();
         this.width = param1.readInt();
         this.width = Number(this.width) << 2 | Number(this.width) >>> 30;
         this.var_1711 = param1.readUTF();
         param1.readShort();
         this.var_2295 = param1.readInt();
         this.var_2295 = Number(this.var_2295) >>> 14 | Number(this.var_2295) << 18;
         this.helpText = class_127.getInstance().createInstance(param1.readShort()) as class_358;
         this.helpText.read(param1);
         this.var_4787 = param1.readInt();
         this.var_4787 = Number(this.var_4787) << 12 | Number(this.var_4787) >>> 20;
      }
      
      override public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      override protected function method_3(param1:IDataOutput) : void
      {
         super.method_3(param1);
         param1.writeInt(Number(this.height) >>> 14 | Number(this.height) << 18);
         param1.writeBoolean(this.maximized);
         param1.writeInt(Number(this.width) >>> 2 | Number(this.width) << 30);
         param1.writeUTF(this.var_1711);
         param1.writeShort(3358);
         param1.writeInt(Number(this.var_2295) << 14 | Number(this.var_2295) >>> 18);
         this.helpText.write(param1);
         param1.writeInt(Number(this.var_4787) >>> 12 | Number(this.var_4787) << 20);
      }
   }
}
