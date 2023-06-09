import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/core/utils/assets/app_data.dart';
import 'package:traveling_app/simple_bloc_observer.dart';

import 'core/utils/models/trip.dart';
import 'features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/views/login_screen.dart';
import 'features/auth/presentation/views/signup_screen.dart';
import 'features/home/presentation/views/category_trips_screen.dart';
import 'features/home/presentation/views/filters_screen.dart';
import 'features/home/presentation/views/tabs_screen.dart';
import 'features/trip_details/presentation/views/trip_detail_screen.dart';


void main() async{
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          Trips_data.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFovarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', 'AE'), // English, no country code
        ],
        title: 'Travel App',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            hintColor: Colors.amber,
            fontFamily: 'ElMessiri',
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline5: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.bold,
                  ),
                  headline6: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.bold,
                  ),
                )),
        // home: CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/':(ctx) => SignUpScreen(),
          TabsScreen.id: (ctx) => TabsScreen(_favoriteTrips),
          CategoryTripsScreen.screenRoute: (ctx) =>
              CategoryTripsScreen(_availableTrips),
          TripDetailScreen.screenRoute: (ctx) =>
              TripDetailScreen(_manageFavorite, _isFovarite),
          FiltersScreen.screenRoute: (ctx) =>
              FiltersScreen(_filters, _changeFilters),
          SignUpScreen.id:(context) =>SignUpScreen(),
          LoginScreen.id:(context) => LoginScreen(),
        },
      ),
    );
  }
}
