package mx.filters
{
   public class BaseDimensionFilter extends BaseFilter
   {
       
      
      private var _blurX:Number = 4;
      
      private var _blurY:Number = 4;
      
      private var _knockout:Boolean = false;
      
      private var _quality:int = 1;
      
      private var _strength:Number = 1;
      
      public function BaseDimensionFilter()
      {
         super();
      }
      
      public function get blurX() : Number
      {
         return this._blurX;
      }
      
      public function set blurX(param1:Number) : void
      {
         if(param1 != this._blurX)
         {
            this._blurX = param1;
            notifyFilterChanged();
         }
      }
      
      public function get blurY() : Number
      {
         return this._blurY;
      }
      
      public function set blurY(param1:Number) : void
      {
         if(param1 != this._blurY)
         {
            this._blurY = param1;
            notifyFilterChanged();
         }
      }
      
      public function get knockout() : Boolean
      {
         return this._knockout;
      }
      
      public function set knockout(param1:Boolean) : void
      {
         if(param1 != this._knockout)
         {
            this._knockout = param1;
            notifyFilterChanged();
         }
      }
      
      public function get quality() : int
      {
         return this._quality;
      }
      
      public function set quality(param1:int) : void
      {
         if(param1 != this._quality)
         {
            this._quality = param1;
            notifyFilterChanged();
         }
      }
      
      public function get strength() : Number
      {
         return this._strength;
      }
      
      public function set strength(param1:Number) : void
      {
         if(param1 != this._strength)
         {
            this._strength = param1;
            notifyFilterChanged();
         }
      }
   }
}
