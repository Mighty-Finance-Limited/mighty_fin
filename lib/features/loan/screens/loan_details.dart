import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_fin/features/dashboard/dashboard.dart';
import '../../../utils/utils.dart';
import '../widgets/repayment_date_widget.dart';

class LoanDetailsScreen extends StatelessWidget {
  LoanDetailsScreen({super.key});

  final List<Map<String, dynamic>> loanRepaymentTotal = [
    {"id": 1, "title": "Loan Amount", "amount": 5000},
    {"id": 2, "title": "Monthly Installments", "amount": 5000},
    {"id": 3, "title": "Next Repayment", "amount": 15000},
    {"id": 4, "title": "Tenure (months)", "amount": 5},
    {"id": 5, "title": "Service Fee", "amount": 3000},
    {"id": 6, "title": "Approved Amount", "amount": 25000},
  ].toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppValues.appBarHeight),
        child: SharedAppBarWidget(
          leadingWidget: const CustomCircleBackBtnWidget(
            filledBg: scaffoldPrimary,
            filledIconColor: secondaryBtnPrimary,
          ),
          appBarTitle: "Loan Details",
          onPressed: () {},
          showLeading: false,
        ),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        // height: 80,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              secondaryBtnAmber,
            ),
          ),
          onPressed: () {},
          child: Text(
            "Repay",
            style: GoogleFonts.montserrat(
              color: textWhite,
              fontWeight: FontWeight.bold,
              // fontSize: 18,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primary,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: white,
                      ),
                    ),
                    title: const Text(
                      'GRZ Loan - Currently Open',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textPrimary,
                          fontSize: 15),
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Badge(
                                label: Icon(
                                  Icons.check,
                                  size: 10,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.green,
                              ),
                              Text(
                                "Open",
                                style: TextStyle(
                                  color: textWhite,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          " Initial date: 07/01/2024",
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                          style: GoogleFonts.montserrat(color: textPrimary),
                          TextSpan(
                              text: "1",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              children: [
                                TextSpan(
                                  text: "\n Expected\n Installment",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                )
                              ])),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Text(
                          "K5400",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const RepaymentDateWIdget(
                        horizontalPadding: 0,
                        color: textWhite,
                      ),
                      Text(
                        "Initial date: 07/01/2024",
                        style: GoogleFonts.montserrat(
                          color: textWhite,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomHeadingWidget(text: "Loan Information"),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: loanRepaymentTotal.length,
            (context, index) {
              final loan = loanRepaymentTotal[index];
              return ListTile(
                title: Text(
                  loan["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: textPrimary,
                  ),
                ),
                trailing: Text(
                  loan["amount"].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: textPrimary,
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
