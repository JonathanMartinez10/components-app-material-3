import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida', 
    'Sit ipsum adipisicing pariatur ad pariatur adipisicing est id esse dolor adipisicing veniam elit.', 
    'assets/images/1.png'
  ),

  SlideInfo(
    'Entrega rapida', 
    'Incididunt consequat laborum consequat culpa sunt quis deserunt quis cillum mollit sit.', 
    'assets/images/2.png'
  ),

  SlideInfo(
    'Disfruta la comida', 
    'In aliquip incididunt fugiat reprehenderit ea.', 
    'assets/images/3.png'
  ),


];

class AppTutoralScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

  const AppTutoralScreen({super.key});

  @override
  State<AppTutoralScreen> createState() => _AppTutoralScreenState();
}

class _AppTutoralScreenState extends State<AppTutoralScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;

      if(!endReached && page >=  (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }

     });
  }


  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                slideData.title, 
                slideData.caption, 
                slideData.imageUrl
              )
            ).toList(),          
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: ()=> context.pop(), 
              child: const Text('Salir')
            )
          ),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () =>  context.pop,
                child: const Text('Comenzar'),
              ),
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
    this.title, 
    this.caption, 
    this.imageUrl
  );

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 20,),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),
    );
  }
}