package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_827 implements ICommand
   {
      
      public static const ID:int = 31291;
       
      
      public var icon:class_780;
      
      public var name_19:String = "";
      
      public var var_3107:String = "";
      
      public var name_160:Vector.<class_861>;
      
      public var var_1508:int = 0;
      
      public var priority:int = 0;
      
      public var var_1537:int = 0;
      
      public var var_2716:Vector.<class_869>;
      
      public var var_3894:class_850;
      
      public var minLevel:int = 0;
      
      public function class_827(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:Vector.<class_861> = null, param6:class_780 = null, param7:class_850 = null, param8:Vector.<class_869> = null, param9:String = "", param10:String = "")
      {
         super();
         this.var_1537 = param1;
         this.var_1508 = param2;
         this.minLevel = param3;
         this.priority = param4;
         if(param5 == null)
         {
            this.name_160 = new Vector.<class_861>();
         }
         else
         {
            this.name_160 = param5;
         }
         if(param6 == null)
         {
            this.icon = new class_780();
         }
         else
         {
            this.icon = param6;
         }
         if(param7 == null)
         {
            this.var_3894 = new class_850();
         }
         else
         {
            this.var_3894 = param7;
         }
         if(param8 == null)
         {
            this.var_2716 = new Vector.<class_869>();
         }
         else
         {
            this.var_2716 = param8;
         }
         this.var_3107 = param9;
         this.name_19 = param10;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 28;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.icon = class_127.getInstance().createInstance(param1.readShort()) as class_780;
         this.icon.read(param1);
         this.name_19 = param1.readUTF();
         this.var_3107 = param1.readUTF();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.name_160.length > 0)
         {
            this.name_160.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_861).read(param1);
            this.name_160.push(_loc4_);
            _loc2_++;
         }
         this.var_1508 = param1.readInt();
         this.var_1508 = Number(this.var_1508) << 13 | Number(this.var_1508) >>> 19;
         this.priority = param1.readInt();
         this.priority = Number(this.priority) >>> 16 | Number(this.priority) << 16;
         param1.readShort();
         this.var_1537 = param1.readInt();
         this.var_1537 = Number(this.var_1537) << 10 | Number(this.var_1537) >>> 22;
         while(this.var_2716.length > 0)
         {
            this.var_2716.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_869).read(param1);
            this.var_2716.push(_loc5_);
            _loc2_++;
         }
         this.var_3894 = class_127.getInstance().createInstance(param1.readShort()) as class_850;
         this.var_3894.read(param1);
         this.minLevel = param1.readInt();
         this.minLevel = Number(this.minLevel) << 7 | Number(this.minLevel) >>> 25;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.icon.write(param1);
         param1.writeUTF(this.name_19);
         param1.writeUTF(this.var_3107);
         param1.writeInt(this.name_160.length);
         for each(_loc2_ in this.name_160)
         {
            _loc2_.write(param1);
         }
         param1.writeInt(Number(this.var_1508) >>> 13 | Number(this.var_1508) << 19);
         param1.writeInt(Number(this.priority) << 16 | Number(this.priority) >>> 16);
         param1.writeShort(5563);
         param1.writeInt(Number(this.var_1537) >>> 10 | Number(this.var_1537) << 22);
         param1.writeInt(this.var_2716.length);
         for each(_loc3_ in this.var_2716)
         {
            _loc3_.write(param1);
         }
         this.var_3894.write(param1);
         param1.writeInt(Number(this.minLevel) >>> 7 | Number(this.minLevel) << 25);
      }
   }
}
