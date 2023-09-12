package flashx.textLayout.factory {

import flashx.textLayout.compose.SimpleCompose;
import flashx.textLayout.compose.StandardFlowComposer;
import flashx.textLayout.container.ContainerController;
import flashx.textLayout.elements.BackgroundManager;
import flashx.textLayout.tlf_internal;

public class FactoryDisplayComposer extends StandardFlowComposer {


    public function FactoryDisplayComposer() {
        super();
    }

    override tlf_internal function callTheComposer(param1: int, param2: int): ContainerController {
        tlf_internal::clearCompositionResults();
        var _loc3_: SimpleCompose = TextLineFactoryBase.tlf_internal::_factoryComposer;
        _loc3_.composeTextFlow(textFlow, -1, -1);
        _loc3_.tlf_internal::releaseAnyReferences();
        return getControllerAt(0);
    }

    override protected function preCompose(): Boolean {
        return true;
    }

    override tlf_internal function createBackgroundManager(): BackgroundManager {
        return new FactoryBackgroundManager();
    }
}
}

import flash.text.engine.TextLine;

import flashx.textLayout.compose.TextFlowLine;
import flashx.textLayout.elements.BackgroundManager;

class FactoryBackgroundManager extends BackgroundManager {


    function FactoryBackgroundManager() {
        super();
    }

    override public function finalizeLine(param1: TextFlowLine): void {
        var _loc4_: * = null;
        var _loc2_: TextLine = param1.getTextLine();
        var _loc3_: Array = _lineDict[_loc2_];
        if (_loc3_) {
            if (_loc4_ = _loc3_[0]) {
                _loc4_.columnRect = param1.controller.columnState.getColumnAt(param1.columnIndex);
            }
        }
    }
}
