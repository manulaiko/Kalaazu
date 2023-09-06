package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_589 implements ICommand
   {
      
      public static const ID:int = 26745;
       
      
      public var definition:class_238;
      
      public var ratings:Vector.<class_798>;
      
      public var var_3390:class_798;
      
      public function class_589(param1:class_238 = null, param2:Vector.<class_798> = null, param3:class_798 = null)
      {
         super();
         if(param1 == null)
         {
            this.definition = new class_238();
         }
         else
         {
            this.definition = param1;
         }
         if(param2 == null)
         {
            this.ratings = new Vector.<class_798>();
         }
         else
         {
            this.ratings = param2;
         }
         if(param3 == null)
         {
            this.var_3390 = new class_798();
         }
         else
         {
            this.var_3390 = param3;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.definition = class_127.getInstance().createInstance(param1.readShort()) as class_238;
         this.definition.read(param1);
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.ratings.length > 0)
         {
            this.ratings.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_798).read(param1);
            this.ratings.push(_loc4_);
            _loc2_++;
         }
         param1.readShort();
         this.var_3390 = class_127.getInstance().createInstance(param1.readShort()) as class_798;
         this.var_3390.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         this.definition.write(param1);
         param1.writeInt(this.ratings.length);
         for each(_loc2_ in this.ratings)
         {
            _loc2_.write(param1);
         }
         param1.writeShort(32712);
         this.var_3390.write(param1);
      }
   }
}
