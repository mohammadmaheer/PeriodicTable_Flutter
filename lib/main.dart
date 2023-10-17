import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const PeriodicTableApp());
}

class Element {
  final String symbol;

  Element({
    required this.symbol,
  });
}

class PeriodicTable {
  final List<List<Element?>> table = [
    [
      Element(symbol: "H"),
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      Element(symbol: "He")
    ],

    [
      Element(symbol: "Li"),
      Element(symbol: "Be"),
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      Element(symbol: "B"),
      Element(symbol: "C"),
      Element(symbol: "N"),
      Element(symbol: "O"),
      Element(symbol: "F"),
      Element(symbol: "Ne")
    ],

    [
      Element(symbol: "Na"),
      Element(symbol: "Mg"),
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      Element(symbol: "Al"),
      Element(symbol: "Si"),
      Element(symbol: "P"),
      Element(symbol: "S"),
      Element(symbol: "Cl"),
      Element(symbol: "Ar"),
    ],

    [
      Element(symbol: "K"),
      Element(symbol: "Ca"),
      Element(symbol: "Sc"),
      Element(symbol: "Ti"),
      Element(symbol: "V"),
      Element(symbol: "Cr"),
      Element(symbol: "Mn"),
      Element(symbol: "Fe"),
      Element(symbol: "Co"),
      Element(symbol: "Ni"),
      Element(symbol: "Cu"),
      Element(symbol: "Zn"),
      Element(symbol: "Ga"),
      Element(symbol: "Ge"),
      Element(symbol: "As"),
      Element(symbol: "Se"),
      Element(symbol: "Br"),
      Element(symbol: "Kr"),
    ],

    // Row 5
    [
      Element(symbol: "Rb"),
      Element(symbol: "Sr"),
      Element(symbol: "Y"),
      Element(symbol: "Zr"),
      Element(symbol: "Nb"),
      Element(symbol: "Mo"),
      Element(symbol: "Tc"),
      Element(symbol: "Ru"),
      Element(symbol: "Rh"),
      Element(symbol: "Pd"),
      Element(symbol: "Ag"),
      Element(symbol: "Cd"),
      Element(symbol: "In"),
      Element(symbol: "Sn"),
      Element(symbol: "Sb"),
      Element(symbol: "Te"),
      Element(symbol: "I"),
      Element(symbol: "Xe"),
    ],

    [
      Element(symbol: "Cs"),
      Element(symbol: "Ba"),
      Element(symbol: "La"),
      Element(symbol: "Hf"),
      Element(symbol: "Ta"),
      Element(symbol: "W"),
      Element(symbol: "Re"),
      Element(symbol: "Os"),
      Element(symbol: "Ir"),
      Element(symbol: "Pt"),
      Element(symbol: "Au"),
      Element(symbol: "Hg"),
      Element(symbol: "Tl"),
      Element(symbol: "Pb"),
      Element(symbol: "Bi"),
      Element(symbol: "Po"),
      Element(symbol: "At"),
      Element(symbol: "Rn"),
    ],

    [
      Element(symbol: "Fr"),
      Element(symbol: "Ra"),
      Element(symbol: "Ac"),
      Element(symbol: "Rf"),
      Element(symbol: "Db"),
      Element(symbol: "Sg"),
      Element(symbol: "Bh"),
      Element(symbol: "Hs"),
      Element(symbol: "Mt"),
      Element(symbol: "Ds"),
      Element(symbol: "Rg"),
      Element(symbol: "Cn"),
      Element(symbol: "Nh"),
      Element(symbol: "Fl"),
      Element(symbol: "Mc"),
      Element(symbol: "Lv"),
      Element(symbol: "Ts"),
      Element(symbol: "Og"),
    ],

    [
      null,
      null,
      null,
      Element(symbol: "Ce"),
      Element(symbol: "Pr"),
      Element(symbol: "Nd"),
      Element(symbol: "Pm"),
      Element(symbol: "Sm"),
      Element(symbol: "Eu"),
      Element(symbol: "Gd"),
      Element(symbol: "Tb"),
      Element(symbol: "Dy"),
      Element(symbol: "Ho"),
      Element(symbol: "Er"),
      Element(symbol: "Tm"),
      Element(symbol: "Yb"),
      Element(symbol: "Lu"),
      null,
    ],

    [
      null,
      null,
      null,
      Element(symbol: "Th"),
      Element(symbol: "Pa"),
      Element(symbol: "U"),
      Element(symbol: "Np"),
      Element(symbol: "Pu"),
      Element(symbol: "Am"),
      Element(symbol: "Cm"),
      Element(symbol: "Bk"),
      Element(symbol: "Cf"),
      Element(symbol: "Es"),
      Element(symbol: "Fm"),
      Element(symbol: "Md"),
      Element(symbol: "No"),
      Element(symbol: "Lr"),
      null,
    ],
  ];
}

class PeriodicTableApp extends StatelessWidget {
  const PeriodicTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Periodic Table'),
        ),
        body: ElementGrid(),
      ),
    );
  }
}

class ElementGrid extends StatelessWidget {
  final PeriodicTable periodicTable = PeriodicTable();

  ElementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: periodicTable.table[0].length, // Number of columns
        ),
        itemCount: periodicTable.table.length * periodicTable.table[0].length,
        itemBuilder: (context, index) {
          final row = index ~/ periodicTable.table[0].length;
          final col = index % periodicTable.table[0].length;
          final element = periodicTable.table[row][col];

          if (element != null) {
            return ElementCell(element: element);
          } else {
            return const EmptyCell();
          }
        },
      ),
    );
  }
}

class ElementCell extends StatelessWidget {
  final Element element;

  const ElementCell({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(element.symbol),
      ),
    );
  }
}

class EmptyCell extends StatelessWidget {
  const EmptyCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // You can customize the appearance of empty cells
    );
  }
}
