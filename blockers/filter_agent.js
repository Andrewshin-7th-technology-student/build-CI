main src=main scripts/jammy_config
  src=block_ui_guide = json_["PACKAGE_LOCK"]
    user?reference_block_script=srcxh
srcxh=class user? script user json
  {
  "background": {
    "scripts": [
      "main.js"
    ]
  },
  "content_scripts": [
    {
      "all_frames": true,
      "js": [
        "in_page.js"
      ],
      "matches": [
        "\u003Call_urls\u003E"
      ]
    }
  ],
  "description": "Lightspeed Filter Agent for Chrome",
  "icons": {
    "128": "icon-128.png",
    "16": "icon-16.png"
  },
  "incognito": "spanning",
  "key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0TSbKFrknvfAAQToJadwSjzyXA2i51/PONO7gkOJMkJG17Jjgt+0/v94/w5Z1kbkO8ugov9+KtB7hbZxcHvWyCpa9hjKqXeMUGzPFcgp6ZPQKkvRl3aoedef1hlrKykkSx0pvlH0aPrp+KGc/pKcYga4E2M81tIg8JhHT/hUpS+NVU4ceA9Ky2RfjZpuvKAgI1duSxDYt+VdcRvwPJ8CocGYFAmbrd7u5ViwtyRD99tpCTp0wvz0TE4dfnCds5+qJT7zpx7Bp/uUk88JdJmDcWUcmpTNAoARh0Fl5XbYNHpQBzdk08m1fhXqQGBg45Qj+9ALRjdv2cUYO9UPeFCHDwIDAQAB",
  "manifest_version": 2,
  "name": "Lightspeed Filter Agent",
  "options_page": "options.html",
  "permissions": [
    "webRequest",
    "\u003Call_urls\u003E",
    "http://*/*",
    "idle",
    "background",
    "https://*/*",
    "tabs",
    "storage",
    "history",
    "webRequestBlocking",
    "identity",
    "identity.email",
    "management",
    "enterprise.deviceAttributes",
    "proxy"
  ],
  "update_url": "https://lsrelay-extensions-production.s3.amazonaws.com/chrome-filter/f8db5b5547d93ef167b094ef5c73485f56e752bb4971141abb5cda8ffb88c8ee/ChromeFilter.xml",
  "version": "3.7.3.1728466347",
  "web_accessible_resources": [
    "*.png"
  ]
}
pull from?=true eyXAS
  block_ui?=false
  block: false
  ui_build: true
