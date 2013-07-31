package {
	
	import com.brightcove.api.APIModules;
	import com.brightcove.api.BrightcoveModuleWrapper;
	import com.brightcove.api.CustomModule;
	import com.brightcove.api.components.ChromelessVideoPlayer;
	import com.brightcove.api.components.LayoutBox;
	import com.brightcove.api.events.AdEvent;
	import com.brightcove.api.modules.AdvertisingModule;
	import com.brightcove.api.modules.ExperienceModule;
	
	public class ChromelessVideoPlayer_AdUxManager extends CustomModule {
		
		private var _player:BrightcoveModuleWrapper;
		private var _experienceModule:ExperienceModule;
		private var _advertisingModule:AdvertisingModule;
		private var _playerControls:Array = new Array();
		
		public function ChromelessVideoPlayer_AdUxManager()
		{
			trace("@project Chromeless Video Player - AdUxManager");
			trace("@author John Hogan");
			trace("@version 1.0.0");
		}
		
		override protected function initialize():void {
			_player = player;
			_experienceModule = player.getModule(APIModules.EXPERIENCE) as ExperienceModule;
			_advertisingModule = player.getModule(APIModules.ADVERTISING) as AdvertisingModule;
			
			getPlayerControls();
			
			setupEventListeners();
		}
		
		private function setupEventListeners():void {
			if(_advertisingModule) {
				// Attach to the different ad events
				_advertisingModule.addEventListener(AdEvent.AD_START, onAdEvent);
				_advertisingModule.addEventListener(AdEvent.AD_RESUME, onAdEvent);
				_advertisingModule.addEventListener(AdEvent.AD_PAUSE, onAdEvent);
				_advertisingModule.addEventListener(AdEvent.AD_COMPLETE, onAdEvent);
			}
		}
		
		/**
		 * Finds all player control objects and stores them in an array
		 */ 
		private function getPlayerControls():void {
			// Get a list of all players
			var chromelessVideoPlayerArray:Array = _experienceModule.getElementsByType("ChromelessVideoPlayer") as Array;
			debug("Chromeless Video Player(s) found: " + chromelessVideoPlayerArray.length);
			
			// For each player, get its controls
			for(var i:int = 0; i < chromelessVideoPlayerArray.length; i++) {
				var cvp:ChromelessVideoPlayer = chromelessVideoPlayerArray[i] as ChromelessVideoPlayer;
				_playerControls.push(cvp.getControls() as LayoutBox);
			}
		}
	
		/**
		 * Handles the different ad events
		 */ 
		private function onAdEvent(adEvent:AdEvent):void {			
			var adPlaying:Boolean = (adEvent.type === AdEvent.AD_START || adEvent.type === AdEvent.AD_RESUME);
			
			debug("Is an ad playing?: " + adPlaying);
			
			showControls(!adPlaying);
		}
		
		/**
		 * Loops through the player controls array and  
		 * hides/shows the controls
		 */ 
		private function showControls(controlsVisible:Boolean):void {
			for each(var controls:LayoutBox in _playerControls) {
				if(controls != null) {
					controls.setVisible(controlsVisible);
				}
			}
		}
		
		/**
		 * @private
		 */
		private function debug(message:String):void
		{
			_experienceModule.debug(message);
		}
	}
	
}