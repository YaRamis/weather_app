part of '../app.dart';

/*
Виджет экрана установки города.

Widget of set city screen.
 */
class SetCityScreen extends StatelessWidget {
  const SetCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.teal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 120),
                Text(
                  'YaRamis',
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Weather App',
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                const _SetCityIcon(),
                const SizedBox(height: 20),
                const _SetCityTextField(),
                const SizedBox(height: 20),
                const _SetCityElevatedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SetCityElevatedButton extends StatefulWidget {
  const _SetCityElevatedButton();

  @override
  State<_SetCityElevatedButton> createState() => _SetCityElevatedButtonState();
}

class _SetCityElevatedButtonState extends State<_SetCityElevatedButton> {
  ValueNotifier<WeatherState> localState = ValueNotifier(WeatherInitial());

  @override
  void initState() {
    localState.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (localState.value is WeatherLoadedState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.of(context)
              .pushReplacementNamed(AppRoutes.weatherDetailedInfoScreen);
        } else if (localState.value is WeatherErrorState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
              alignment: Alignment.center,
              child: const Text(
                'Data request error',
                style: TextStyle(fontSize: 25),
              ),
            ),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 300, left: 40, right: 40),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.hardEdge,
          ));
          // weatherBloc.emit(WeatherInitial());
        } else if (localState.value is WeatherLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
              alignment: Alignment.center,
              child: const Text(
                'Please wait',
                style: TextStyle(fontSize: 25),
              ),
            ),
            duration: const Duration(days: 1),
            backgroundColor: Colors.teal.shade800,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 300, left: 40, right: 40),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.hardEdge,
          ));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (context, state) {
        localState.value = state;
        return ElevatedButton(
          style: AppButtonStyles.setCityButtonStyle,
          onPressed: () {
            if (_cityName != '') {
              weatherBloc.add(GetWeatherEvent(cityName: _cityName));
            }
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 25),
            ),
          ),
        );
      },
    );
  }
}

class _SetCityIcon extends StatelessWidget {
  const _SetCityIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_city_rounded,
      color: Colors.teal.shade800,
      size: 150,
    );
  }
}

class _SetCityTextField extends StatelessWidget {
  const _SetCityTextField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        onChanged: (string) async {
          _cityName = string;
          await _setCityName();
        },
        decoration: AppInputDecoration.setCityInputDecoration,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
