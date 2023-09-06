package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_442 implements ICommand
   {
      
      public static const const_597:uint = 1;
      
      public static const CIRCLE:uint = 0;
      
      public static const const_173:uint = 2;
      
      public static const ID:int = 7240;
       
      
      public var shape:uint = 0;
      
      public var var_1818:String = "";
      
      public var var_1651:String = "";
      
      public var var_3481:class_443;
      
      public var active:Boolean = false;
      
      public var name_149:Boolean = false;
      
      public var var_4763:Vector.<int>;
      
      public var design:class_872;
      
      public function class_442(param1:String = "", param2:class_443 = null, param3:String = "", param4:class_872 = null, param5:uint = 0, param6:Vector.<int> = null, param7:Boolean = false, param8:Boolean = false)
      {
         super();
         this.var_1818 = param1;
         if(param2 == null)
         {
            this.var_3481 = new class_443();
         }
         else
         {
            this.var_3481 = param2;
         }
         this.var_1651 = param3;
         if(param4 == null)
         {
            this.design = new class_872();
         }
         else
         {
            this.design = param4;
         }
         this.shape = param5;
         if(param6 == null)
         {
            this.var_4763 = new Vector.<int>();
         }
         else
         {
            this.var_4763 = param6;
         }
         this.name_149 = param7;
         this.active = param8;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 10;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = 0;
         this.shape = param1.readShort();
         this.var_1818 = param1.readUTF();
         this.var_1651 = param1.readUTF();
         this.var_3481 = class_127.getInstance().createInstance(param1.readShort()) as class_443;
         this.var_3481.read(param1);
         this.active = param1.readBoolean();
         param1.readShort();
         this.name_149 = param1.readBoolean();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_4763.length > 0)
         {
            this.var_4763.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc4_ = int(param1.readInt())) << 7 | _loc4_ >>> 25;
            this.var_4763.push(_loc4_);
            _loc2_++;
         }
         this.design = class_127.getInstance().createInstance(param1.readShort()) as class_872;
         this.design.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeShort(this.shape);
         param1.writeUTF(this.var_1818);
         param1.writeUTF(this.var_1651);
         this.var_3481.write(param1);
         param1.writeBoolean(this.active);
         param1.writeShort(10959);
         param1.writeBoolean(this.name_149);
         param1.writeInt(this.var_4763.length);
         for each(_loc2_ in this.var_4763)
         {
            param1.writeInt(_loc2_ >>> 7 | _loc2_ << 25);
         }
         this.design.write(param1);
      }
   }
}
