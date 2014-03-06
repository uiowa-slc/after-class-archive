<?
class ExcludeOldChildren extends Hierarchy{

	protected $hiddenChildren = array();


	public function stageChildren($showAll = false) {
		$staged = $this->owner->AllEventsWithoutDuplicates();
		return $staged;
	}

	public function liveChildren($showAll = false, $onlyDeletedFromStage = false) {
		$staged = $this->owner->AllEventsWithoutDuplicates();
		return $staged;
	}

}

?>