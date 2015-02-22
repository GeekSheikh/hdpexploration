azure vm shutdown cophdpnn01
azure vm shutdown cophdpnn02
azure vm shutdown cophdpe01
azure vm shutdown cophdpdn01
azure vm shutdown cophdpdn02
azure vm shutdown cophdpdn03
azure vm shutdown cophdpamb

azure storage blob copy start --source-container vhds --source-blob cophdp-cophdpnn01-2015-02-18.vhd --dest-container vhdsnapshots
azure storage blob copy start --source-container vhds --source-blob cophdp-cophdpnn02-2015-02-18.vhd --dest-container vhdsnapshots
azure storage blob copy start --source-container vhds --source-blob cophdp-cophdpe01-2015-02-18.vhd --dest-container vhdsnapshots
azure storage blob copy start --source-container vhds --source-blob cophdp-cophdpdn01-2015-02-18.vhd --dest-container vhdsnapshots
azure storage blob copy start --source-container vhds --source-blob cophdp-cophdpdn02-2015-02-18.vhd --dest-container vhdsnapshots
azure storage blob copy start --source-container vhds --source-blob cophdp-cophdpdn03-2015-02-18.vhd --dest-container vhdsnapshots
azure storage blob copy start --source-container vhds --source-blob cophdp-cophdpamb-2015-02-18.vhd --dest-container vhdsnapshots

azure vm start cophdpnn01
azure vm start cophdpnn02
azure vm start cophdpe01
azure vm start cophdpdn01
azure vm start cophdpdn02
azure vm start cophdpdn03
azure vm start cophdpamb
