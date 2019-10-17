# TestWeather

При первом запуске приложения показываются Tutorial Screen 1 и 2.
На Tutorial Screen 1 у пользователя запрашивается доступ к геолокации, после разрешения активируется кнопка перехода на Tutorial Screen 2.
Tutorial Screen 1 и 2 реализовать на Pages или CollectionView.
В фоне нужно, используя координаты gps и геокодер (любой, на усмотрение), узнать город, в котором находится пользователь.
Также, узнать погоду для данных координат (использовать любое API).
Пользователь в любой момент завершает Tutorial Screen 2 и, если все данные загрузились, попадает на Weather Screen, если нет - на Loading Screen, откуда после завершения загрузки автоматически попадает на Weather Screen.
При втором и последующих запусках приложения, показываем сразу Loading Screen, а после загрузки данных - Weather Screen.
Необходимо также подключить метрики на кнопки, чтобы трекалось каждое нажатие, на выбор любую из аналитики (yandex metrica,  FB analytics, firebase)
Каким способом показывать экраны и их UI остается на усмотрение разработчика.
Задание должно быть сделано на обычном  Swift 5+, залито в публичный github репозиторий. При реализации запросов использовать Alamofire, по возможности и Moya.  Реализовать на архитектуре MVVM или MVC.
