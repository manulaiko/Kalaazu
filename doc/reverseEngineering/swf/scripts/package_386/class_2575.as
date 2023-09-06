package package_386
{
   import flash.display3D.Context3D;
   import flash.display3D.VertexBuffer3D;
   import package_198.class_1208;
   
   public class class_2575
   {
       
      
      protected var _vertexData:Vector.<Number>;
      
      protected var _vertexBuffer:Vector.<VertexBuffer3D>;
      
      protected var var_269:Vector.<Context3D>;
      
      protected var var_3127:Vector.<Boolean>;
      
      private var var_490:uint;
      
      private var var_547:uint;
      
      public var var_1472:int = 0;
      
      public var previousTime:Number = -Infinity;
      
      public var var_2059:Vector.<class_2576>;
      
      public function class_2575()
      {
         this._vertexBuffer = new Vector.<VertexBuffer3D>(8);
         this.var_269 = new Vector.<Context3D>(8);
         this.var_3127 = new Vector.<Boolean>(8);
         this.var_2059 = new Vector.<class_2576>();
         super();
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.var_3127[_loc1_] = true;
            _loc1_++;
         }
      }
      
      public function method_3092(param1:uint, param2:uint) : void
      {
         this.var_490 = param1;
         this.var_547 = param2;
         this._vertexData = new Vector.<Number>(param1 * param2,true);
      }
      
      public function method_748(param1:int, param2:int, param3:class_1208, param4:String) : void
      {
         var _loc5_:int = int(param3.method_1611);
         var _loc6_:Context3D = param3.context3D;
         var _loc7_:VertexBuffer3D;
         if(!(_loc7_ = this._vertexBuffer[_loc5_]) || this.var_269[_loc5_] != _loc6_)
         {
            _loc7_ = this._vertexBuffer[_loc5_] = _loc6_.createVertexBuffer(this.var_490,this.var_547);
            this.var_269[_loc5_] = _loc6_;
            this.var_3127[_loc5_] = true;
         }
         if(this.var_3127[_loc5_])
         {
            _loc7_.uploadFromVector(this._vertexData,0,this.var_490);
            this.var_3127[_loc5_] = false;
         }
         _loc6_.setVertexBufferAt(param1,_loc7_,param2,param4);
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         while(this._vertexBuffer.length)
         {
            _loc1_ = this._vertexBuffer.pop();
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
      }
      
      public function method_2736() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.var_3127[_loc1_] = true;
            _loc1_++;
         }
      }
      
      public function get name_104() : Vector.<Number>
      {
         return this._vertexData;
      }
      
      public function get numVertices() : uint
      {
         return this.var_490;
      }
      
      public function get method_93() : uint
      {
         return this.var_547;
      }
   }
}
