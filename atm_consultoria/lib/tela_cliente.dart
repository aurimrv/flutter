import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key});

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Cliente"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("images/detalhe_cliente.png"),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Clientes",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset("images/cliente1.png")
              ),
              const Text("Empresa de Software"),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Image.asset("images/cliente2.png")
              ),
              const Text("Empresa de Auditoria"),
            ],
          ),
        ),
      ),
    );
  }
}
