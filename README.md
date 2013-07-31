<h1>About</h1>
This project forces the Chromeless Video Player Controls on the Brightcove player to hide during ad playback. When added to a player as a plugin, upon ad start the player controls are hidden and then made visible again once the ad has finished playing.
This plugin has been created to resolve issues seen when trying to run VPAID ads in the Brightcove chromeless player where the controls interfere with the interactivity of an ad.
<h1>Deployment</h1>
1. Download the latest ChromelessVideoPlayer_AdUxManager.swf
2. Upload the SWF file to a server and make a note of the URL e.g. http://example.com/swf/ChromelessVideoPlayer_AdUxManager.swf (make sure the swf is publicly accessible without any authentication or restriction)
3. Place a <a href="http://support.brightcove.com/en/docs/cross-domain-security-flash">crossdomain.xml file</a> on the server's web root directory where SWF file resides to allow the Brightcove player to communicate to the SWF.
4. Log in to your Brightcove account and navigate to the Publishing Module
5. Double-click on the player and go to "Plug-ins" tab and enter previously noted URL for ChromelessVideoPlayer_AdUxManager.swf.
6. Finally save changes

Alternatively the plugin can be added as <a href="http://support.brightcove.com/en/docs/adding-custom-component-player-template">a Module to the BEML template</a>.