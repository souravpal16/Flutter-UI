class Device {
  final String title;
  final bool on;
  final String icon;

  Device({
    required this.title,
    required this.icon,
    required this.on,
  });
}

final List<Device> devices = [
  Device(
    title: 'Router',
    icon: 'assets/icons/wifi.svg',
    on: false,
  ),
  Device(
    title: 'Light',
    icon: 'assets/icons/light2.svg',
    on: true,
  ),
  Device(
    title: 'Air con',
    icon: 'assets/icons/air_con3.svg',
    on: false,
  ),
  Device(
    title: 'Music',
    icon: 'assets/icons/music.svg',
    on: false,
  ),
];
