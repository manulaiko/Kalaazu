package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_577 implements ICommand
   {
      
      public static const const_2838:uint = 0;
      
      public static const const_210:uint = 2;
      
      public static const const_2944:uint = 3;
      
      public static const const_2637:uint = 1;
      
      public static const ID:int = 26764;
       
      
      public var name_102:int = 0;
      
      public var name_8:String = "";
      
      public var clanName:String = "";
      
      public var name_146:int = 0;
      
      public var status:uint = 0;
      
      public var mapId:int = 0;
      
      public var name_135:Number = 0;
      
      public var var_2646:class_439;
      
      public function class_577(param1:int = 0, param2:int = 0, param3:int = 0, param4:uint = 0, param5:Number = 0, param6:String = "", param7:String = "", param8:class_439 = null)
      {
         super();
         this.mapId = param1;
         this.name_146 = param2;
         this.name_102 = param3;
         this.status = param4;
         this.name_135 = param5;
         this.clanName = param6;
         this.name_8 = param7;
         if(param8 == null)
         {
            this.var_2646 = new class_439();
         }
         else
         {
            this.var_2646 = param8;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 24;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.name_102 = param1.readInt();
         this.name_102 = Number(this.name_102) >>> 9 | Number(this.name_102) << 23;
         this.name_8 = param1.readUTF();
         param1.readShort();
         this.clanName = param1.readUTF();
         this.name_146 = param1.readInt();
         this.name_146 = Number(this.name_146) << 12 | Number(this.name_146) >>> 20;
         this.status = param1.readShort();
         this.mapId = param1.readInt();
         this.mapId = Number(this.mapId) << 13 | Number(this.mapId) >>> 19;
         this.name_135 = param1.readDouble();
         param1.readShort();
         this.var_2646 = class_127.getInstance().createInstance(param1.readShort()) as class_439;
         this.var_2646.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeInt(Number(this.name_102) << 9 | Number(this.name_102) >>> 23);
         param1.writeUTF(this.name_8);
         param1.writeShort(14337);
         param1.writeUTF(this.clanName);
         param1.writeInt(Number(this.name_146) >>> 12 | Number(this.name_146) << 20);
         param1.writeShort(this.status);
         param1.writeInt(Number(this.mapId) >>> 13 | Number(this.mapId) << 19);
         param1.writeDouble(this.name_135);
         param1.writeShort(-4199);
         this.var_2646.write(param1);
      }
   }
}
