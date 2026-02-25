powershell -Command "Compress-Archive -Force -LiteralPath yokai-parade-web/ -DestinationPath yokai-parade-web/yokai-parade.zip"

butler push ./yokai-parade-web/yokai-parade.zip s4g/yokai-parade:html
