import 'package:flutter/material.dart';

class TitleAndSalesInfoWidget extends StatelessWidget {
    final int counter;
  final VoidCallback incrementCounter;
  final VoidCallback decrementCounter;

  TitleAndSalesInfoWidget({
    required this.counter,
    required this.incrementCounter,
    required this.decrementCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22, top: 10),
                                  child: Text(
                                    "Rubber Fig Plant",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                          height: 20,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 15, 39, 33),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "776 sold",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(255, 0, 118, 61),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star_half_rounded,
                                            color: Color.fromARGB(255, 0, 118, 61),
                                            size: 15,
                                          ),
                                          label: Text(
                                            "4.6 (7000 reviews)",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Color.fromARGB(255, 0, 118, 61),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Text(
                              " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing dnlsfnslnfskfnklsfnsnl",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                                    child: Text(
                                      "Quantity",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          width: 40,
          child: ElevatedButton(
            onPressed: decrementCounter,
            child: Text(
              '-',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Color.fromARGB(255, 53, 56, 63),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 53, 56, 63),
          height: 35,
          width: 20,
          alignment: Alignment.center,
          child: Text(
            '$counter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 35,
          width: 40,
          child: ElevatedButton(
            onPressed: incrementCounter,
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Color.fromARGB(255, 53, 56, 63),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total price",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 5),
                                child: Text(
                                  "\$72",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15, bottom: 10),
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 0, 118, 61),
                              ),
                              icon: Icon(
                                size: 17,
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
