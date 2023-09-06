package mx.core
{
   import flash.geom.Rectangle;
   
   public interface ISWFLoader extends ISWFBridgeProvider
   {
       
      
      function get loadForCompatibility() : Boolean;
      
      function set loadForCompatibility(param1:Boolean) : void;
      
      function getVisibleApplicationRect(param1:Boolean = false) : Rectangle;
   }
}
