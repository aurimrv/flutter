import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({super.key});

  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("images/detalhe_empresa.png"),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Sobre a Empresa",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum augue id tempus faucibus. Integer viverra risus dapibus iaculis porttitor. Nam aliquam diam eget dignissim scelerisque. Fusce consequat porta eros quis lobortis. Aliquam sed erat ac neque elementum interdum pretium id augue. Etiam a justo vitae ipsum vehicula convallis vitae ac arcu. Morbi venenatis erat dolor, euismod ultrices nisi tristique quis. Vivamus facilisis mauris est, quis porttitor libero ultricies et. Donec vitae risus in leo condimentum scelerisque. Maecenas fermentum euismod turpis nec sagittis. Quisque eget erat in tellus hendrerit suscipit.\n                 Integer a consequat ligula. Maecenas sodales justo quis enim pellentesque, eget imperdiet augue accumsan. Aenean venenatis ligula sed tellus accumsan, eget viverra quam finibus. Praesent odio nisl, tempor ut finibus sodales, maximus vel ipsum. Donec varius lacus ac neque condimentum placerat. Nulla venenatis mauris eget hendrerit pellentesque. Sed non ultrices odio. Pellentesque ut justo et lacus porttitor euismod. Nullam ut risus vel ligula ultricies aliquam at eget quam. Sed est mi, fringilla nec sodales eget, aliquet eget purus. Duis justo risus, pretium at quam ut, efficitur pretium urna.\n                  Aenean id eros non felis porttitor tristique. Sed non elementum neque, vel scelerisque lacus. Cras rutrum pretium viverra. Sed pulvinar dui mauris, vel lobortis sapien sollicitudin vel. Nunc feugiat sodales nisi, et malesuada est ornare ut. Duis lectus ipsum, bibendum a euismod varius, fringilla quis ligula. Nulla eros elit, porta quis eleifend vel, sollicitudin a quam. Quisque a augue id ligula efficitur placerat. Donec aliquam quis tortor a sodales. Nunc in sapien turpis. Nam laoreet ex sit amet posuere fringilla. In fermentum eros enim, sed placerat est tincidunt a. Cras sed ligula efficitur enim pellentesque luctus sed scelerisque velit. Cras posuere vitae ligula sit amet viverra. Mauris rhoncus tortor in augue rutrum laoreet."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
