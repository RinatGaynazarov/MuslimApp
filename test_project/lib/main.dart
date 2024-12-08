import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'features/wid.dart';

void main() {
  runApp(const MuslimApp());
}

class MuslimApp extends StatelessWidget {
  const MuslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MuslimApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyMedium: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
            labelSmall: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            )),
      ),
      routes: {
        '/Home': (context) => MyHomePage(title: 'Главная страница'),
        '/setting': (context) => Options(),
        '/notifications': (context) => Notifications(),
        '/issue': (context) => issue(),
      },
      initialRoute: '/Home',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final formattedDate =
        DateFormat('EEEE, \n d MMMM, yyyy', 'en_US').format(now);
    final formattedTime = DateFormat('h:mm a').format(now);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mekka_1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 17.0, color: Colors.white),
                    ),
                    Text(
                      formattedTime,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 230,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPrayerTime('Фаджр', '5:44 am', theme),
                  _buildPrayerTime('Восход', '7:15 am', theme),
                  _buildPrayerTime(
                    'Зухр',
                    '12:56 pm',
                    theme,
                  ),
                  _buildPrayerTime('Аср', '4:56 pm', theme, highlight: true),
                  _buildPrayerTime('Магриб', '6:41 pm', theme),
                  _buildPrayerTime('Иша', '8:08 pm', theme),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.asset('assets/png/Icon.png'),
                    iconSize: 10.0,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('assets/png/Group.png'),
                    iconSize: 10.0,
                    onPressed: () {
                      Navigator.pushNamed(context, '/setting');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/png/Book.png'),
                    iconSize: 10.0,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTime(String name, String time, ThemeData theme,
      {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Container(
        child: ListTile(
          title: Text(
            name,
            style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                color: highlight ? Colors.green : Colors.white),
          ),
          trailing: Text(
            time,
            style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 14.0, color: highlight ? Colors.green : Colors.white),
          ),
        ),
      ),
    );
  }
}

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/setting.fon.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Местоположение',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Wid.buildOptionButton(
                    Image.asset('assets/images/location_on.png'),
                    'Ошская Область',
                    null,
                    'Ош'),
                const SizedBox(height: 20),
                const Text(
                  'Настройки',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Wid.buildOptionButton(Image.asset('assets/images/NutIcon.png'),
                    'Уведомление и звуки', () {
                  Navigator.pushNamed(context, '/notifications');
                }),
                Wid.buildOptionButton(
                    Image.asset('assets/images/Nuticon2.png'), 'Оформление',
                    () {
                  Navigator.pushNamed(context, '/issue');
                }),
                Wid.buildOptionButton(
                    Image.asset('assets/images/Globe.png'), 'Язык'),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Назад',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  const Notifications({super.key});
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool _isAzanEnabled = false;
  bool _isRakatEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/setting.fon.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Уведомления',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(11.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Уведомления включены',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              )),
                          SizedBox(height: 5),
                          Text(
                            //  _isAzanEnabled
                            //     ? 'Уведомление азана включены'
                            //     : 'Уведомление азана выключены',
                            'уведомления включены',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Switch(
                        value: _isAzanEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            _isAzanEnabled = value;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 15, 15, 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'АЗАН',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wid.buildOptionButton(
                    Image.asset('assets/images/NutIcon.png'), 'Азан', () {}),
                Wid.buildOptionButton(
                  Image.asset('assets/images/Nuticon2.png'),
                  'Регулировка времени',
                  () {},
                ),
                const SizedBox(height: 20),
                const Text(
                  'Другие настройки',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Количество ракатов',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 17),
                      ),
                      Switch(
                        value: _isRakatEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            _isRakatEnabled = value;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 15, 15, 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Назад',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class issue extends StatefulWidget {
  const issue({super.key});

  @override
  State<issue> createState() => _issueState();
}

class _issueState extends State<issue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/setting.fon.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Иконки',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
