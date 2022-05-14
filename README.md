KOReader without framework support for Amazon Kindle
====================================================

This module mocks KAF interface to enable power button handling.

Install
-------

Remvoe if condition in [extensions/koreader/menu.json](https://github.com/koreader/koreader/blob/v2022.03.1/platform/kindle/extensions/koreader/menu.json#L28)

Upload directory ``kindle_no_framework_helper.koplugin`` to
``koreader/plugins`` and restart KOReader.

Start KOReader without framework
