package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_937 implements ICommand
   {
      
      public static const const_3262:uint = 0;
      
      public static const ID:int = 2958;
       
      
      public var inverse:Boolean = false;
      
      public var uid:String = "";
      
      public var var_3280:int = 0;
      
      public var count:int = 0;
      
      public var interval:Number = 0;
      
      public var var_3770:class_834;
      
      public var scale:Number = 0;
      
      public var type:uint = 0;
      
      public var var_15:int = 0;
      
      public function class_937(param1:String = "", param2:int = 0, param3:int = 0, param4:uint = 0, param5:int = 0, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:class_834 = null)
      {
         super();
         this.uid = param1;
         this.var_3280 = param2;
         this.var_15 = param3;
         this.type = param4;
         this.count = param5;
         this.interval = param6;
         this.scale = param7;
         this.inverse = param8;
         if(param9 == null)
         {
            this.var_3770 = new class_834();
         }
         else
         {
            this.var_3770 = param9;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 23;
      }
      
      public function read(param1:IDataInput) : void
      {
         param1.readShort();
         this.inverse = param1.readBoolean();
         this.uid = param1.readUTF();
         this.var_3280 = param1.readInt();
         this.var_3280 = Number(this.var_3280) << 2 | Number(this.var_3280) >>> 30;
         this.count = param1.readInt();
         this.count = Number(this.count) << 5 | Number(this.count) >>> 27;
         this.interval = param1.readFloat();
         this.var_3770 = class_127.getInstance().createInstance(param1.readShort()) as class_834;
         this.var_3770.read(param1);
         this.scale = param1.readFloat();
         this.type = param1.readShort();
         this.var_15 = param1.readInt();
         this.var_15 = Number(this.var_15) >>> 16 | Number(this.var_15) << 16;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(14054);
         param1.writeBoolean(this.inverse);
         param1.writeUTF(this.uid);
         param1.writeInt(Number(this.var_3280) >>> 2 | Number(this.var_3280) << 30);
         param1.writeInt(Number(this.count) >>> 5 | Number(this.count) << 27);
         param1.writeFloat(this.interval);
         this.var_3770.write(param1);
         param1.writeFloat(this.scale);
         param1.writeShort(this.type);
         param1.writeInt(Number(this.var_15) << 16 | Number(this.var_15) >>> 16);
      }
   }
}
