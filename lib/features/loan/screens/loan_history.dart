import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_fin/features/features.dart';
import 'package:mighty_fin/features/loan/screens/loan_details.dart';
import 'package:mighty_fin/utils/widgets/custom_row_text_widget.dart';
import '../../../utils/utils.dart';

class LoanHistoryScreen extends StatelessWidget {
  // final List<LoanHistory> loanHistory;
  LoanHistoryScreen({super.key});

  final List<LoanHistory> loanHistory = [
    LoanHistory(
        id: 1,
        title: "GRZ Loan",
        date: "07/08/2024",
        amount: 5000,
        isGRZ: true),
    LoanHistory(
        id: 2,
        title: "Business Loan",
        date: "10/05/2023",
        amount: 15000,
        isGRZ: false),
    LoanHistory(
        id: 3,
        title: "GRZ Loan",
        date: "02/07/2024",
        amount: 10000,
        isGRZ: true),
    LoanHistory(
        id: 4,
        title: "Business Loan",
        date: "21/08/2024",
        amount: 25000,
        isGRZ: false),
    LoanHistory(
        id: 5,
        title: "GRZ Loan",
        date: "11/09/2022",
        amount: 8000,
        isGRZ: true),
    LoanHistory(
        id: 6,
        title: "GRZ Loan",
        date: "17/08/2024",
        amount: 30000,
        isGRZ: true),
    LoanHistory(
        id: 7,
        title: "GRZ Loan",
        date: "14/04/2024",
        amount: 9000,
        isGRZ: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: scaffoldPrimary,
        automaticallyImplyLeading: false,
        title: Text(
          "Loan History",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: textPrimary,
          ),
        ),
        iconTheme: const IconThemeData(
          size: 30,
          color: secondaryBtnPrimary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Text(
                          "- K400",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoanDetailsScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "See More",
                          style: TextStyle(
                            color: textAmber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const RepaymentDateWIdget(),
                const SizedBox(
                  height: 5,
                ),
                const Chip(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: lightPrimary,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  backgroundColor: lightPrimary,
                  label: Text(
                    "Repayment date: 30/03/2024",
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: const Icon(
                        Icons.search_outlined,
                        color: primary,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: borderGrey,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: borderGrey,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomRowTextWidget(
                  leftText: "Loan History",
                  rightText: "This Year",
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return LoanHistoryTileWidget(loanHistory: loanHistory[index]);
              },
              childCount: loanHistory.length,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const CustomRowTextWidget(
                rightText: "Last Year",
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return LoanHistoryTileWidget(loanHistory: loanHistory[index]);
              },
              childCount: loanHistory.length,
            ),
          ),
        ],
      ),
    );
  }
}
