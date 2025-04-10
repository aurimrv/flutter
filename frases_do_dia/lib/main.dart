import "package:flutter/material.dart";
import "dart:math";

void main(){
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _phrases = [
    "A força não provém da capacidade física. Provém de uma vontade indomável. (Mahatma Gandhi)",
    "O pessimista se queixa do vento, o otimista espera que ele mude e o realista ajusta as velas. (William George Ward)",
    "O pessimista vê dificuldade em cada oportunidade; o otimista vê oportunidade em cada dificuldade. (Winston Churchill)",
    "O otimista erra tanto quanto o pessimista, mas não sofre por antecipação. (Fernando Sabino)",
    "É sempre melhor ser otimista do que ser pessimista. Até que tudo dê errado, o otimista sofreu menos. (Armando Nogueira)",
    "Descubra aquilo que há de bom dentro de você. Procure, acima de tudo, ser gente. (Charles Chaplin)",
    "Subdesenvolvimento não se improvisa. É obra de séculos. (Nelson Rodrigues) E idiotas. (Silvio Meira)",
    "Se seus sonhos estiverem nas nuvens, não se preocupe... eles estão no lugar certo! Construa agora os alicerces! (William Shakespeare)",
    "Obstáculos são aquilo que vemos quando afastamos nossos olhos do objetivo. (Henry Ford)",
    "Education is the most powerful weapon which you can use to change the world.  (Nelson Mandela)",
    "Somente os que decidem abandonar o chão é que podem voar. (Charles Petzold)",
    "Pessoas normais falam sobre coisas, pessoas inteligentes falam sobre idéias, pessoas mesquinhas falam sobre pessoas. (Platão)",
    "Visite os amigos com frequência. O mato cresce depressa em caminhos pouco percorridos. (Provérbio Escandinavo)",
    "Quem decide pode errar. Quem não decide já errou. (Herbert Von Karajan)",
    "Todas as grandes idéias são perigosas. (Oscar Wilde)",
    "Sempre que uma mulher faz o melhor que pode, deve fazer duas vezes melhor que o homem para ser considerada apenas 50% à sua altura. Ainda bem que não é difícil. (Charlotte Whitton)",
    "Os espelhos são usados para ver o rosto; a arte para ver a alma. (George Bernard Shaw)",
    "Eu não me envergonho de corrigir meus erros e mudar as opiniões, porque não me envergonho de raciocinar e aprender. (Alexandre Herculano)",
    "O verdadeiro significado das coisas é encontrado ao se dizerem as mesmas coisas com outras palavras. (Charles Chaplin)",
    "A única coisa que interfere com meu aprendizado é a minha educação. (Albert Eisntein)",
    "Educação é o que resta depois de ter esquecido tudo que se aprendeu na escola. (Albert Einstein)",
    "A imaginação é mais importante que o conhecimento. (Albert Einstein)",
    "A teoria sempre acaba, mais cedo ou mais tarde, assassinada pela experiência. (Albert Einstein)",
    "A morte do homem começa no instante em que ele desiste de aprender. (Albino Teixeira)",
    "Experiência não é o que acontece com um homem; é o que um homem faz com o que lhe acontece. (Aldous Huxley)",
    "Daqui a cinco anos você estará bem próximo de ser a mesma pessoa que é hoje, exceto por duas coisas: os livros que ler e as pessoas de quem se aproximar. (Charles Jones)",
    "Duvidemos até mesmo da própria dúvida. (Anatole France)",
    "Toda a arte de ensinar é apenas a arte de acordar a curiosidade natural nas mentes jovens, com o propósito de serem satisfeitas mais tarde. (Anatole France)",
    "Educação nunca foi despesa. Sempre foi investimento com retorno garantido. (Arthur Lewis)",
    "Investir em conhecimentos rende sempre melhores juros. (Benjamin Franklin)",
    "A escola é uma instituição financeira que vende diplomas, o aluno é o consumidor interessado em comprar o diploma e o professor é o cara que quer atrapalhar as negociações. (autor desconhecido)",
    "Os verdadeiros analfabetos são os que aprenderam a ler e não lêem. (Mário Quintana)",
    "Por que cometer erros antigos se há tantos erros novos a escolher? (Bertrand Russel)",
    "Se você quer os acertos, esteja preparado para os erros. (Carl Yastrzemski)",
    "Deus nos concede, a cada dia, uma página de vida nova no livro do tempo. Aquilo que colocarmos nela, corre por nossa conta. (Chico Xavier)",
    "Conhecimento real é saber a extensão da própria ignorância. (Confúcio)",
    "Só sei que nada sei. (Sócrates)",
    "Feliz aquele que transfere o que sabe e aprende o que ensina. (Cora Coralina)",
    "O que vale na vida não é o ponto de partida e sim a caminhada. Caminhando e semeando, no fim terás o que colher. (Cora Coralina)",
    "Todos estamos matriculados na escola da vida, onde o mestre é o tempo. (Cora Coralina)",
    "Concedei-nos, Senhor, a serenidade necessária para aceitar as coisas que não podemos modificar, coragem para modificar aquelas que podemos e sabedoria para distinguir umas das outras. (Reinhold Niebuhr)",
    "O importante da educação é o conhecimento, não dos fatos mas dos valores. (Dean William R. Inge)",
    "Toda pessoa que encontro é superior a mim em alguma coisa. Por isso, dela sempre aprendo alguma coisa. (Ralph Waldo Emerson)",
    "Fale o que você pensa hoje em palavras tão enérgicas quando balas de canhão, e amanhã fale o que você pensar amanhã em palavras enérgicas novamente, mesmo que isso contradiga o que você disse hoje. (Ralph Waldo Emerson)",
    "Conhecimento é poder. (Francis Bacon)",
    "Você não pode ensinar nada a um homem; você pode apenas ajudá-lo a encontrar a resposta dentro dele mesmo. (Galileu Galilei)",
    "Nunca encontrei uma pessoa tão ignorante que não pudesse ter aprendido algo com sua ignorância. (Galileu Galilei)",
    "Você vê coisas e diz: Por que?; mas eu sonho coisas que nunca existiram e digo: Por que não? (George Bernard Shaw)",
    "Um professor influi para a eternidade; nunca se pode dizer até onde vai sua influência. (Henry B. Adams)",
    "Quanto mais aumenta nosso conhecimento, mais evidente fica nossa ignorância. (John Kennedy)",
    "O importante da educação não é apenas formar um mercado de trabalho, mas formar uma nação, com gente capaz de pensar. (José Arthur Giannotti)",
    "Aprender é a única coisa de que a mente nunca se cansa, nunca tem medo e nunca se arrepende. (Leonardo da Vinci)",
    "Aprenda com os erros alheios. Não viverá o bastante para cometer todos os erros. (Martin Vanbee)",
    "O futuro das organizações - e nações - dependerá cada vez mais de sua capacidade de aprender coletivamente. (Peter Senge)",
    "Assim como a cera, naturalmente dura e rígida, torna-se, com um pouco de calor tão moldável que se pode levá-la a tomar a forma que se desejar, também se pode, com um pouco de cortesia e amabilidade, conquistar os obstinados e os hostis. (Schopnhauer)",
    "Sábio é aquele que conhece os limites da própria ignorância. (Sócrates)",
    "If logical thinking is an accident, is it trustworthy? (Dean L. Overman)",
    "The most incomprehensible thing about the world is that it is comprehensible. (Albert Einstein)",
    "Não é triste mudar de idéia, triste é não ter idéias para mudar. (Barão de Itararé)",
    "Não existe uma fórmula para o sucesso. Mas, para o fracasso, há uma infalível: tentar agradar a todo mundo. (Herbert Bayard Swope)",
    "Feliz de quem atravessa a vida inteira tendo mil razões para viver. (Dom Hélder Câmara)",
    "A arte de viver consiste em tirar o maior bem do maior mal. (Machado de Assis)",
    "O cérebro é como um pára-quedas. Só funciona quando está aberto. (Sir James Dewar)",
    "A melhor maneira de ter uma boa idéia é ter muitas idéias. (Linus Pauling)",
    "Algo só é impossível até que alguém duvide e acabe provando o contrário. (Albert Einstein)",
    "Um professor afeta a eternidade; é impossível dizer até onde vai sua influência. (Henry Adams)",
    "Não sabendo que era impossível, ele foi lá e fez. (Jean Cocteau)",
    "Tell me and I may forget. Show me and I may remember. Involve me and I will understand. (Chinese proverb)",
    "Mude, mas comece devagar. A direção é mais importante do que a velocidade... (Clarice Linspector)",
    "Quando falares, cuida para que tuas palavras sejam melhores do que o teu silêncio, e lembre-se que alto deve ser o valor de suas ideias, não o volume de sua voz. Falar sem pensar é disparar sem apontar. (George Herbert)",
    "Quando as pessoas querem o impossível, somente os mentirosos podem satisfaze-las. (Thomas Sowell)",
    "Somos essencialmente profissionais do sentido. Educamos, quando ensinamos com sentido. Educar é impregnar de sentido a vida. A profissão docente está centrada na vida, no bem querer. (Gilberto Teixeira)",
    "In the middle of every difficulty lies opportunity. (Albert Einstein)",
  ];
  var _generatedPhrase = "Clique abaixo para gerar uma frase";

  void _generatePhrase() {
    var randomNumber = Random().nextInt(_phrases.length);
    setState(() {
      _generatedPhrase = _phrases[randomNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          //width: double.infinity, // forma de ocupar toda largura
          /*decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.amber),
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Text(
                _generatedPhrase,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black
                ),
              ),
              ElevatedButton(
                  onPressed: _generatePhrase,
                  child: const Text(
                    "Nova Frase",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
