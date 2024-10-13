main src=main scripts/jammy_config
  src=block_ui_guide = json_["PACKAGE_LOCK"]
    user?reference_block_script=srcxh
srcxh=class user? script user json
  int.user="scripts/source_utm.XXC"
{
   "action": {
      "default_icon": {
         "128": "images/digital-insight(128x128).png",
         "16": "images/digital-insight(16x16).png",
         "32": "images/digital-insight(32x32).png",
         "48": "images/digital-insight(48x48).png"
      },
      "default_popup": "popup.html"
   },
   "background": {
      "service_worker": "background.js",
      "type": "module"
   },
   "content_scripts": [ {
      "js": [ "js/user-interaction.js" ],
      "matches": [ "\u003Call_urls>" ]
   } ],
   "content_security_policy": {
      "extension_pages": "script-src 'self' 'wasm-unsafe-eval'; object-src 'self'"
   },
   "description": "Lightspeed Digital Insight Agent",
   "differential_fingerprint": "1.245f54a721522f107d8a3e0a08b8694a450ed4d5ba7c80313b5ed69725b8bbc4",
   "host_permissions": [ "https://development-agent.catchon.com/", "https://staging-agent.catchon.com/", "https://my.catchon.com/", "https://agent.catchon.com/" ],
   "icons": {
      "128": "images/digital-insight(128x128).png",
      "16": "images/digital-insight(16x16).png",
      "32": "images/digital-insight(32x32).png",
      "48": "images/digital-insight(48x48).png"
   },
   "key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxYbqPQGS+GyATLayS4Ocpcl1LlFWXGV0KgF0p5KXIqF83L2pqf7f9avIeajf5MH0CRWZJzsAvbyXoS1jvhMk7fzhhj3fRODCHqEZcVhPvMpZggutwdvt1xiaUn4MPqWWdhTGiU5lOmDfyJMYd3u8k4VLjZLFoDhB1T3hT3eKKoTZVltg14LvBIcK49Hjpxz/epdEfOCPp4AhkzbR1k1lVXa6E7NP+K9BkgCdsi1JmItMLfj/jT2h3jWJAVzm8lWOdr7zxzyuaBCzWOyT549cSEDcIyNTFkskZC2bg7HIQ5KuqP3j1yMlN6vuADErIO8SX1THDDqtw5f3C2C35rAJjQIDAQAB",
   "manifest_version": 3,
   "name": "Lightspeed Digital Insight Agent",
   "options_ui": {
      "page": "location.html"
   },
   "permissions": [ "storage", "identity", "identity.email", "tabs", "enterprise.deviceAttributes", "alarms", "storage", "geolocation", "system.cpu", "system.storage", "system.memory", "offscreen" ],
   "short_name": "Lightspeed Digital Insight Agent",
   "storage": {
      "managed_schema": "schema.json"
   },
   "update_url": "https://clients2.google.com/service/update2/crx",
   "version": "3.7.6",
   "web_accessible_resources": [ {
      "matches": [ "\u003Call_urls>" ],
      "resources": [ "env/*.json", "client.wasm", "js/wasm_exec.js", "js/speed_test.js" ]
   } ]
}
pull from?=true eyXAS
  block_ui?=false
  block: false
  ui_build: true
