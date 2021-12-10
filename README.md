# RestaurantsExplorer

Доброго времени суток! Задачу считаю выполненной, дальше следуют небольшие пояснения.

++++++++++++++++++++++++++++++++++++++++++++++++++

CASE: 
Restaurants Explorer
iOS client app
Use cases
- User can view the list of venues (each item should contain next info: name, location, category)
User can filter venues by category Endpoint: GET/venues/search
- User can select a restaurant for the list and view the detailed information about it Endpoint: GET /venues/VENUE_ID
Expected results:
Requirements
- iOS 15.0+
- Swift 5.5+
- iPhone only
- Portrait device orientation
- Storyboards & Autolayout | Swift UI
APIs
https://developer.foursquare.com
Expected results
- Repo on github with the codebase
App requirements:
1. Yourappshouldincludeallfeaturesdescribedinthetesttask
2. Appshouldbetestedon-deviceforbugsandstabilitybeforeyousubmitit(Appwith
crashes will be automatically rejected)
Code requirements:
- Code should implement one of the known architecture
- Code must support common code convention

++++++++++++++++++++++++++++++++++++++++++++++++++

В указанном API произошли изменения, версия Venues в таске уже устарела,сейчас используется API "Places" - оно полностью включает в себя предыдущий, поэтому использовал его.
Мне (к удивлению) хватило базового функционала, так что не устанавливал сторонние фреймворки. Использовал архитектуру MVVM, для запросов URLSession.

Lifecycle приложения:
- на главном экране по дефолту подгружается таблица ресторанов в городе Львов в кол-ве в 30 позиций.
- здесь есть 3 интеракции:

а) нажатие на любое заведение - открывается подробная информациия через NavigationController (NavButton для возращения на экран);

б) нажатия на любой фильтр в SegmentedControl сделает новый запрос с указанный фильтром и городом (дефолт - Львов) на 30 позиций;

в) ввод названия города на английском языке в TextField, по нажатию на SearchButton будет совершен поиск с указанным городом и фильтром.
